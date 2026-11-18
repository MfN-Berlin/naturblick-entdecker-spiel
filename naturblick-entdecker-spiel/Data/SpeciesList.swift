import Foundation

nonisolated let speciesList: [Species] = [
    Species(
        id: 23,
        name: "Ameise",
        gender: .feminine,
        description: [
            "Es gibt verschiedene Ameisen-Arten.",
            "Ameisen haben 6 Beine.",
            "Sie sind Insekten.",
            "Ihr Körper besteht aus 3 Teilen.",
            "Sie haben 2 Fühler am Kopf.",
            "Mit den Fühlern können sie riechen und fühlen.",
            "Viele Ameisen leben in großen Gruppen zusammen.",
            "Eine solche Gruppe heißt Ameisen-Staat.",
            "Oft laufen viele Ameisen hintereinander.",
            "So entstehen richtige Ameisen-Straßen.",
        ],
        tips: [
            "An warmen Tagen sind besonders viele Ameisen unterwegs.",
            "Suche auf Wegen, an Bäumen und auf dem Boden.",
        ],
        squareImage: "ameise_sq",
        images: [
            SpeciesImage(
                file: "ameise_1",
                author: "Richard Bartz",
                url: "https://commons.wikimedia.org/wiki/File:Camponotus_sideview_2.jpg",
                license: "CC BY-SA 2.5",
                authorURL: "https://commons.wikimedia.org/wiki/User:Makro_Freak",
                caption: "Holzameise"
            ),
            SpeciesImage(
                file: "ameise_2",
                author: "Gary Alpert",
                url: "https://commons.wikimedia.org/wiki/File:Myrmica-rubra-workers.jpg",
                license: "CC BY 2.5",
                authorURL: "https://en.wikipedia.org/wiki/User:Gary_Alpert",
                caption: "Rote Gartenameise"
            ),
        ],
        season: .spring
    ),
    Species(
        id: 24,
        name: "Regenwürmer",
        gender: .masculine,
        description: [
            "Es gibt verschiedene Regenwürmer-Arten.",
            "Regenwürmer haben **keine** Beine",
            "Ihr Körper besteht aus vielen kleinen Ringen.",
            "Sie leben im Boden.",
            "Sie fressen abgestorbene Pflanzen.",
            "Sie lockern die Erde auf.",
            "Das ist gut für viele Pflanzen.",
            "Regenwürmer brauchen Feuchtigkeit.",
            "Bei Trockenheit kriechen sie tiefer in den Boden.",
        ],
        tips: [
            "Suche nach Regen auf Wegen und auf feuchter Erde.",
            "Manchmal liegen kleine Erd-Häufchen auf dem Boden.",
            "Sie können von Regenwürmern stammen.",
        ],
        squareImage: "regenwuermer_sq",
        images: [
            SpeciesImage(
                file: "regenwurm_1",
                author: "James S.W., Porco D., Decaëns T., Richard B., Rougerie R., Erséus C.",
                url: "https://commons.wikimedia.org/wiki/File:Lumbricus_herculeus_(left)_and_Lumbricus_terrestris_(right).png",
                license: "CC BY 4.0",
                caption: "Auf dem Bild sind 2 verschiedene Regenwurm-Arten."
            ),
        ],
        season: .spring
    ),
    Species(
        id: 25,
        name: "Gehäuse-Schnecke",
        gender: .feminine,
        description: [
            "Gehäuse-Schnecken haben auf ihrem Rücken ein Haus.",
            "Es gibt verschiedene Gehäuse-Schnecken.",
            "Manche haben ein braunes Haus.",
            "Andere haben ein gelbes Haus oder dunkle Streifen.",
            "Bei Gefahr ziehen sie sich in ihr Haus zurück.",
            "Gehäuse-Schnecken haben einen weichen Körper.",
            "Auf ihrem Kopf sind 4 Fühler.",
            "Mit den oberen Fühlern können viele Gehäuse-Schnecken sehen.",
            "Schnecken bewegen sich auf einer Schleimspur fort.",
            "Der Schleim hilft ihnen beim Kriechen.",
        ],
        tips: [
            "Suche nach Regen oder am frühen Morgen.",
            "Schau auf feuchtem Boden und an Pflanzen.",
            "Manchmal findest du leere Schnecken-Häuser.",
        ],
        squareImage: "gehaeuseschnecke_sq",
        images: [
            SpeciesImage(
                file: "gehaeuseschnecke_1",
                author: "Arnstein Rønning",
                url: "https://commons.wikimedia.org/wiki/File:Cepaea_hortensis.JPG",
                license: "CC BY 3.0",
                authorURL: "https://commons.wikimedia.org/wiki/User:Eaglestein",
                caption: "Garten-Bänderschnecke"
            ),
            SpeciesImage(
                file: "gehaeuseschnecke_2",
                author: "Jürgen Schoner",
                url: "https://commons.wikimedia.org/wiki/File:Grapevinesnail_01.jpg",
                license: "CC BY-SA 3.0",
                authorURL: "https://de.wikipedia.org/wiki/User:Heliodor",
                caption: "Weinbergschnecke"
            ),
            SpeciesImage(
                file: "gehaeuseschnecke_3",
                author: "Francisco Welter Schultes",
                url: "https://commons.wikimedia.org/wiki/File:Ena_montana.jpg",
                license: "Gemeinfrei",
                authorURL: "http://www.animalbase.uni-goettingen.de/zooweb/servlet/AnimalBase/home/collaborator?id=7",
                caption: "Berg-Turmschnecke",
                alignment: .bias(x: -0.8, y: 0)
            ),
        ],
        season: .spring
    ),
    Species(
        id: 26,
        name: "Assel",
        gender: .feminine,
        description: [
            "Es gibt verschiedene Asseln.",
            "Ihr Körper ist flach und länglich.",
            "Auf dem Rücken haben sie einen harten Panzer.",
            "Der Panzer besteht aus mehreren Teilen.",
            "Asseln haben 14 Beine.",
            "Viele Asseln sind grau oder braun.",
            "Manche Asseln können sich bei Gefahr zu einer Kugel zusammenrollen.",
            "Asseln mögen feuchte und dunkle Orte.",
            "Sie fressen abgestorbene Pflanzen.",
            "So helfen sie dabei, alte Blätter zu zersetzen.",
            "Asseln gehören zu den Krebs-Tieren.",
        ],
        tips: [
            "Suche unter feuchtem Laub und an morschem Holz.",
            "Auch unter Steinen können Asseln leben.",
        ],
        squareImage: "assel_sq",
        images: [
            SpeciesImage(
                file: "assel_1",
                author: "Arnim Littek",
                url: "https://commons.wikimedia.org/wiki/File:Porcellio_scaber_102014894.jpg",
                license: "CC BY 4.0",
                authorURL: "https://www.inaturalist.org/users/59241",
                caption: "Kellerassel"
            ),
        ],
        season: .spring
    ),
    Species(
        id: 27,
        name: "Schwalbe",
        gender: .feminine,
        description: [
            "Schwalben sind kleine Vögel.",
            "Sie haben lange, schmale Flügel.",
            "Damit können sie schnell fliegen.",
            "Es gibt verschiedene Schwalben-Arten.",
            "Viele Schwalben haben einen gegabelten Schwanz.",
            "Schwalben fangen kleine Insekten in der Luft.",
            "Oft fliegen sie dicht über Wiesen oder Wasser.",
            "Viele Schwalben sind im Winter in Afrika.",
            "Im Frühling kommen sie nach Deutschland zurück.",
            "Dann bauen sie ihre Nester.",
            "Manche Schwalben bauen ihre Nester aus Lehm.",
            "Die Nester hängen oft an Gebäuden.",
        ],
        tips: [
            "Schwalben fliegen oft schnell hin und her.",
            "Manchmal fliegen sie dicht über dem Boden.",
            "An Gebäuden kannst du ihre Nester sehen.",
        ],
        squareImage: "schwalbe_sq",
        images: [
            SpeciesImage(
                file: "schwalbe_1",
                author: "Andreas Trepte",
                url: "https://commons.wikimedia.org/wiki/File:Mehlschwalbe_Delichon_urbicum.jpg",
                license: "CC BY-SA 2.5",
                authorURL: "http://photo-natur.de",
                caption: "Mehlschwalbe"
            ),
            SpeciesImage(
                file: "schwalbe_2",
                author: "Andreas Trepte",
                url: "https://commons.wikimedia.org/wiki/File:Rauchschwalbe_Hirundo_rustica.jpg",
                license: "CC BY-SA 2.5",
                authorURL: "http://photo-natur.de",
                caption: "Rauchschwalbe"
            ),
        ],
        audio: AudioAsset(
            file: "schwalbe.mp3",
            name: "Gesang",
            license: "CC BY-SA 3.0",
            author: "Dr. Karl Frommolt"
        ),
        season: .spring
    ),
    Species(
        id: 37,
        name: "Gänseblümchen",
        gender: .neutrum,
        description: [
            "Das Gänseblümchen ist eine kleine Pflanze.",
            "Es wächst auf Wiesen.",
            "Die Mitte der Blüte ist gelb.",
            "Außen sind viele weiße Blüten-Blätter.",
            "Manchmal sind die Spitzen rosa.",
            "Die grünen Blätter wachsen dicht am Boden.",
            "Sie bilden einen kleinen Kreis.",
            "Das nennt man Blatt-Rosette.",
            "An sonnigen Tagen öffnen sich die Blüten.",
            "Bei Dunkelheit und Regen schließen sie sich häufig.",
            "Gänseblümchen bieten Insekten Nahrung.",
        ],
        tips: [
            "Suche auf Wiesen, im Rasen und in Parks.",
            "Gänseblümchen wachsen oft in großen Gruppen.",
        ],
        squareImage: "gaensebluemchen_sq",
        images: [
            SpeciesImage(
                file: "gaensebluemchen_1",
                author: "Alice Kracht",
                url: "https://species-id.net/openmedia/File:Bellis_perennis_(11).JPG",
                license: "CC BY-SA 4.0",
                caption: "Gänseblümchen mit weißer Blüte"
            ),
        ],
        season: .spring,
        isDifficult: true
    ),
    Species(
        id: 28,
        name: "Huflattich",
        gender: .masculine,
        description: [
            "Der Huflattich ist eine kleine Pflanze.",
            "Seine Blüten sind leuchtend gelb.",
            "Sie sehen ein bisschen wie kleine Sonnen aus.",
            "Die Blüten wachsen auf kurzen Stängeln.",
            "Die Stängel haben kleine Schuppen.",
            "Das Besondere ist:",
            "Die Blüten erscheinen vor den großen Blättern.",
            "Erst später wachsen die Blätter.",
            "Die Blätter sind breit.",
            "Die Form erinnert an einen Pferde-Huf.",
            "Daher kommt der Name Huflattich.",
            "Insekten finden an den Blüten Nahrung.",
        ],
        tips: [
            "Huflattich blüht oft schon im März.",
            "Manchmal blüht er sogar früher.",
            "Suche an Weg-Rändern und auf Erd-Flächen.",
            "Auch an Böschungen kannst du Huflattich entdecken.",
        ],
        squareImage: "huflattich_sq",
        images: [
            SpeciesImage(
                file: "huflattich_1",
                author: "Nordschitz",
                url: "https://commons.wikimedia.org/wiki/File:Tussilago_farfara,_group_of_flowering_plants.jpg",
                license: "CC BY-SA 3.0",
                caption: "Mehrere Huflattich-Pflanzen mit Blüten"
            ),
        ],
        season: .spring,
        isDifficult: true
    ),
    Species(
        id: 29,
        name: "Star",
        gender: .masculine,
        description: [
            "Der Star ist ein Vogel.",
            "Seine Federn sehen oft schwarz aus.",
            "Im Sonnen-Licht glänzen die Federn grün und lila.",
            "Besonders im Winter hat er viele helle Punkte auf den Federn.",
            "Im Frühling werden diese Punkte oft weniger auffällig.",
            "Der Star hat einen langen, spitzen Schnabel.",
            "Im Frühling ist der Schnabel meistens gelb.",
            "Stare können viele verschiedene Laute machen.",
            "Sie können sogar andere Vögel nachahmen.",
            "Stare fressen Insekten, Würmer und Früchte.",
            "Sie bauen ihre Nester oft in Baum-Höhlen.",
        ],
        tips: [
            "Suche auf Wiesen, in Parks und in Gärten.",
            "Stare laufen oft über den Boden.",
        ],
        squareImage: "star_sq",
        images: [
            SpeciesImage(
                file: "star_1",
                author: "Ian Stannard",
                url: "https://commons.wikimedia.org/wiki/File:Sturnus_vulgaris_-Southsea,_Portsmouth,_England-8.jpg",
                license: "CC BY-SA 2.0",
                authorURL: "https://www.flickr.com/photos/44036847@N05",
                caption: "Erwachsener Star"
            ),
            SpeciesImage(
                file: "star_2",
                author: "Garry Knight",
                url: "https://commons.wikimedia.org/wiki/File:Sturnus_vulgaris_-Kensington_Gardens,_London,_England_-juvenile-8.jpg",
                license: "CC BY-SA 2.0",
                authorURL: "https://www.flickr.com/people/8176740@N05",
                caption: "Junger Star"
            ),
        ],
        audio: AudioAsset(
            file: "star.mp3",
            name: "Schwarm-Laute",
            license: "CC BY-SA 3.0",
            author: "Günter Tembrock"
        ),
        season: .spring,
        isDifficult: true
    ),
    Species(
        id: 30,
        name: "Bachstelze",
        gender: .feminine,
        description: [
            "Die Bachstelze ist ein schlanker Vogel.",
            "Ihre Federn sind schwarz, weiß und grau.",
            "Sie hat einen langen, schmalen Schwanz.",
            "Den Schwanz bewegt sie oft auf und ab.",
            "Bachstelzen laufen schnell über den Boden.",
            "Dabei suchen sie nach kleinen Insekten.",
            "Viele Bachstelzen sind im Winter in wärmeren Ländern.",
            "Im Frühling kommen sie zurück.",
            "Manche Bachstelzen bleiben auch im Winter in Deutschland.",
        ],
        tips: [
            "Suche auf Wegen, Wiesen und an Gewässern.",
            "Häufig sieht man sie auch auf Parkplätzen.",
        ],
        squareImage: "bachstelze_sq",
        images: [
            SpeciesImage(
                file: "bachstelze_1",
                author: "Andreas Trepte",
                url: "https://commons.wikimedia.org/wiki/File:Bachstelze_Motacilla_alba.jpg",
                license: "CC BY-SA 2.5",
                authorURL: "http://foto.andreas-trepte.de",
                caption: "Bachstelze Männchen"
            ),
            SpeciesImage(
                file: "bachstelze_2",
                author: "Andreas Nilsson",
                url: "https://commons.wikimedia.org/wiki/File:IMG_2687_filtered.jpg",
                license: "CC BY-SA 3.0",
                caption: "Bachstelze Weibchen"
            ),
        ],
        audio: AudioAsset(
            file: "bachstelze.mp3",
            name: "Gesang und Flugrufe",
            license: "CC BY-SA 3.0",
            author: "Tembrock und Frommolt"
        ),
        season: .spring,
        isDifficult: true
    ),
    Species(
        id: 31,
        name: "Specht",
        gender: .masculine,
        description: [
            "Spechte sind Vögel.",
            "Es gibt verschiedene Specht-Arten.",
            "Sie haben einen kräftigen Schnabel.",
            "Damit können sie gegen Holz klopfen.",
            "Spechte haben starke Füße mit scharfen Krallen.",
            "So können sie gut an Bäumen klettern.",
            "Ihr Schwanz hilft ihnen dabei.",
            "Manche Spechte sind schwarz, weiß und rot.",
            "Andere haben grüne Federn.",
            "Spechte suchen an Bäumen nach Nahrung.",
            "Sie fressen zum Beispiel Insekten und ihre Larven.",
            "Im Winter fressen manche Spechte auch Samen und Nüsse.",
            "Manchmal klopfen Spechte sehr schnell gegen Holz.",
            "Das nennt man Trommeln.",
        ],
        tips: [
            "Suche in Parks und Wäldern mit alten Bäumen.",
            "Höre auf das Klopfen und Trommeln.",
            "Manchmal findest du auch Löcher in Baum-Stämmen.",
            "Diese Löcher können von Spechten stammen.",
        ],
        squareImage: "specht_sq",
        images: [
            SpeciesImage(
                file: "specht_1",
                author: "Andreas Eichler",
                url: "https://commons.wikimedia.org/wiki/File:2015.05.08.-03-Kaefertaler_Wald-Mannheim--Buntspecht-Weibchen.jpg",
                license: "CC BY-SA 4.0",
                authorURL: "https://commons.wikimedia.org/wiki/User:Hockei",
                caption: "Buntspecht Weibchen"
            ),
            SpeciesImage(
                file: "specht_2",
                author: "OhWeh",
                url: "https://commons.wikimedia.org/wiki/File:Gr%C3%BCnspecht_Picus_viridis_Weibchen-006.jpg",
                license: "CC BY-SA 2.5",
                authorURL: "https://commons.wikimedia.org/wiki/User:OhWeh",
                caption: "Grünspecht Weibchen"
            ),
        ],
        audio: AudioAsset(
            file: "specht.mp3",
            name: "Rufe und Trommeln",
            license: "CC BY-SA 3.0",
            author: "Gnensch/Conrads"
        ),
        season: .winter
    ),
    Species(
        id: 32,
        name: "Ente",
        gender: .feminine,
        description: [
            "Enten sind Vögel.",
            "Es gibt verschiedene Enten-Arten.",
            "Sie haben einen breiten, flachen Schnabel.",
            "Zwischen ihren Zehen haben sie Haut.",
            "Damit können sie gut schwimmen.",
            "Ihr Gefieder schützt sie vor Nässe.",
            "Manche Enten sind braun.",
            "Andere haben grüne, blaue oder weiße Federn.",
            "Manche Enten schlafen auf dem Wasser.",
            "Manche Enten tauchen ganz unter Wasser.",
            "Andere strecken nur den Kopf ins Wasser.",
            "Dabei ragt ihr Hinter-Teil aus dem Wasser.",
            "Füttere Enten **nicht** mit Brot.",
            "Das ist **nicht** gut für sie und das Gewässer.",
        ],
        tips: [
            "Suche an Seen, Flüssen und Teichen.",
            "Im Winter sammeln sich Enten oft auf offenen Wasser-Flächen.",
        ],
        squareImage: "ente_sq",
        images: [
            SpeciesImage(
                file: "ente_1",
                author: "ViseMoD",
                url: "https://commons.wikimedia.org/wiki/File:Male_mallard_standing.jpg",
                license: "CC BY-SA 3.0",
                authorURL: "https://commons.wikimedia.org/wiki/User:ViseMoD",
                caption: "Stockente Männchen"
            ),
            SpeciesImage(
                file: "ente_2",
                author: "Andreas Trepte",
                url: "https://commons.wikimedia.org/wiki/File:Eurasian_teal.jpg",
                license: "CC BY-SA 2.5",
                authorURL: "http://photo-natur.de",
                caption: "Krickente Männchen"
            ),
            SpeciesImage(
                file: "ente_3",
                author: "Dr. Raju Kasambe",
                url: "https://commons.wikimedia.org/wiki/File:Tufted_Duck_Aythya_fuligula_Male_by_Dr._Raju_Kasambe_DSCN9795_(17).jpg",
                license: "CC BY-SA 4.0",
                authorURL: "https://commons.wikimedia.org/wiki/User:Dr._Raju_Kasambe",
                caption: "Reiherente Männchen"
            ),
        ],
        audio: AudioAsset(
            file: "ente.mp3",
            name: "Schnattern",
            license: "CC BY-SA 3.0",
            author: "Günter Tembrock"
        ),
        season: .winter
    ),
    Species(
        id: 33,
        name: "Krähe",
        gender: .feminine,
        description: [
            "Krähen sind Vögel.",
            "Es gibt verschiedene Krähen-Arten.",
            "Sie haben einen kräftigen Schnabel.",
            "Manche Krähen sind ganz schwarz.",
            "Andere Krähen haben einen grauen Körper.",
            "Krähen sind sehr kluge Tiere.",
            "Sie können sich Gesichter merken.",
            "Sie fressen Insekten, Samen, Früchte und kleine Tiere.",
            "Krähen können Werkzeuge benutzen.",
            "Im Winter treffen sich viele Krähen an gemeinsamen Schlaf-Plätzen.",
        ],
        tips: [
            "Suche in Parks, auf Wiesen und auf Feldern.",
        ],
        squareImage: "kraehe_sq",
        images: [
            SpeciesImage(
                file: "kraehe_1",
                author: "Francisco M. Marzoa",
                url: "https://commons.wikimedia.org/wiki/File:CrowHelsinki.jpg",
                license: "CC BY-SA 2.5",
                caption: "Nebelkrähe"
            ),
            SpeciesImage(
                file: "kraehe_2",
                author: "Loz",
                url: "https://commons.wikimedia.org/wiki/File:Kr%C3%A4he_65(loz).JPG",
                license: "CC BY-SA 3.0",
                authorURL: "https://commons.wikimedia.org/wiki/User:Loz",
                caption: "Rabenkrähe"
            ),
        ],
        audio: AudioAsset(
            file: "kraehe.mp3",
            name: "Rufe",
            license: "CC BY-SA 3.0",
            author: "Dr. Karl Frommolt"
        ),
        season: .winter
    ),
    Species(
        id: 38,
        name: "Erle",
        gender: .feminine,
        description: [
            "Erlen sind Bäume.",
            "Es gibt verschiedene Erlen-Arten.",
            "Sie wachsen oft an Flüssen, Bächen und Seen.",
            "Viele Erlen haben eine dunkle Rinde.",
            "Ihre Blätter fallen im Herbst ab.",
            "Im Winter kann man Erlen gut erkennen.",
            "An ihren Zweigen hängen kleine dunkle Zapfen.",
            "Sie sehen aus wie winzige Tannen-Zapfen.",
            "Eigentlich sind es verholzte Frucht-Stände.",
            "Darin wachsen die Samen.",
            "Die Samen werden durch Wind und Wasser verbreitet.",
            "An den Zweigen hängen im Winter oft auch lange Kätzchen.",
            "Das sind die männlichen Blüten-Stände.",
            "Im Frühling werden sie länger und geben Blüten-Staub ab.",
        ],
        tips: [
            "Suche an Flüssen, Bächen und Teichen.",
        ],
        squareImage: "erle_sq",
        images: [
            SpeciesImage(
                file: "erle_1",
                author: "Alice Kracht",
                url: "http://species-id.net/openmedia/File:Alnus_glutinosa_%289%29.JPG",
                license: "CC BY-SA 4.0",
                caption: "Schwarz-Erle Blätter und Zapfen"
            ),
            SpeciesImage(
                file: "erle_2",
                author: "Nikanos",
                url: "https://commons.wikimedia.org/wiki/File:Alnus_glutinosa_003.jpg",
                license: "CC BY-SA 2.5",
                caption: "Schwarz-Erle Rinde"
            ),
        ],
        season: .winter
    ),
    Species(
        id: 34,
        name: "Mistel",
        gender: .feminine,
        description: [
            "Misteln sind Pflanzen.",
            "Sie wachsen auf den Ästen anderer Bäume.",
            "Ihre Zweige sind grün und verzweigen sich oft wie ein Y.",
            "Die Blätter sind länglich und fest.",
            "Auch im Winter bleiben sie grün.",
            "Misteln haben weiße, runde Beeren.",
            "Die Beeren sind für Menschen **giftig**",
            "Viele Vögel fressen die Beeren.",
            "So helfen sie dabei, die Samen zu verbreiten.",
            "Misteln holen Wasser und Nähr-Stoffe aus dem Baum.",
            "Misteln brauchen Licht von der Sonne.",
            "Mit dem Licht machen Misteln ihre Nahrung selbst.",
        ],
        tips: [
            "Suche in Parks, an Straßen und an Wald-Rändern.",
            "Schau in die Kronen von Bäumen ohne Blätter.",
            "Misteln wachsen oft weit oben.",
            "Sie sehen oft aus wie grüne Kugeln.",
        ],
        squareImage: "mistel_sq",
        images: [
            SpeciesImage(
                file: "mistel_1",
                author: "H. Zell",
                url: "https://commons.wikimedia.org/wiki/File:Viscum_album_004.jpg",
                license: "CC BY-SA 3.0",
                caption: "Weißbeerige Mistel"
            ),
            SpeciesImage(
                file: "mistel_2",
                author: "Andrew Dunn",
                url: "https://commons.wikimedia.org/wiki/File:Mistletoe_in_White_Poplar_1.jpg",
                license: "CC BY-SA 2.0",
                authorURL: "http://www.andrewdunnphoto.com/",
                caption: "Weißbeerige Mistel"
            ),
        ],
        season: .winter
    ),
    Species(
        id: 20,
        name: "Amsel",
        gender: .feminine,
        description: [
            "Die Amsel ist ein Vogel.",
            "Das Männchen hat schwarze Federn.",
            "Sein Schnabel ist meistens gelb oder orange.",
            "Um seine Augen hat er einen gelben Ring.",
            "Das Weibchen ist braun.",
            "Ihr Schnabel ist eher dunkel.",
            "Amseln fressen Würmer, Insekten und Früchte.",
            "Im Winter fressen sie oft Beeren.",
            "Manchmal suchen sie unter Laub nach Nahrung.",
            "Dabei werfen sie Blätter mit dem Schnabel zur Seite.",
            "Viele Amseln bleiben das ganze Jahr in Deutschland.",
            "Andere ziehen im Herbst in wärmere Länder.",
        ],
        tips: [
            "Suche in Gärten, Parks und auf Friedhöfen.",
            "Schau auf den Boden und unter Sträucher.",
        ],
        squareImage: "amsel_sq",
        images: [
            SpeciesImage(
                file: "amsel_1",
                author: "Wald1siedel",
                url: "https://commons.wikimedia.org/wiki/File:Turdus_merula,_Common_Blackbird,_Amsel.JPG",
                license: "CC BY-SA 4.0",
                authorURL: "https://commons.wikimedia.org/wiki/User:Wald1siedel",
                caption: "Amsel Männchen"
            ),
            SpeciesImage(
                file: "amsel_pan",
                author: "Romate",
                url: "https://commons.wikimedia.org/wiki/File:Amsel_weiblich_g.JPG",
                license: "CC BY-SA 3.0",
                authorURL: "https://commons.wikimedia.org/wiki/User:Romate",
                caption: "Amsel Weibchen"
            ),
        ],
        audio: AudioAsset(
            file: "amsel.mp3",
            name: "Gesang",
            license: "CC BY-SA 3.0",
            author: "Günter Tembrock"
        ),
        season: .winter,
        isDifficult: true
    ),
    Species(
        id: 35,
        name: "Rotbuche",
        gender: .feminine,
        description: [
            "Die Rotbuche ist ein großer Laub-Baum.",
            "Sie kann über 30 Meter hoch werden.",
            "Ihre Rinde ist glatt und grau.",
            "Daran kann man sie oft gut erkennen.",
            "Im Winter hat die Rotbuche meistens **keine** Blätter mehr.",
            "Junge Rotbuchen behalten manchmal ihre braunen Blätter bis zum Frühling.",
            "Die Knospen sind lang, schmal und spitz.",
            "Sie sind an den Zweigen.",
            "Im Frühling wachsen daraus neue Blätter.",
            "Die Früchte der Rotbuche heißen Bucheckern.",
            "Viele Tiere fressen Bucheckern.",
            "Dazu gehören Mäuse, Eichhörnchen und Vögel.",
            "Rotbuchen können mehrere 100 Jahre alt werden.",
        ],
        tips: [
            "Suche in Wäldern und großen Parks.",
        ],
        squareImage: "rotbuche_sq",
        images: [
            SpeciesImage(
                file: "rotbuche_2",
                author: "Alice Kracht",
                url: "https://offene-naturfuehrer.de/web/Datei:Fagus_sylvatica_%60purpurea_(14).JPG",
                license: "CC BY-SA 4.0",
                caption: "Blätter"
            ),
            SpeciesImage(
                file: "rotbuche_1",
                author: "Dominicus Johannes Bergsma",
                url: "https://commons.wikimedia.org/wiki/File:Opengebarsten_lege_vrucht_(nap)_van_beuk_(Fagus_sylvatica)_18-12-2020_(d.j.b.)_01.jpg",
                license: "CC BY-SA 4.0",
                authorURL: "https://commons.wikimedia.org/wiki/User:Famberhorst",
                caption: "Aufgebrochene, leere Frucht"
            ),
        ],
        season: .winter,
        isDifficult: true
    ),
    Species(
        id: 36,
        name: "Waldkiefer",
        gender: .feminine,
        description: [
            "Die Waldkiefer ist ein Nadel-Baum.",
            "Sie bleibt das ganze Jahr grün.",
            "Ihre Nadeln sind lang und schmal.",
            "Immer 2 Nadeln wachsen zusammen.",
            "Die Nadeln sind oft leicht gedreht.",
            "Die Waldkiefer hat eine besondere Rinde.",
            "Unten am Stamm ist sie meist grau und rissig.",
            "Weiter oben ist sie oft orange-braun.",
            "An den Zweigen wachsen Zapfen.",
            "In den Zapfen entwickeln sich die Samen.",
            "Wenn die Zapfen trocken sind, öffnen sie sich.",
            "Dann können die Samen herausfallen.",
            "Die Samen haben kleine Flügel.",
            "So kann der Wind sie verbreiten.",
            "Waldkiefern können mehrere 100 Jahre alt werden.",
        ],
        tips: [
            "Suche in Wäldern, Parks und auf sandigen Böden.",
        ],
        squareImage: "waldkiefer_sq",
        images: [
            SpeciesImage(
                file: "waldkiefer_1",
                author: "Ramin Nakisa",
                url: "https://commons.wikimedia.org/wiki/File:PinusSylvestris.jpg",
                license: "CC BY-SA 3.0",
                authorURL: "https://en.wikipedia.org/wiki/User:Ramin_Nakisa",
                caption: "Waldkiefer"
            ),
            SpeciesImage(
                file: "waldkiefer_2",
                author: "Hans Kadereit",
                url: "https://commons.wikimedia.org/wiki/File:Kieferbl%C3%BCte.JPG",
                license: "GFDL 1.3",
                authorURL: "https://de.wikipedia.org/wiki/Benutzer:Hans_Kadereit",
                caption: "Blüte"
            ),
        ],
        season: .winter,
        isDifficult: true
    ),
    Species(
        id: 9,
        name: "Eiche",
        gender: .feminine,
        description: [
            "Die Eiche ist ein großer Laub-Baum.",
            "Ihre Blätter haben runde Ausbuchtungen.",
            "Die Früchte heißen Eicheln.",
            "Die Eicheln reifen im September und Oktober.",
            "Viele Tiere suchen Eicheln als Nahrung.",
            "Alte Eichen bieten vielen Tieren einen Lebens-Raum.",
            "Manche Eichen werden über 500 Jahre alt.",
            "Es gibt verschiedene Eichen-Arten.",
        ],
        tips: [
            "Suche in Parks und an Waldrändern.",
        ],
        squareImage: "eiche_sq",
        images: [
            SpeciesImage(
                file: "eiche_1",
                author: "Dimìtar Nàydenov",
                url: "https://commons.wikimedia.org/wiki/File:%D0%9E%D0%B1%D0%B8%D0%BA%D0%BD%D0%BE%D0%B2%D0%B5%D0%BD_%D0%B4%D1%8A%D0%B1_-_%D1%84%D0%B8%D0%B4%D0%B0%D0%BD%D0%BA%D0%B0.jpg",
                license: "CC BY-SA 4.0",
                authorURL: "https://commons.wikimedia.org/wiki/User:Utar_Sigmal",
                caption: "Stieleiche jung"
            ),
            SpeciesImage(
                file: "eiche_pan",
                author: "Nikanos",
                url: "https://commons.wikimedia.org/wiki/File:Quercus_Robur_031.jpg",
                license: "CC BY-SA 2.5",
                caption: "Stieleiche mit Eicheln"
            ),
        ],
        season: .autumn
    ),
    Species(
        id: 10,
        name: "Wanzen",
        gender: .feminine,
        description: [
            "Wanzen haben 6 Beine.",
            "Wanzen sind Insekten.",
            "Es gibt verschiedene Wanzen-Arten.",
            "Viele haben einen breiten, flachen Körper.",
            "Es gibt Wanzen in vielen Farben.",
            "Manche sind grün.",
            "Andere braun oder rot-schwarz.",
            "Viele Wanzen saugen Pflanzen-Saft.",
            "Manche Wanzen können einen starken Geruch abgeben.",
            "So schützen sie sich vor Feinden.",
        ],
        tips: [
            "Viele Wanzen suchen im Herbst einen Platz für den Winter.",
            "Sie verstecken sich zum Beispiel unter Laub, in Ritzen oder unter Baum-Rinde.",
            "Schau vorsichtig unter Blätter.",
            "Lass Verstecke danach wieder so liegen, wie du sie gefunden hast.",
            "Die roten Feuerwanzen findet man manchmal in großen Gruppen.",
        ],
        squareImage: "wanzen_sq",
        images: [
            SpeciesImage(
                file: "wanze_1",
                author: "André Karwath aka Aka",
                url: "https://commons.wikimedia.org/wiki/File:Palomena_prasina_-_top_(aka).jpg",
                license: "CC BY-SA 2.5",
                authorURL: "https://commons.wikimedia.org/wiki/User:Aka",
                caption: "Grüne Stinkwanze",
                alignment: .bias(x: 0, y: 0.4)
            ),
            SpeciesImage(
                file: "wanze_2",
                author: "Jörg Hempel",
                url: "https://commons.wikimedia.org/wiki/File:Pyrrhocoris_apterus_LC0130.jpg",
                license: "CC BY-SA 2.0",
                authorURL: "https://commons.wikimedia.org/wiki/User:LC-de",
                caption: "Feuerwanzen"
            ),
            SpeciesImage(
                file: "wanze_3",
                author: "Slimguy",
                url: "https://commons.wikimedia.org/wiki/File:2016_09_28_Oxycarenus_lavaterae.jpg",
                license: "CC BY-SA 4.0",
                authorURL: "https://commons.wikimedia.org/wiki/User:Slimguy",
                caption: "Lindenwanze"
            ),
        ],
        season: .autumn
    ),
    Species(
        id: 11,
        name: "Nackt-Schnecke",
        gender: .feminine,
        description: [
            "Es gibt verschiedene Nackt-Schnecken.",
            "Nackt-Schnecken haben **kein** sichtbares Haus.",
            "Ihr Körper ist weich und länglich.",
            "Ihr Schleim hilft ihnen, über den Boden zu gleiten.",
            "Auf ihrem Kopf sind 4 Fühler.",
            "Mit den oberen Fühlern können sie sehen und fühlen.",
            "Nach Regen sind Nacktschnecken oft besonders aktiv.",
        ],
        tips: [
            "Suche am besten morgens oder nach Regen.",
            "Auf dem Boden oder auf Blättern können glänzende Schleimspuren zu sehen sein.",
            "Bei Trockenheit verstecken sie sich.",
        ],
        squareImage: "nacktschnecke_sq",
        images: [
            SpeciesImage(
                file: "nacktschnecke_1",
                author: "Syrio",
                url: "https://commons.wikimedia.org/wiki/File:Arion_sp._Culloden_02.jpg",
                license: "CC BY-SA 4.0",
                authorURL: "https://commons.wikimedia.org/wiki/User:Syrio",
                caption: "Rote Wegschnecke oder Schwarze Wegschnecke"
            ),
            SpeciesImage(
                file: "nacktschnecke_2",
                author: "Donald Hobern",
                url: "https://commons.wikimedia.org/wiki/File:Arion_distinctus_(26732813176).jpg",
                license: "CC BY 2.0",
                authorURL: "https://www.flickr.com/people/25401497@N02",
                caption: "Gemeine Wegschnecke"
            ),
            SpeciesImage(
                file: "nacktschnecke_3",
                author: "H. Krisp",
                url: "https://commons.wikimedia.org/wiki/File:Genetzte_Ackerschnecke_Deroceras_reticulatum.jpg",
                license: "CC BY 3.0",
                authorURL: "https://commons.wikimedia.org/wiki/User:Holleday",
                caption: "Genetzte Ackerschnecke"
            ),
        ],
        season: .autumn
    ),
    Species(
        id: 12,
        name: "Gans",
        gender: .feminine,
        description: [
            "Gänse sind große Vögel.",
            "Es gibt verschiedene Gänse-Arten.",
            "Sie haben einen langen Hals.",
            "Sie haben Haut zwischen den Zehen.",
            "Damit können sie gut schwimmen.",
            "Viele Gänse leben an Seen, Flüssen und auf Wiesen.",
            "Viele Gänse ziehen im Herbst in wärmere Länder.",
            "Manche Gänse kommen aus dem Norden zu uns.",
            "Sie ruhen sich hier aus und fressen.",
            "Auf ihrem Flug rufen sie laut.",
        ],
        tips: [
            "Schau an Seen, Teichen und auf großen Wiesen.",
            "Im Herbst sieht man manchmal große Gruppen auf Wiesen und Feldern.",
            "Höre in den Himmel: Oft hörst du die Gänse, bevor du sie siehst.",
            "Oft fliegen sie in einer V-Form.",
            "So kann man sie am Himmel gut erkennen.",
        ],
        squareImage: "gans_sq",
        images: [
            SpeciesImage(
                file: "gans_1",
                author: "H005",
                url: "https://commons.wikimedia.org/wiki/File:Graugans_Anser_Anser.jpg",
                license: "CC BY-SA 4.0",
                authorURL: "https://commons.wikimedia.org/wiki/User:H005",
                caption: "Graugans"
            ),
            SpeciesImage(
                file: "gans_2",
                author: "PantheraLeo1359531",
                url: "https://commons.wikimedia.org/wiki/File:Ansichten_vom_Untreusee_20250316_HOF5276_RAW-Export.jpg",
                license: "CC BY-SA 4.0",
                authorURL: "https://commons.wikimedia.org/wiki/User:PantheraLeo1359531",
                caption: "Kanadagans"
            ),
        ],
        audio: AudioAsset(
            file: "gans.mp3",
            name: "Gesang",
            license: "CC BY-SA 3.0",
            author: "Frommolt"
        ),
        season: .autumn
    ),
    Species(
        id: 13,
        name: "Weiden",
        gender: .feminine,
        description: [
            "Weiden sind Bäume oder Sträucher.",
            "Es gibt verschiedene Weiden-Arten.",
            "Viele Weiden wachsen an Flüssen, Bächen und Seen.",
            "Ihre Zweige sind oft lang und biegsam.",
            "Die Blätter sind meistens schmal und länglich.",
            "Im Herbst werden die Blätter gelb und fallen ab.",
            "Einige Schmetterlings-Raupen fressen die Blätter.",
            "Andere Tiere nutzen die Zweige als Versteck.",
            "Viele kleine Blüten hängen am Zweig dicht zusammen.",
            "Sie sehen aus wie kleine längliche Büschel.",
            "Diese Büschel heißen Kätzchen.",
        ],
        tips: [
            "Suche an Ufern, in Parks und auf feuchten Wiesen.",
        ],
        squareImage: "weiden_sq",
        images: [
            SpeciesImage(
                file: "weide_1",
                author: "Crusier",
                url: "https://commons.wikimedia.org/wiki/File:Salix_alba_Marki_2.JPG",
                license: "CC BY-SA 3.0",
                authorURL: "https://commons.wikimedia.org/wiki/User:Crusier",
                caption: "Silberweide"
            ),
            SpeciesImage(
                file: "weide_2",
                author: "Willow",
                url: "https://commons.wikimedia.org/wiki/File:Salix_caprea_036.jpg",
                license: "CC BY-SA 3.0",
                caption: "Sal-Weide"
            ),
            SpeciesImage(
                file: "weide_3",
                author: "Alice Kracht",
                url: "https://offene-naturfuehrer.de/web/Datei:Salix_alba_(7).JPG",
                license: "CC BY-SA 4.0",
                caption: "Silberweide Blatt"
            ),
            SpeciesImage(
                file: "weide_4",
                author: "Alice Kracht",
                url: "https://offene-naturfuehrer.de/web/Datei:Salix_alba_(6).JPG",
                license: "CC BY-SA 4.0",
                caption: "Silberweide Kätzchen",
                alignment: .bias(x: 0, y: -0.3)
            ),
        ],
        season: .autumn
    ),
    Species(
        id: 19,
        name: "Igel",
        gender: .masculine,
        description: [
            "Der Igel hat viele harte Stacheln.",
            "Die Stacheln sind auf seinem Rücken und auf seinem Kopf.",
            "Die Stacheln sind besondere Haare.",
            "Bei Gefahr rollt der Igel sich zu einer Kugel zusammen.",
            "Im Herbst sucht der Igel einen sicheren Platz für den Winter.",
            "Von Oktober bis März macht er meistens Winterschlaf.",
            "Igel schlafen in Laub-Haufen.",
            "Ein Laub-Haufen ist aber **kein** Beweis dafür, dass dort ein Igel lebt.",
            "Lass Laub-Haufen liegen und störe sie nicht.",
        ],
        tips: [
            "Igel sind nachts unterwegs.",
            "Oft sieht man sie nicht.",
            "Suche deshalb auch nach ihren Spuren.",
            "Du findest vielleicht kleine Pfoten-Abdrücke im feuchten Boden.",
        ],
        squareImage: "igel_sq",
        images: [
            SpeciesImage(
                file: "igel_1",
                author: "Jörg Hempel",
                url: "https://commons.wikimedia.org/wiki/File:Erinaceus_europaeus_LC0119.jpg",
                license: "CC BY-SA 2.0 DE",
                authorURL: "https://commons.wikimedia.org/wiki/User:LC-de",
                caption: "Igel"
            ),
            SpeciesImage(
                file: "igel_2",
                author: "James Lindsey",
                url: "https://commons.wikimedia.org/wiki/File:Erinaceus.europaeus.tracks.jpg",
                license: "CC BY-SA 2.5",
                caption: "Fuß-Spuren"
            ),
        ],
        audio: AudioAsset(
            file: "igel.mp3",
            name: "Schnaufen und Boxen",
            license: "CC BY-SA 3.0",
            author: "Tembrock"
        ),
        season: .autumn,
        isDifficult: true
    ),
    Species(
        id: 18,
        name: "Rotfuchs",
        gender: .masculine,
        description: [
            "Der Rotfuchs hat meistens rotbraunes Fell.",
            "Sein Bauch ist heller.",
            "Sein Schwanz ist lang und buschig.",
            "Die Spitze ist oft weiß.",
            "Füchse leben auch in Städten.",
            "Sie finden Nahrung und Verstecke in Gärten, Parks und auf Friedhöfen.",
            "Sie fressen zum Beispiel kleine Tiere und Regenwürmer.",
            "Ein Rotfuchs kann ungefähr 40 verschiedene Laute machen.",
            "Manche Laute klingen wie ein heiserer Schrei.",
            "Andere klingen wie Hunde-Bellen.",
        ],
        tips: [
            "Suche früh am Morgen oder am Abend in ruhigen Parks.",
            "Füchse sind vorsichtig und oft schnell wieder weg.",
            "Ihre Spuren zu finden ist manchmal leichter.",
            "Im weichen Boden kannst du Pfoten-Abdrücke finden.",
            "Oft liegen sie fast wie an einer Schnur hintereinander.",
            "Die Spuren können auch von einem Hund stammen.",
        ],
        squareImage: "rotfuchs_sq",
        images: [
            SpeciesImage(
                file: "fuchs_pan",
                author: "Martin Mecnarowski",
                url: "https://commons.wikimedia.org/wiki/File:Vulpes_vulpes_1_(Martin_Mecnarowski).jpg",
                license: "CC BY-SA 3.0",
                authorURL: "https://commons.wikimedia.org/wiki/User:Trachemys~commonswiki/Martin_Mecnarowski",
                caption: "Rotfuchs"
            ),
            SpeciesImage(
                file: "fuchs_2",
                author: "Malene Thyssen",
                url: "https://commons.wikimedia.org/wiki/File:R%C3%B8d_r%C3%A6v_(Vulpes_vulpes).jpg",
                license: "CC BY 2.5",
                authorURL: "https://commons.wikimedia.org/wiki/User:Malene",
                caption: "Rotfuchs"
            ),
            SpeciesImage(
                file: "fuchs_3",
                author: "Erfil",
                url: "https://commons.wikimedia.org/wiki/File:Caminozorro.JPG?uselang=de",
                license: "CC BY 3.0",
                authorURL: "https://commons.wikimedia.org/wiki/User:Erfil",
                caption: "Spuren im Schnee"
            ),
        ],
        audio: AudioAsset(
            file: "rotfuchs.mp3",
            name: "Fuchsruf",
            license: "CC BY-SA 3.0",
            author: "Gnensch"
        ),
        season: .autumn,
        isDifficult: true
    ),
    Species(
        id: 17,
        name: "Eichhörnchen",
        gender: .neutrum,
        description: [
            "Das Eichhörnchen hat einen langen, buschigen Schwanz.",
            "Sein Fell kann rot, braun oder fast schwarz sein.",
            "Sein Bauch ist weiß oder cremefarben.",
            "Im Herbst sammelt es Nüsse und Samen.",
            "Es versteckt einen Teil seiner Nahrung im Boden.",
            "So hat es im Winter etwas zu fressen.",
            "Manche versteckten Samen wachsen später zu neuen Pflanzen.",
            "Die Zähne von Eichhörnchen wachsen ihr ganzes Leben lang.",
            "Deshalb müssen sie regelmäßig harte Nahrung nagen.",
            "Ihr Nest heißt Kobel.",
        ],
        tips: [
            "Suche in Parks mit vielen Bäumen.",
            "Schau auf die Stämme und in die Äste.",
            "Bleib eine Weile ruhig stehen.",
            "Du kannst auch angeknabberte Nüsse finden.",
            "Du kannst kleine Pfoten-Abdrücke im feuchten Boden sehen.",
            "Hoch oben in Bäumen gibt es manchmal ein rundes Nest.",
        ],
        squareImage: "eichhoernchen_sq",
        images: [
            SpeciesImage(
                file: "eichhoernchen_pan",
                author: "Petra Taenzer",
                url: "https://commons.wikimedia.org/wiki/File:Eichh%C3%B6rnchen_(132716067).jpeg",
                license: "CC BY 3.0",
                authorURL: "https://500px.com/PetraTaenzer",
                caption: "Eichhörnchen mit Nuss"
            ),
            SpeciesImage(
                file: "eichhoernchen_2",
                author: "Darkone",
                url: "https://commons.wikimedia.org/wiki/File:Red_squirrel_(Sciurus_vulgaris).jpg",
                license: "CC BY-SA 2.5",
                authorURL: "https://commons.wikimedia.org/wiki/User:Darkone",
                caption: "Eichhörnchen"
            ),
            SpeciesImage(
                file: "eichhoernchen_3",
                author: "Crusier",
                url: "https://commons.wikimedia.org/wiki/File:Sciurus_vulgaris_Park_Skaryszewski_3.JPG",
                license: "CC BY-SA 3.0",
                authorURL: "https://commons.wikimedia.org/wiki/User:Crusier",
                caption: "Am Baum",
                alignment: .bias(x: 0, y: 0.6)
            ),
        ],
        audio: AudioAsset(
            file: "eichhoernchen.mp3",
            name: "Keckern",
            license: "CC BY-SA 3.0",
            author: "Gnensch"
        ),
        season: .autumn,
        isDifficult: true
    ),
    Species(
        id: 16,
        name: "Rotkehlchen",
        gender: .neutrum,
        description: [
            "Das Rotkehlchen ist ein kleiner Vogel.",
            "Seine Brust und seine Kehle sind orange-rot.",
            "Sein Rücken ist braun.",
            "Sein Bauch ist hell.",
            "Es frisst kleine Tiere.",
            "Dazu gehören Insekten, Spinnen, Würmer und Schnecken.",
            "Einige Rotkehlchen ziehen im Herbst in wärmere Gebiete.",
            "Andere bleiben hier.",
            "Sein Gesang ist fast das ganze Jahr zu hören.",
            "Manchmal singt es sogar nachts.",
            "Das passiert besonders oft in der Nähe von Straßen-Laternen.",
        ],
        tips: [
            "Suche in Gärten, Parks und auf Friedhöfen.",
            "Bleib ruhig stehen und lausche.",
            "Du kannst das Rotkehlchen oft hören, bevor du es siehst.",
            "Besonders nach Regen kann das Rotkehlchen gut zu hören sein.",
            "Es hüpft auf dem Boden und sucht zwischen den Blättern nach Nahrung.",
            "Manchmal siehst du es in einer Hecke sitzen.",
        ],
        squareImage: "rotkehlchen_sq",
        images: [
            SpeciesImage(
                file: "rotkehlchen_1",
                author: "Joefrei",
                url: "https://commons.wikimedia.org/wiki/File:Rotkehlchenportrait_aus_ca._1_Meter_Entfernung.jpg",
                license: "CC BY-SA 3.0",
                caption: "Rotkehlchen"
            ),
            SpeciesImage(
                file: "rotkehlchen_2",
                author: "Charlesjsharp",
                url: "https://commons.wikimedia.org/wiki/File:European_robin_(Erithacus_rubecula)_juvenile.jpg",
                license: "CC BY-SA 4.0",
                caption: "Jungtier"
            ),
            SpeciesImage(
                file: "rotkehlchen_pan",
                author: "Diego Delso",
                url: "https://commons.wikimedia.org/wiki/File:Petirrojo_europeo_(Erithacus_rubecula),_Tierpark_Hellabrunn,_M%C3%BAnich,_Alemania,_2012-06-17,_DD_01.JPG",
                license: "CC BY-SA 3.0",
                caption: "Rotkehlchen"
            ),
        ],
        audio: AudioAsset(
            file: "rotkehlchen.mp3",
            name: "Gesang",
            license: "CC BY-SA 3.0",
            author: "Frommolt"
        ),
        season: .autumn,
        isDifficult: true
    ),
    Species(
        id: 15,
        name: "Rosskastanie",
        gender: .feminine,
        description: [
            "Die Rosskastanie ist ein großer Baum.",
            "Ihre Blätter sind groß.",
            "Ein Blatt besteht aus mehreren kleineren Teilen.",
            "Im Herbst fallen braune Kastanien auf den Boden.",
            "Sie stecken zuerst in einer grünen Hülle mit Stacheln.",
            "Die Früchte reifen im September und Oktober.",
            "Man kann die Kastanien nicht essen.",
        ],
        tips: [
            "Suche in Parks und auf Spiel-Plätzen.",
            "Ohne Früchte kann es schwieriger sein, den Baum zu erkennen.",
        ],
        squareImage: "rosskastanie_sq",
        images: [
            SpeciesImage(
                file: "kastanie_pan",
                author: "Alice Kracht",
                url: "https://offene-naturfuehrer.de/web/Datei:Aesculus_hippocastanum_(14).JPG",
                license: "CC BY-SA 4.0",
                caption: "Blatt"
            ),
            SpeciesImage(
                file: "kastanie_2",
                author: "Alina Zienowicz Ala z",
                url: "https://commons.wikimedia.org/wiki/File:Kasztan_oo003.JPG",
                license: "CC BY-SA 3.0",
                authorURL: "https://pl.wikipedia.org/wiki/User:Ala_z",
                caption: "Blüten"
            ),
            SpeciesImage(
                file: "kastanie_3",
                author: "Solipsist",
                url: "https://commons.wikimedia.org/wiki/File:Aesculus_hippocastanum_fruit_(jha).jpg",
                license: "CC BY-SA 2.5",
                authorURL: "https://en.wikipedia.org/wiki/User:Solipsist",
                caption: "Frucht"
            ),
            SpeciesImage(
                file: "kastanie_4",
                author: "Nikanos",
                url: "https://commons.wikimedia.org/wiki/File:Aesculus_hippocastanum_20.jpg",
                license: "CC BY-SA 2.5",
                caption: "Baum",
                alignment: .bias(x: 0, y: -0.1)
            ),
        ],
        season: .autumn,
        isDifficult: true
    ),
    Species(
        id: 14,
        name: "Walnuss",
        gender: .feminine,
        description: [
            "Der Walnuss-Baum ist groß.",
            "Seine Blätter bestehen aus mehreren kleinen Blättern.",
            "Wenn du ein Blatt vorsichtig zwischen den Fingern reibst, riecht es kräftig.",
            "Die Walnüsse reifen im September und Oktober.",
            "Ihre äußere Hülle ist zuerst grün.",
            "Später wird sie braun und platzt auf.",
            "Dann fällt die Walnuss heraus.",
            "Ein Walnuss-Baum kann bis zu 200 Jahre alt werden.",
        ],
        tips: [
            "Suche in Gärten und Parks.",
            "Walnussbäume findet man nur an wenigen Orten.",
        ],
        squareImage: "walnuss_sq",
        images: [
            SpeciesImage(
                file: "walnuss_3",
                author: "Alice Kracht",
                url: "https://offene-naturfuehrer.de/web/Datei:Juglans_regia_(10).JPG",
                license: "CC BY-SA 4.0",
                caption: "Blatt"
            ),
            SpeciesImage(
                file: "walnuss_1",
                author: "Kruczy89",
                url: "https://commons.wikimedia.org/wiki/File:Juglans_regia_-_male_inflorescences.jpg",
                license: "CC BY-SA 3.0",
                authorURL: "https://commons.wikimedia.org/wiki/User:Kruczy89",
                caption: "männliche Blütenstände"
            ),
            SpeciesImage(
                file: "walnuss_2",
                author: "Böhringer Friedrich",
                url: "https://commons.wikimedia.org/wiki/File:Juglans_regia_Echte_Walnussfrucht_1.jpg",
                license: "CC BY-SA 2.5",
                authorURL: "https://commons.wikimedia.org/wiki/User:B%C3%B6hringer",
                caption: "Frucht"
            ),
        ],
        season: .autumn,
        isDifficult: true
    ),
    Species(
        id: 1,
        name: "Hummel",
        gender: .feminine,
        description: [
            "Hummeln sind rund und dicht behaart.",
            "Sie besuchen viele Blüten.",
            "Dabei helfen sie vielen Pflanzen.",
            "Sie fliegen auch an kühlen Tagen.",
            "Es gibt viele verschiedene Hummeln.",
            "Hummeln sind Insekten.",
            "Insekten haben 6 Beine.",
        ],
        tips: [
            "Suche auf Blumen im Garten oder am Wegrand.",
            "Warte ruhig an einer Blüte.",
        ],
        squareImage: "hummel_sq",
        images: [
            SpeciesImage(
                file: "hummel_1",
                author: "M. Betley",
                url: "https://commons.wikimedia.org/wiki/File:Bombus_terrestris1_trzmiel_ziemny_small.jpg",
                license: "CC BY-SA 3.0",
                caption: "Dunkle Erd-Hummel"
            ),
            SpeciesImage(
                file: "hummel_2",
                author: "Ivar Leidus",
                url: "https://commons.wikimedia.org/wiki/File:Bombus_lapidarius_(male)_-_Centaurea_scabiosa_-_Keila.jpg",
                license: "CC BY-SA 4.0",
                authorURL: "https://commons.wikimedia.org/wiki/User:Iifar",
                caption: "Steinhummel"
            ),
        ],
        audio: AudioAsset(
            file: "hummel.mp3",
            name: "Flug-Geräusche",
            license: "CC BY-SA 3.0",
            author: "Günter Tembrock"
        ),
        season: .summer
    ),
    Species(
        id: 2,
        name: "Libellen",
        gender: .feminine,
        description: [
            "Libellen haben 4 durchsichtige Flügel.",
            "Sie haben einen langen Körper.",
            "Sie haben große Augen.",
            "Sie fliegen sehr schnell.",
            "Die Jungen leben im Wasser.",
            "Es gibt viele verschiedene Libellen.",
            "Libellen sind Insekten.",
            "Insekten haben 6 Beine.",
        ],
        tips: [
            "Suche am Teich oder am Bach.",
            "Warte am Ufer.",
            "Libellen kommen oft zurück.",
        ],
        squareImage: "libellen_sq",
        images: [
            SpeciesImage(
                file: "libelle_1",
                author: "FK1954",
                url: "https://commons.wikimedia.org/wiki/File:Calopteryx_splendens,_male.jpg",
                license: "CC0",
                authorURL: "https://commons.wikimedia.org/wiki/User:FK1954",
                caption: "Gebänderte Prachtlibelle Männchen",
                alignment: .bottomCenter
            ),
            SpeciesImage(
                file: "libelle_2",
                author: "Andreas Eichler",
                url: "https://commons.wikimedia.org/wiki/File:2013.08.04.-15-Ladenburg-Gebaenderte_Prachtlibelle-Weibchen.jpg",
                license: "CC BY-SA 3.0",
                authorURL: "https://commons.wikimedia.org/wiki/User:Hockei",
                caption: "Gebänderte Prachtlibelle Weibchen"
            ),
            SpeciesImage(
                file: "libelle_3",
                author: "Loz",
                url: "https://commons.wikimedia.org/wiki/File:Coenagrion_puella_3(loz).jpg",
                license: "CC BY-SA 3.0",
                authorURL: "https://commons.wikimedia.org/wiki/User:Loz",
                caption: "Hufeisen-Azurjungfer"
            ),
        ],
        season: .summer
    ),
    Species(
        id: 3,
        name: "Schmetterling",
        gender: .masculine,
        description: [
            "Schmetterlinge haben 4 bunte Flügel.",
            "Sie trinken Nektar aus Blüten.",
            "Sie leben zuerst als Raupen.",
            "Später wird aus der Raupe der Schmetterling.",
            "Es gibt viele verschiedene Schmetterlinge.",
            "Schmetterlinge sind Insekten.",
            "Insekten haben 6 Beine.",
        ],
        tips: [
            "Suche Schmetterlinge auf einer Wiese oder im Garten.",
            "Sie fliegen bei Sonne.",
        ],
        squareImage: "schmetterling_sq",
        images: [
            SpeciesImage(
                file: "schmetterling_1",
                author: "Jörg Hempel",
                url: "https://commons.wikimedia.org/wiki/File:Aglais_urticae_LC0310.jpg",
                license: "CC BY-SA 3.0 DE",
                authorURL: "https://commons.wikimedia.org/wiki/User:LC-de",
                caption: "Kleiner Fuchs"
            ),
            SpeciesImage(
                file: "schmetterling_2",
                author: "Xulescu g",
                url: "https://commons.wikimedia.org/wiki/File:Apatura_iris_female.jpg",
                license: "CC BY-SA 2.0",
                authorURL: "https://www.flickr.com/people/59161444@N05",
                caption: "Großer Schillerfalter"
            ),
            SpeciesImage(
                file: "schmetterling_3",
                author: "Böhringer Friedrich",
                url: "https://commons.wikimedia.org/wiki/File:Colias_hyale,_Goldene_Acht_04.JPG",
                license: "CC BY-SA 3.0 AT",
                authorURL: "mailto:rufre@lenz-nenning.at",
                caption: "Goldene Acht"
            ),
        ],
        season: .summer
    ),
    Species(
        id: 4,
        name: "Brennnessel",
        gender: .feminine,
        description: [
            "Brennnesseln sind grüne Pflanzen mit Blättern.",
            "Sie haben gezackte Blätter.",
            "Sie können auf der Haut brennen.",
            "Es ist **nicht** gefährlich.",
            "Fasse sie trotzdem besser **nicht** an.",
            "Viele Raupen fressen Brennnesseln.",
            "Darum sind sie wichtig für viele Tiere.",
            "Menschen nutzen die Blätter für Tee.",
        ],
        tips: [
            "Suche Brennnesseln am Wegrand oder am Zaun.",
        ],
        squareImage: "brennnessel_sq",
        images: [
            SpeciesImage(
                file: "brennnessel_2",
                author: "Alice Kracht",
                url: "https://offene-naturfuehrer.de/web/Datei:Urtica_dioica_(16).JPG",
                license: "CC BY-SA 4.0",
                caption: "Große Brennnessel"
            ),
            SpeciesImage(
                file: "brennnessel_1",
                author: "Jerome Prohaska",
                url: "https://commons.wikimedia.org/wiki/File:Urtica_dioica_stinging_hair.jpg",
                license: "CC BY-SA 3.0",
                caption: "Brenn-Haar von Große Brennnessel"
            ),
            SpeciesImage(
                file: "brennnessel_3",
                author: "Alice Kracht",
                url: "https://offene-naturfuehrer.de/web/Datei:Urtica_dioica_(2).JPG",
                license: "CC BY-SA 4.0",
                caption: "Blatt Große Brennnessel"
            ),
        ],
        season: .summer
    ),
    Species(
        id: 5,
        name: "Klee",
        gender: .masculine,
        description: [
            "Klee hat meist 3 Blätter.",
            "Die Blüten sind weiß oder rosa.",
            "Es gibt meistens sehr viel Klee an einem Ort.",
            "Er gibt Nahrung für viele Hummeln.",
            "Viele Tiere fressen Klee.",
            "Klee mit 4 Blättern soll Glück bringen.",
        ],
        tips: [
            "Suche Klee auf einer Wiese, im Rasen oder am Wegrand.",
        ],
        squareImage: "klee_sq",
        images: [
            SpeciesImage(
                file: "klee_1",
                author: "Algirdas",
                url: "https://commons.wikimedia.org/wiki/File:Trifolium_repens1.jpg",
                license: "CC BY-SA 3.0",
                authorURL: "https://lt.wikipedia.org/wiki/User:Algirdas",
                caption: "Weißklee"
            ),
            SpeciesImage(
                file: "klee_2",
                author: "Sanja565658",
                url: "https://commons.wikimedia.org/wiki/File:Trifolium_medium_01.jpg",
                license: "CC BY-SA 3.0",
                authorURL: "https://commons.wikimedia.org/wiki/User:Sanja565658",
                caption: "Wiesenklee"
            ),
        ],
        season: .summer
    ),
    Species(
        id: 6,
        name: "Disteln",
        gender: .feminine,
        description: [
            "Disteln haben einen runden Blüten-Kopf.",
            "Er ist lila oder rosa.",
            "Die Blätter haben spitze Stacheln.",
            "Sie geben Nahrung für viele Hummeln und Schmetterlinge.",
            "Vögel fressen die Samen.",
        ],
        tips: [
            "Suche Disteln auf einer sonnigen Wiese.",
        ],
        squareImage: "disteln_sq",
        images: [
            SpeciesImage(
                file: "distel_1",
                author: "Robert Flogaus-Faust",
                url: "https://commons.wikimedia.org/wiki/File:Carduus_crispus_RF.jpg",
                license: "CC BY 4.0",
                authorURL: "https://commons.wikimedia.org/wiki/User:Robert_Flogaus-Faust",
                caption: "Krause Distel",
                alignment: .topCenter
            ),
            SpeciesImage(
                file: "distel_2",
                author: "Ivar Leidus",
                url: "https://commons.wikimedia.org/wiki/File:Cirsium_arvense_-_p%C3%B5ldohakas.jpg",
                license: "CC BY 3.0",
                authorURL: "https://commons.wikimedia.org/wiki/User:Iifar",
                caption: "Ackerkratz-Distel",
                alignment: .topCenter
            ),
            SpeciesImage(
                file: "distel_3",
                author: "AnRo0002",
                url: "https://commons.wikimedia.org/wiki/File:29121022Wegdistel_Hockenheimer_Rheinbogen3.jpg",
                license: "CC BY 1.0",
                authorURL: "https://commons.wikimedia.org/wiki/User:AnRo0002",
                caption: "Weg-Distel"
            ),
        ],
        season: .summer
    ),
    Species(
        id: 7,
        name: "Ahorn",
        gender: .masculine,
        description: [
            "Seine Blätter sehen fast wie eine Hand aus.",
            "Sie haben 5 Spitzen.",
            "Die Früchte haben 2 Flügel.",
            "Sie drehen sich beim Fallen durch die Luft.",
            "Im Herbst sind die Blätter gelb oder rot.",
            "Die Blüten geben im Frühling vielen Insekten Nahrung.",
            "Ahorn ist ein Laub-Baum.",
            "Es gibt verschiedene Ahorn-Bäume.",
        ],
        tips: [
            "Suche Ahorn im Park oder am Straßenrand.",
        ],
        squareImage: "ahorn_sq",
        images: [
            SpeciesImage(
                file: "ahorn_1",
                author: "Alice Kracht",
                url: "https://offene-naturfuehrer.de/web/Datei:Acer_pseudoplatanus_(32).JPG",
                license: "CC BY-SA 4.0",
                caption: "Berg-Ahorn Frucht"
            ),
            SpeciesImage(
                file: "ahorn_2",
                author: "Alice Kracht",
                url: "http://species-id.net/openmedia/File:Acer_platanoides_%286%29.JPG",
                license: "CC BY-SA 4.0",
                caption: "Spitz-Ahorn Blatt"
            ),
        ],
        season: .summer
    ),
    Species(
        id: 8,
        name: "Meisen",
        gender: .feminine,
        description: [
            "Meisen hängen oft mit dem Kopf nach unten an Ästen.",
            "Sie hüpfen schnell durch Bäume und Sträucher.",
            "Sie haben einen kurzen Schnabel.",
            "Im Frühling füttern sie ihre Jungen mit Raupen.",
            "Meisen sind Vögel.",
        ],
        tips: [
            "Schau in Bäume und Sträucher.",
            "Höre auf ihren Gesang.",
        ],
        squareImage: "meisen_sq",
        images: [
            SpeciesImage(
                file: "meise_1",
                author: "Andreas Trepte",
                url: "https://commons.wikimedia.org/wiki/File:Great-Tit.jpg",
                license: "CC BY-SA 2.5",
                authorURL: "http://photo-natur.de",
                caption: "Kohl-Meise"
            ),
            SpeciesImage(
                file: "meise_2",
                author: "Maximilian Dorsch",
                url: "https://commons.wikimedia.org/wiki/File:ParusCaeruleus.jpg",
                license: "CC BY-SA 3.0",
                caption: "Blau-Meise"
            ),
            SpeciesImage(
                file: "meise_3",
                author: "Aviceda",
                url: "https://commons.wikimedia.org/wiki/File:Coal_tit_UK09.JPG",
                license: "CC BY-SA 3.0",
                authorURL: "https://commons.wikimedia.org/wiki/User:Aviceda",
                caption: "Tannen-Meise"
            ),
        ],
        audio: AudioAsset(
            file: "meisen.mp3",
            name: "Gesang",
            license: "CC BY-SA 3.0",
            author: "Frommolt"
        ),
        season: .summer
    ),
    Species(
        id: 21,
        name: "Teichfrosch",
        gender: .masculine,
        description: [
            "Er ist meistens grün und hat dunkle Flecken auf dem Rücken.",
            "Er hat lange Hinterbeine.",
            "Damit kann er weit springen.",
            "Seine Füße helfen ihm beim Schwimmen.",
            "Bei Gefahr springt er schnell ins Wasser.",
            "Teichfrösche fressen Insekten und andere kleine Tiere.",
            "Die Männchen quaken und rufen im Sommer die Weibchen.",
        ],
        tips: [
            "Suche an Teichen und Seen.",
            "Oft hört man den Frosch zuerst.",
            "Zwischen den Pflanzen ist er gut versteckt.",
        ],
        squareImage: "teichfrosch_sq",
        images: [
            SpeciesImage(
                file: "teichfrosch_pan",
                author: "Grand-Duc, Niabot",
                url: "https://commons.wikimedia.org/wiki/File:Rana_esculenta_on_Nymphaea_edit.JPG",
                license: "CC BY 3.0",
                authorURL: "https://commons.wikimedia.org/wiki/User:Grand-Duc",
                caption: "Teichfrosch"
            ),
        ],
        audio: AudioAsset(
            file: "teichfrosch.mp3",
            name: "Quaken",
            license: "CC BY-SA 3.0",
            author: "T. Trilar (PMSL)"
        ),
        season: .summer,
        isDifficult: true
    ),
    Species(
        id: 22,
        name: "Tagpfauenauge",
        gender: .neutrum,
        description: [
            "Das Tagpfauenauge ist ein auffälliger Schmetterling.",
            "Seine Flügel sind orange, braun und schwarz.",
            "Auf jedem Flügel hat es einen großen Fleck.",
            "Der Fleck sieht wie ein Auge aus.",
            "Bei Gefahr öffnet es schnell seine Flügel.",
            "Die großen Augen-Flecken können Feinde erschrecken.",
            "Seine Raupen fressen Brennnesselblätter.",
            "Es überwintert an geschützten Orten.",
        ],
        tips: [
            "Es fliegt im Sommer durch Gärten, über Wiesen und an Wegrändern.",
            "Suche an sonnigen Stellen mit vielen Blüten.",
            "Nicht immer hat man Glück einen zu sehen.",
        ],
        squareImage: "tagpfauenauge_sq",
        images: [
            SpeciesImage(
                file: "tagpfauenauge_pan",
                author: "Andreas Eichler",
                url: "https://commons.wikimedia.org/wiki/File:2014.04.12.-10-Kirschgartshaeuser_Schlaege_Mannheim-Tagpfauenauge.jpg",
                license: "CC BY-SA 4.0",
                authorURL: "https://commons.wikimedia.org/wiki/User:Hockei"
            ),
        ],
        season: .summer,
        isDifficult: true
    ),
].sorted { $0.name < $1.name }
