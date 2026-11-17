import SwiftUI
import XCTest
@testable import naturblick_entdecker_spiel

final class SpeciesDataTests: XCTestCase {
    func testSpeciesListIsNotEmptyAndIdsAreUnique() {
        XCTAssertFalse(speciesList.isEmpty)
        XCTAssertEqual(Set(speciesList.map(\.id)).count, speciesList.count)
    }

    func testAllImagesLoad() {
        for species in speciesList {
            XCTAssertNotNil(species.squareUIImage, "\(species.name): \(species.squareImage) fehlt")
            for image in species.images {
                XCTAssertNotNil(image.uiImage, "\(species.name): \(image.file) fehlt")
            }
        }
    }

    func testAllAudioFilesExist() {
        for species in speciesList {
            if let audio = species.audio {
                XCTAssertNotNil(audio.url, "\(species.name): \(audio.file) fehlt")
            }
        }
    }

    func testBoldMarkup() {
        let text = AttributedString.bold("Regenwürmer haben **keine** Beine.")
        XCTAssertEqual(String(text.characters), "Regenwürmer haben keine Beine.")
        let bold = text.runs.filter { $0.inlinePresentationIntent == .stronglyEmphasized }
        XCTAssertEqual(bold.count, 1)
        XCTAssertEqual(bold.first.map { String(text[$0.range].characters) }, "keine")
    }

    func testAlignmentMapping() {
        XCTAssertEqual(ImageAlignment.topStart.unitPoint, .topLeading)
        XCTAssertEqual(ImageAlignment.center.unitPoint, .center)
        XCTAssertEqual(ImageAlignment.bias(x: 0, y: 0.4).unitPoint, UnitPoint(x: 0.5, y: 0.7))
    }
}
