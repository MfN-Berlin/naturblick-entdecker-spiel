#!/usr/bin/env python3
# Copyright © 2026 Museum für Naturkunde Berlin.
# This code is licensed under MIT license (see LICENSE.txt for details)
"""
Synchronisiert die Artdaten zwischen SpeciesList.swift und einer Excel-Tabelle.

  push <datei.xlsx>   SpeciesList.swift ist gültig  -> Excel-Tabelle erzeugen
  pull <datei.xlsx>   Excel-Tabelle ist gültig      -> SpeciesList.swift erzeugen

Das Tabellenformat ist dasselbe wie in der Android-App (naturblick-leicht-android),
eine Tabelle kann also für beide Apps verwendet werden.

Aufruf über scripts/species-sync (legt beim ersten Mal ein venv mit openpyxl an).
"""

from __future__ import annotations

import argparse
import re
import sys
from dataclasses import dataclass, field
from pathlib import Path

from openpyxl import Workbook, load_workbook
from openpyxl.styles import Alignment as XlAlignment, Font
from openpyxl.worksheet.datavalidation import DataValidation
from openpyxl.worksheet.table import Table, TableStyleInfo

ROOT = Path(__file__).resolve().parent.parent
APP_DIR = ROOT / "naturblick-entdecker-spiel"
SPECIES_LIST = APP_DIR / "Data/SpeciesList.swift"
IMAGES_DIR = APP_DIR / "Assets.xcassets/Species"
AUDIO_DIR = APP_DIR / "Resources/Audio"

# Namen wie in der Tabelle/Android (Großbuchstaben) -> Swift-Enum-Fall
GENDERS = {"MASCULINE": "der", "FEMININE": "die", "NEUTRUM": "das"}
SEASONS = {"SPRING": "Frühling", "SUMMER": "Sommer", "AUTUMN": "Herbst", "WINTER": "Winter"}
ALIGNMENTS = ["TopStart", "TopCenter", "TopEnd", "CenterStart", "Center", "CenterEnd",
              "BottomStart", "BottomCenter", "BottomEnd"]
TYPE_DESCRIPTION = "Beschreibung"
TYPE_TIP = "Tipp"
YES, NO = "ja", "nein"


# ---------------------------------------------------------------------------
# Datenmodell
# ---------------------------------------------------------------------------

@dataclass
class Image:
    file: str
    author: str
    url: str
    license: str
    author_url: str | None = None
    caption: str | None = None
    alignment: str = ""  # "" = Center, Name aus ALIGNMENTS oder "x, y"


@dataclass
class Audio:
    name: str
    license: str
    author: str


def slug(name):
    """Dateiname aus dem Artnamen: Kleinbuchstaben, ä→ae usw., nur a-z und 0-9."""
    name = name.lower()
    for umlaut, replacement in (("ä", "ae"), ("ö", "oe"), ("ü", "ue"), ("ß", "ss")):
        name = name.replace(umlaut, replacement)
    return re.sub(r"[^a-z0-9]", "", name)


@dataclass
class Species:
    id: int
    name: str
    gender: str  # GENDERS-Schlüssel, z. B. "FEMININE"
    season: str  # SEASONS-Schlüssel, z. B. "SPRING"
    difficult: bool
    description: list[str] = field(default_factory=list)  # **fett** als Markdown
    tips: list[str] = field(default_factory=list)
    images: list[Image] = field(default_factory=list)
    audio: Audio | None = None

    @property
    def image_sq(self):
        return f"{slug(self.name)}_sq"

    @property
    def audio_file(self):
        return f"{slug(self.name)}.mp3"


class DataError(Exception):
    pass


def swift_case(name):
    """"TopCenter" -> "topCenter", "FEMININE" -> "feminine"."""
    if name.isupper():
        return name.lower()
    return name[0].lower() + name[1:]


def from_swift_case(name, choices):
    for c in choices:
        if swift_case(c) == name:
            return c
    return None


# ---------------------------------------------------------------------------
# Swift einlesen (kleiner Parser für den Ausdruck "let speciesList ... = [ ... ]")
# ---------------------------------------------------------------------------

TOKEN_RE = re.compile(r'''
    (?P<ws>\s+|//[^\n]*|/\*.*?\*/)
  | (?P<str>"(?:\\.|[^"\\\n])*")
  | (?P<num>\d+(?:\.\d+)?)
  | (?P<id>[A-Za-z_][A-Za-z0-9_]*)
  | (?P<op>[()\[\]{}:,.=\-<>$!?])
''', re.S | re.X)


def tokenize(src, offset_line=0):
    pos, tokens = 0, []
    while pos < len(src):
        m = TOKEN_RE.match(src, pos)
        if not m:
            line = src.count("\n", 0, pos) + 1 + offset_line
            raise DataError(f"SpeciesList.swift Zeile {line}: unerwartetes Zeichen {src[pos]!r}")
        kind = m.lastgroup
        if kind != "ws":
            tokens.append((kind, m.group(), src.count("\n", 0, pos) + 1 + offset_line))
        pos = m.end()
    tokens.append(("eof", "", -1))
    return tokens


SWIFT_ESCAPES = {"n": "\n", "t": "\t", "r": "\r", "0": "\0", "\\": "\\", '"': '"', "'": "'"}


def unescape_swift(lit, line):
    def repl(m):
        esc = m.group(1)
        if esc.startswith("u{"):
            return chr(int(esc[2:-1], 16))
        if esc == "(":
            raise DataError(f"SpeciesList.swift Zeile {line}: String-Interpolation \\( ) wird nicht unterstützt")
        if esc not in SWIFT_ESCAPES:
            raise DataError(f"SpeciesList.swift Zeile {line}: unbekannte Escape-Sequenz \\{esc}")
        return SWIFT_ESCAPES[esc]
    return re.sub(r'\\(u\{[0-9A-Fa-f]+\}|.)', repl, lit[1:-1])


@dataclass
class Call:
    name: str
    args: list  # (label | None, expr)
    line: int = 0


@dataclass
class EnumCase:
    name: str  # ".feminine" -> "feminine"
    args: list | None = None  # z. B. .bias(x: 0, y: -0.4)


class Null:
    pass


class Parser:
    def __init__(self, tokens):
        self.t, self.i = tokens, 0

    def peek(self, offset=0):
        return self.t[self.i + offset]

    def take(self, value=None):
        tok = self.t[self.i]
        if value is not None and tok[1] != value:
            raise DataError(f"SpeciesList.swift Zeile {tok[2]}: erwartet {value!r}, gefunden {tok[1]!r}")
        self.i += 1
        return tok

    def args(self):
        self.take("(")
        result = []
        while self.peek()[1] != ")":
            label = None
            if self.peek()[0] == "id" and self.peek(1)[1] == ":":
                label = self.take()[1]
                self.take(":")
            result.append((label, self.expr()))
            if self.peek()[1] != ")":
                self.take(",")
        self.take(")")
        return result

    def array(self):
        self.take("[")
        items = []
        while self.peek()[1] != "]":
            items.append(self.expr())
            if self.peek()[1] != "]":
                self.take(",")
        self.take("]")
        return items

    def expr(self):
        kind, value, line = self.peek()
        if kind == "str":
            self.take()
            return unescape_swift(value, line)
        if value == "-" or kind == "num":
            sign = self.take()[1] if value == "-" else ""
            return float(sign + self.take()[1])
        if value == "[":
            return self.array()
        if value == ".":
            self.take(".")
            name = self.take()[1]
            args = self.args() if self.peek()[1] == "(" else None
            return EnumCase(name, args)
        if kind == "id":
            self.take()
            if value == "nil":
                return Null()
            if value in ("true", "false"):
                return value == "true"
            if self.peek()[1] == "(":
                return Call(value, self.args(), line)
        raise DataError(f"SpeciesList.swift Zeile {line}: unerwartetes {value!r}")


def bind(call, params):
    """Benannte Argumente einem dict zuordnen."""
    result = {}
    for label, value in call.args:
        if label not in params:
            raise DataError(f"SpeciesList.swift Zeile {call.line}: unbekanntes Argument {label!r} in {call.name}")
        result[label] = value
    return result


def as_str(node, what, optional=False):
    if isinstance(node, str):
        return node
    if optional and (node is None or isinstance(node, Null)):
        return None
    raise DataError(f"{what}: Text erwartet, gefunden {node!r}")


def as_list(node, what):
    if isinstance(node, list):
        return node
    raise DataError(f"{what}: Array [...] erwartet")


def as_enum(node, choices, what):
    if isinstance(node, EnumCase) and node.args is None:
        value = from_swift_case(node.name, choices)
        if value is not None:
            return value
    raise DataError(f"{what}: einer von {', '.join('.' + swift_case(c) for c in choices)} erwartet")


def alignment_to_str(node, what):
    if isinstance(node, EnumCase) and node.args is None:
        name = from_swift_case(node.name, ALIGNMENTS)
        if name is not None:
            return "" if name == "Center" else name
    if isinstance(node, EnumCase) and node.name == "bias" and node.args:
        values = dict(node.args)
        if set(values) == {"x", "y"}:
            return f"{fmt_float(values['x'])}, {fmt_float(values['y'])}"
    raise DataError(f"{what}: .topCenter usw. oder .bias(x: …, y: …) erwartet")


def fmt_float(v):
    return f"{v:g}"


def read_swift(path=SPECIES_LIST):
    src = path.read_text(encoding="utf-8")
    start = src.find("let speciesList")
    if start < 0:
        raise DataError("SpeciesList.swift: 'let speciesList' nicht gefunden")
    eq = src.find("=", start)
    tokens = tokenize(src[eq + 1:], src.count("\n", 0, eq))
    root = Parser(tokens).expr()
    species = []
    for node in as_list(root, "speciesList"):
        if not isinstance(node, Call) or node.name != "Species":
            raise DataError("speciesList: Species(...) erwartet")
        a = bind(node, ["id", "name", "gender", "description", "tips", "squareImage",
                        "images", "audio", "season", "isDifficult"])
        name = as_str(a["name"], "name")
        what = f"Art {name!r}"
        s = Species(
            id=int(a["id"]),
            name=name,
            gender=as_enum(a["gender"], GENDERS, what),
            season=as_enum(a["season"], SEASONS, what),
            difficult=a.get("isDifficult") is True,
            description=[as_str(d, what) for d in as_list(a["description"], what)],
            tips=[as_str(t, what) for t in as_list(a["tips"], what)],
        )
        image_sq = as_str(a["squareImage"], what)
        if image_sq != s.image_sq:
            raise DataError(f"{what}: quadratisches Bild muss \"{s.image_sq}\" heißen, ist \"{image_sq}\"")
        for img in as_list(a["images"], what):
            if not isinstance(img, Call) or img.name != "SpeciesImage":
                raise DataError(f"{what}: SpeciesImage(...) erwartet")
            b = bind(img, ["file", "author", "url", "license", "authorURL", "caption", "alignment"])
            s.images.append(Image(
                file=as_str(b["file"], what),
                author=as_str(b["author"], what),
                url=as_str(b["url"], what),
                license=as_str(b["license"], what),
                author_url=as_str(b.get("authorURL"), what, optional=True),
                caption=as_str(b.get("caption"), what, optional=True),
                alignment=alignment_to_str(b["alignment"], what) if "alignment" in b else "",
            ))
        audio = a.get("audio")
        if audio is not None and not isinstance(audio, Null):
            if not isinstance(audio, Call) or audio.name != "AudioAsset":
                raise DataError(f"{what}: AudioAsset(...) erwartet")
            c = bind(audio, ["file", "name", "license", "author"])
            audio_file = as_str(c["file"], what)
            if audio_file != s.audio_file:
                raise DataError(f"{what}: Audio-Datei muss {s.audio_file} heißen, ist {audio_file}")
            s.audio = Audio(
                name=as_str(c["name"], what),
                license=as_str(c["license"], what),
                author=as_str(c["author"], what),
            )
        species.append(s)
    return species


# ---------------------------------------------------------------------------
# Swift schreiben
# ---------------------------------------------------------------------------

def sstr(value):
    return '"' + (value.replace("\\", "\\\\").replace('"', '\\"')
                  .replace("\n", "\\n").replace("\t", "\\t")) + '"'


def salignment(value):
    if value in ALIGNMENTS:
        return "." + swift_case(value)
    x, y = (float(v) for v in value.split(","))
    return f".bias(x: {fmt_float(x)}, y: {fmt_float(y)})"


def sarray(items, indent):
    if not items:
        return "[]"
    pad = " " * indent
    return "[\n" + "".join(f"{pad}    {i},\n" for i in items) + pad + "]"


def scall(name, fields, indent):
    pad = " " * indent
    return f"{name}(\n" + ",\n".join(f"{pad}    {f}" for f in fields) + f"\n{pad})"


def render_swift(species):
    out = []
    for s in species:
        images = []
        for img in s.images:
            fields = [
                f"file: {sstr(img.file)}",
                f"author: {sstr(img.author)}",
                f"url: {sstr(img.url)}",
                f"license: {sstr(img.license)}",
            ]
            if img.author_url:
                fields.append(f"authorURL: {sstr(img.author_url)}")
            if img.caption:
                fields.append(f"caption: {sstr(img.caption)}")
            if img.alignment:
                fields.append(f"alignment: {salignment(img.alignment)}")
            images.append(scall("SpeciesImage", fields, 12))
        fields = [
            f"id: {s.id}",
            f"name: {sstr(s.name)}",
            f"gender: .{swift_case(s.gender)}",
            f"description: {sarray([sstr(d) for d in s.description], 8)}",
            f"tips: {sarray([sstr(t) for t in s.tips], 8)}",
            f"squareImage: {sstr(s.image_sq)}",
            f"images: {sarray(images, 8)}",
        ]
        if s.audio:
            a = s.audio
            fields.append("audio: " + scall("AudioAsset", [
                f"file: {sstr(s.audio_file)}",
                f"name: {sstr(a.name)}",
                f"license: {sstr(a.license)}",
                f"author: {sstr(a.author)}",
            ], 8))
        fields.append(f"season: .{swift_case(s.season)}")
        if s.difficult:
            fields.append("isDifficult: true")
        out.append("    " + scall("Species", fields, 4))

    return (
        "import Foundation\n\n"
        "nonisolated let speciesList: [Species] = [\n"
        + "".join(o + ",\n" for o in out)
        + "].sorted { $0.name < $1.name }\n"
    )


# ---------------------------------------------------------------------------
# Excel schreiben (push)
# ---------------------------------------------------------------------------

SHEET_SPECIES = "Arten"
SHEET_TEXTS = "Texte"
SHEET_IMAGES = "Bilder"

COLS_SPECIES = ["ID", "Name", "Artikel", "Jahreszeit", "Schwer", "Audio Titel", "Audio Autor", "Audio Lizenz"]
COLS_TEXTS = ["ID", "Art", "Typ", "Text"]
COLS_IMAGES = ["ID", "Art", "Datei", "Bildunterschrift", "Autor", "Autor-URL", "Quelle", "Lizenz", "Ausrichtung"]

WIDTHS = {"ID": 6, "Name": 18, "Art": 18, "Artikel": 9, "Jahreszeit": 12, "Schwer": 9, "Typ": 14,
          "Text": 90, "Datei": 22, "Bildunterschrift": 32, "Autor": 26,
          "Ausrichtung": 13, "Lizenz": 16, "Audio Lizenz": 16}

HELP = [
    ("So funktioniert die Tabelle", None),
    ("Arten", "Eine Zeile pro Art. Die ID verbindet die Art mit den Zeilen in „Texte“ und „Bilder“."),
    ("", "Das quadratische Bild und die Tonaufnahme werden über den Namen gefunden: aus „Eichhörnchen“ wird"),
    ("", "eichhoernchen_sq (Bild) und eichhoernchen.mp3 (Ton). Wer eine Art umbenennt, muss auch diese Dateien umbenennen."),
    ("", "Audio Titel, Autor und Lizenz nur ausfüllen, wenn es eine Tonaufnahme gibt."),
    ("Texte", "Eine Zeile pro Satz. Die Reihenfolge der Zeilen ist die Reihenfolge in der App."),
    ("", "Typ „Beschreibung“ = Text über die Art, Typ „Tipp“ = Such-Tipp."),
    ("", "Fett schreiben: Wörter in zwei Sternchen setzen, z. B. Regenwürmer haben **keine** Beine."),
    ("Bilder", "Eine Zeile pro Bild, in der Reihenfolge der App. „Datei“ ist der Name ohne Endung (z. B. ameise_1)."),
    ("", "Ausrichtung (optional): leer = Mitte, z. B. TopCenter, oder zwei Zahlen von -1 bis 1, z. B. „0, -0.4“."),
    ("Neue Zeilen", "Bei neuen Zeilen in „Texte“ und „Bilder“ reicht die ID oder der Name der Art in „Art“."),
]


def add_table(ws, name, columns, rows, wrap=()):
    ws.append(columns)
    for row in rows:
        ws.append([("" if v is None else v) for v in row])
    last_row = max(ws.max_row, 2)
    ref = f"A1:{ws.cell(row=1, column=len(columns)).column_letter}{last_row}"
    table = Table(displayName=name, ref=ref)
    table.tableStyleInfo = TableStyleInfo(name="TableStyleMedium2", showRowStripes=True)
    ws.add_table(table)
    ws.freeze_panes = "A2"
    for idx, col in enumerate(columns, start=1):
        letter = ws.cell(row=1, column=idx).column_letter
        ws.column_dimensions[letter].width = WIDTHS.get(col, 30)
        if col in wrap:
            for cell in ws[letter][1:]:
                cell.alignment = XlAlignment(wrap_text=True, vertical="top")


def add_choice(ws, columns, column, choices, strict=True):
    letter = ws.cell(row=1, column=columns.index(column) + 1).column_letter
    dv = DataValidation(type="list", formula1='"' + ",".join(choices) + '"', allow_blank=True,
                        errorStyle="stop" if strict else "warning",
                        error=f"Bitte einen Wert aus der Liste wählen: {', '.join(choices)}")
    ws.add_data_validation(dv)
    dv.add(f"{letter}2:{letter}2000")


def write_excel(species, path):
    wb = Workbook()
    help_ws = wb.active
    help_ws.title = "Hinweise"
    for title, text in HELP:
        help_ws.append([title, text])
        if text is None:
            help_ws.cell(row=help_ws.max_row, column=1).font = Font(bold=True, size=14)
        else:
            help_ws.cell(row=help_ws.max_row, column=1).font = Font(bold=True)
    help_ws.column_dimensions["A"].width = 16
    help_ws.column_dimensions["B"].width = 110

    ws = wb.create_sheet(SHEET_SPECIES)
    add_table(ws, "Arten", COLS_SPECIES, [
        [s.id, s.name, GENDERS[s.gender], SEASONS[s.season], YES if s.difficult else NO,
         *((s.audio.name, s.audio.author, s.audio.license) if s.audio else [None] * 3)]
        for s in species
    ])
    add_choice(ws, COLS_SPECIES, "Artikel", list(GENDERS.values()))
    add_choice(ws, COLS_SPECIES, "Jahreszeit", list(SEASONS.values()))
    add_choice(ws, COLS_SPECIES, "Schwer", [YES, NO])

    ws = wb.create_sheet(SHEET_TEXTS)
    add_table(ws, "Texte", COLS_TEXTS, [
        row for s in species for row in
        [[s.id, s.name, TYPE_DESCRIPTION, d] for d in s.description] + [[s.id, s.name, TYPE_TIP, t] for t in s.tips]
    ], wrap=("Text",))
    add_choice(ws, COLS_TEXTS, "Typ", [TYPE_DESCRIPTION, TYPE_TIP])

    ws = wb.create_sheet(SHEET_IMAGES)
    add_table(ws, "Bilder", COLS_IMAGES, [
        [s.id, s.name, i.file, i.caption, i.author, i.author_url, i.url, i.license, i.alignment]
        for s in species for i in s.images
    ])
    licenses = sorted({i.license for s in species for i in s.images} |
                      {s.audio.license for s in species if s.audio})
    add_choice(ws, COLS_IMAGES, "Lizenz", licenses, strict=False)
    add_choice(wb[SHEET_SPECIES], COLS_SPECIES, "Audio Lizenz", licenses, strict=False)

    wb.active = 1
    wb.save(path)


# ---------------------------------------------------------------------------
# Excel einlesen (pull) mit Prüfungen
# ---------------------------------------------------------------------------

class Report:
    def __init__(self):
        self.errors, self.warnings = [], []

    def error(self, where, msg):
        self.errors.append(f"{where}: {msg}")

    def warn(self, where, msg):
        self.warnings.append(f"{where}: {msg}")


def read_rows(wb, sheet, columns, report):
    if sheet not in wb.sheetnames:
        raise DataError(f"Blatt „{sheet}“ fehlt in der Tabelle")
    ws = wb[sheet]
    header = [str(c.value).strip() if c.value is not None else "" for c in ws[1]]
    missing = [c for c in columns if c not in header]
    if missing:
        raise DataError(f"Blatt „{sheet}“: Spalten fehlen: {', '.join(missing)}")
    index = {c: header.index(c) for c in columns}
    rows = []
    for row_no, row in enumerate(ws.iter_rows(min_row=2, values_only=True), start=2):
        values = {}
        for col, idx in index.items():
            v = row[idx] if idx < len(row) else None
            if isinstance(v, float) and v.is_integer():
                v = int(v)
            if v is not None and not isinstance(v, str):
                v = str(v)
            if isinstance(v, str):
                stripped = " ".join(v.split()) if col not in ("Text",) else v.strip()
                if col == "Text" and "\n" in stripped:
                    report.error(f"{sheet} Zeile {row_no}", "Zeilenumbruch in der Zelle – bitte ein Satz pro Zeile")
                if col == "Text" and "  " in stripped:
                    report.warn(f"{sheet} Zeile {row_no}", "doppeltes Leerzeichen")
                    stripped = re.sub(" {2,}", " ", stripped)
                v = stripped or None
            values[col] = v
        if all(v is None for v in values.values()):
            continue
        rows.append((row_no, values))
    return rows


def image_exists(name):
    return (IMAGES_DIR / f"{name}.imageset" / "Contents.json").exists()


def check_url(value, where, column, report, required=True, allow_mail=False):
    if value is None:
        if required:
            report.error(where, f"„{column}“ fehlt")
        return
    pattern = r"(https?://|mailto:)\S+$" if allow_mail else r"https?://\S+$"
    if not re.match(pattern, value):
        report.error(where, f"„{column}“ ist keine gültige URL: {value}")


def parse_alignment(value, where, report):
    if value is None:
        return ""
    if value in ALIGNMENTS:
        return "" if value == "Center" else value
    # "x, y" mit Dezimalpunkt oder "x; y" (dann auch mit Dezimalkomma)
    parts = value.split(";") if ";" in value else value.split(",")
    if len(parts) == 2:
        try:
            x, y = (float(p.strip().replace(",", ".")) for p in parts)
            if -1 <= x <= 1 and -1 <= y <= 1:
                return f"{fmt_float(x)}, {fmt_float(y)}"
        except ValueError:
            pass
    report.error(where, f"Ausrichtung „{value}“ ungültig (leer, {', '.join(ALIGNMENTS)} oder „x, y“ mit Zahlen von -1 bis 1)")
    return ""


def check_text(text, where, report):
    if text.count("**") % 2:
        report.error(where, f"ungerade Anzahl ** (Fett nicht geschlossen): {text}")
    if not re.search(r"[.!?:]\**$", text):
        report.warn(where, f"endet nicht mit Satzzeichen: {text}")


def read_excel(path):
    report = Report()
    wb = load_workbook(path, data_only=True)
    gender_by_article = {v: k for k, v in GENDERS.items()}
    season_by_name = {v: k for k, v in SEASONS.items()}
    images_rel = IMAGES_DIR.relative_to(ROOT)
    audio_rel = AUDIO_DIR.relative_to(ROOT)

    species, by_id, by_name = [], {}, {}
    for row_no, r in read_rows(wb, SHEET_SPECIES, COLS_SPECIES, report):
        where = f"{SHEET_SPECIES} Zeile {row_no}"
        if r["ID"] is None or not r["ID"].isdigit():
            report.error(where, f"ID fehlt oder ist keine Zahl: {r['ID']}")
            continue
        sid = int(r["ID"])
        if sid in by_id:
            report.error(where, f"ID {sid} doppelt")
            continue
        if r["Name"] is None:
            report.error(where, "Name fehlt")
            continue
        if r["Name"] in by_name:
            report.error(where, f"Name „{r['Name']}“ doppelt")
        if r["Artikel"] not in gender_by_article:
            report.error(where, f"Artikel muss der/die/das sein, ist „{r['Artikel']}“")
        if r["Jahreszeit"] not in season_by_name:
            report.error(where, f"Jahreszeit ungültig: „{r['Jahreszeit']}“")
        if r["Schwer"] not in (None, YES, NO):
            report.error(where, f"Schwer muss ja/nein sein, ist „{r['Schwer']}“")
        s = Species(
            id=sid, name=r["Name"],
            gender=gender_by_article.get(r["Artikel"], "FEMININE"),
            season=season_by_name.get(r["Jahreszeit"], "SPRING"),
            difficult=r["Schwer"] == YES,
        )
        same_slug = next((o for o in species if slug(o.name) == slug(s.name)), None)
        if same_slug is not None and same_slug.name != s.name:
            report.error(where, f"„{s.name}“ und „{same_slug.name}“ ergeben denselben Dateinamen „{slug(s.name)}“")
        if not image_exists(s.image_sq):
            report.error(where, f"quadratisches Bild „{s.image_sq}“ fehlt in {images_rel} (Name kommt aus dem Artnamen)")
        audio_cols = ["Audio Titel", "Audio Autor", "Audio Lizenz"]
        if any(r[c] for c in audio_cols):
            for c in audio_cols:
                if r[c] is None:
                    report.error(where, f"„{c}“ fehlt (Audio ist nur teilweise ausgefüllt)")
            if not (AUDIO_DIR / s.audio_file).exists():
                report.error(where, f"Audio-Datei „{s.audio_file}“ fehlt in {audio_rel} (Name kommt aus dem Artnamen)")
            s.audio = Audio(r["Audio Titel"] or "", r["Audio Lizenz"] or "", r["Audio Autor"] or "")
        elif (AUDIO_DIR / s.audio_file).exists():
            report.warn(where, f"{s.audio_file} liegt in {audio_rel}, aber Audio Titel/Autor/Lizenz sind leer – kein Ton in der App")
        species.append(s)
        by_id[sid] = s
        by_name[s.name] = s

    def resolve(r, where):
        if r["ID"] is not None:
            s = by_id.get(int(r["ID"])) if r["ID"].isdigit() else None
            if s is None:
                report.error(where, f"keine Art mit ID {r['ID']}")
            elif r["Art"] and r["Art"] != s.name:
                report.warn(where, f"Spalte Art „{r['Art']}“ passt nicht zu ID {s.id} ({s.name}) – ID wird verwendet")
            return s
        if r["Art"] is not None:
            s = by_name.get(r["Art"])
            if s is None:
                report.error(where, f"keine Art mit Name „{r['Art']}“")
            return s
        report.error(where, "ID und Art fehlen")
        return None

    for row_no, r in read_rows(wb, SHEET_TEXTS, COLS_TEXTS, report):
        where = f"{SHEET_TEXTS} Zeile {row_no}"
        s = resolve(r, where)
        if r["Text"] is None:
            report.error(where, "Text fehlt")
            continue
        check_text(r["Text"], where, report)
        if s is None:
            continue
        if r["Typ"] == TYPE_DESCRIPTION:
            s.description.append(r["Text"])
        elif r["Typ"] == TYPE_TIP:
            if "**" in r["Text"]:
                report.error(where, "Fettdruck (**) ist in Tipps nicht möglich")
            s.tips.append(r["Text"])
        else:
            report.error(where, f"Typ muss „{TYPE_DESCRIPTION}“ oder „{TYPE_TIP}“ sein, ist „{r['Typ']}“")

    for row_no, r in read_rows(wb, SHEET_IMAGES, COLS_IMAGES, report):
        where = f"{SHEET_IMAGES} Zeile {row_no}"
        s = resolve(r, where)
        if r["Datei"] is None or not image_exists(r["Datei"]):
            report.error(where, f"Bilddatei „{r['Datei']}“ nicht in {images_rel} gefunden")
        for c in ("Autor", "Lizenz"):
            if r[c] is None:
                report.error(where, f"„{c}“ fehlt")
        check_url(r["Quelle"], where, "Quelle", report)
        check_url(r["Autor-URL"], where, "Autor-URL", report, required=False, allow_mail=True)
        alignment = parse_alignment(r["Ausrichtung"], where, report)
        if s is not None:
            s.images.append(Image(r["Datei"] or "", r["Autor"] or "", r["Quelle"] or "", r["Lizenz"] or "",
                                  r["Autor-URL"], r["Bildunterschrift"], alignment))

    for s in species:
        where = f"Art „{s.name}“"
        if not s.description:
            report.error(where, "keine Beschreibung")
        if not s.images:
            report.error(where, "keine Bilder")
        if not s.tips:
            report.warn(where, "keine Tipps")
    return species, report


# ---------------------------------------------------------------------------
# Kommandos
# ---------------------------------------------------------------------------

def cmd_push(args):
    species = read_swift()
    write_excel(species, args.xlsx)
    texts = sum(len(s.description) + len(s.tips) for s in species)
    images = sum(len(s.images) for s in species)
    print(f"{args.xlsx} geschrieben: {len(species)} Arten, {texts} Sätze, {images} Bilder")


def cmd_pull(args):
    species, report = read_excel(args.xlsx)
    for w in report.warnings:
        print(f"Warnung: {w}")
    for e in report.errors:
        print(f"Fehler:  {e}", file=sys.stderr)
    if report.errors:
        print(f"\n{len(report.errors)} Fehler – SpeciesList.swift wurde NICHT geändert.", file=sys.stderr)
        return 1
    if args.dry_run:
        print(f"Tabelle ist in Ordnung ({len(species)} Arten). --dry-run: nichts geschrieben.")
        return 0
    SPECIES_LIST.parent.mkdir(parents=True, exist_ok=True)
    SPECIES_LIST.write_text(render_swift(species), encoding="utf-8")
    print(f"{SPECIES_LIST.relative_to(ROOT)} geschrieben: {len(species)} Arten"
          + (f", {len(report.warnings)} Warnungen" if report.warnings else ""))
    return 0


def main():
    parser = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    sub = parser.add_subparsers(dest="command", required=True)
    p = sub.add_parser("push", help="SpeciesList.swift -> Excel")
    p.add_argument("xlsx", type=Path)
    p.set_defaults(func=cmd_push)
    p = sub.add_parser("pull", help="Excel -> SpeciesList.swift")
    p.add_argument("xlsx", type=Path)
    p.add_argument("--dry-run", action="store_true", help="nur prüfen, nichts schreiben")
    p.set_defaults(func=cmd_pull)
    args = parser.parse_args()
    try:
        return args.func(args) or 0
    except DataError as e:
        print(f"Fehler: {e}", file=sys.stderr)
        return 1


if __name__ == "__main__":
    sys.exit(main())
