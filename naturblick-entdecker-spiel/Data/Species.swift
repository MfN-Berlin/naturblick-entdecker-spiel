import Foundation
import SwiftUI

nonisolated let audioSourceURL = "https://suche.tierstimmenarchiv.de"

nonisolated enum Season: String, CaseIterable, Identifiable, Hashable, Sendable {
    case winter, spring, summer, autumn

    var id: Self { self }

    var germanName: String {
        switch self {
        case .winter: "Winter"
        case .spring: "Frühling"
        case .summer: "Sommer"
        case .autumn: "Herbst"
        }
    }

    var systemImage: String {
        switch self {
        case .winter: "snowflake"
        case .spring: "camera.macro"
        case .summer: "sun.max"
        case .autumn: "leaf"
        }
    }

    static func of(_ date: Date, calendar: Calendar = .current) -> Season {
        switch calendar.component(.month, from: date) {
        case 3...5: .spring
        case 6...8: .summer
        case 9...11: .autumn
        default: .winter
        }
    }

    static func today() -> Season { of(Date()) }
}

nonisolated enum Gender: String, CaseIterable, Hashable, Sendable {
    case masculine, feminine, neutrum

    var nominative: String {
        switch self {
        case .masculine: "der"
        case .feminine: "die"
        case .neutrum: "das"
        }
    }

    var accusative: String {
        switch self {
        case .masculine: "den"
        case .feminine: "die"
        case .neutrum: "das"
        }
    }

    var indefiniteAccusative: String {
        switch self {
        case .masculine: "einen"
        case .feminine: "eine"
        case .neutrum: "ein"
        }
    }
}

nonisolated struct Copyright: Hashable, Sendable {
    let license: String
    let author: String
    let url: URL
    let authorURL: URL?
}

nonisolated enum ImageAlignment: Hashable, Sendable {
    case topStart, topCenter, topEnd
    case centerStart, center, centerEnd
    case bottomStart, bottomCenter, bottomEnd
    case bias(x: Double, y: Double)

    var bias: (x: Double, y: Double) {
        switch self {
        case .topStart: (-1, -1)
        case .topCenter: (0, -1)
        case .topEnd: (1, -1)
        case .centerStart: (-1, 0)
        case .center: (0, 0)
        case .centerEnd: (1, 0)
        case .bottomStart: (-1, 1)
        case .bottomCenter: (0, 1)
        case .bottomEnd: (1, 1)
        case let .bias(x, y): (x, y)
        }
    }

    var unitPoint: UnitPoint {
        let (x, y) = bias
        return UnitPoint(x: (x + 1) / 2, y: (y + 1) / 2)
    }
}

nonisolated struct SpeciesImage: Hashable, Sendable {
    let file: String
    let license: String
    let author: String
    let url: URL
    let authorURL: URL?
    let caption: String?
    let alignment: ImageAlignment

    init(
        file: String,
        author: String,
        url: String,
        license: String,
        authorURL: String? = nil,
        caption: String? = nil,
        alignment: ImageAlignment = .center
    ) {
        self.file = file
        self.author = author
        self.url = URL(string: url)!
        self.license = license
        self.authorURL = authorURL.flatMap(URL.init(string:))
        self.caption = caption
        self.alignment = alignment
    }

    var copyright: Copyright {
        Copyright(license: license, author: author, url: url, authorURL: authorURL)
    }

    var image: Image { Image(file) }
}

nonisolated struct AudioAsset: Hashable, Sendable {
    let file: String
    let name: String
    let license: String
    let author: String

    var url: URL? {
        let base = (file as NSString).deletingPathExtension
        let ext = (file as NSString).pathExtension
        return Bundle.main.url(forResource: base, withExtension: ext)
    }

    var copyright: Copyright {
        Copyright(license: license, author: author, url: URL(string: audioSourceURL)!, authorURL: nil)
    }
}

nonisolated struct Species: Identifiable, Hashable, Sendable {
    let id: Int
    let name: String
    let gender: Gender
    let description: [String]
    let tips: [String]
    let squareImage: String
    let images: [SpeciesImage]
    let audio: AudioAsset?
    let season: Season
    let isDifficult: Bool

    init(
        id: Int,
        name: String,
        gender: Gender,
        description: [String],
        tips: [String],
        squareImage: String,
        images: [SpeciesImage],
        audio: AudioAsset? = nil,
        season: Season,
        isDifficult: Bool = false
    ) {
        self.id = id
        self.name = name
        self.gender = gender
        self.description = description
        self.tips = tips
        self.squareImage = squareImage
        self.images = images
        self.audio = audio
        self.season = season
        self.isDifficult = isDifficult
    }

    var article: String { gender.nominative }
    var articleAccusative: String { gender.accusative }
    var indefiniteArticleAccusative: String { gender.indefiniteAccusative }

    var formattedDescription: [AttributedString] { description.map(AttributedString.bold) }

    var thumbnail: Image { Image(squareImage) }
}

nonisolated extension AttributedString {
    static func bold(_ text: String) -> AttributedString {
        var result = AttributedString()
        for (index, part) in text.components(separatedBy: "**").enumerated() {
            var piece = AttributedString(part)
            if index % 2 == 1 {
                piece.inlinePresentationIntent = .stronglyEmphasized
            }
            result += piece
        }
        return result
    }
}
