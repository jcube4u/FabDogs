//
//  BreedDetailViewModelTests.swift
//  FabDogsTests
//
//  Created by Jidh George on 13/03/2022.
//

import XCTest
@testable import FabDogs

class BreedDetailViewModelTests: XCTestCase {

    func test_breedDetailsViewModel_createsObject_correctExpectedData() throws {
        let modelData =  MockBreedsModelData().load().first!
        let sut = BreedDetailViewModel(breed: modelData)

        XCTAssertEqual(sut.name, "American Bully")
        XCTAssertEqual(sut.bredFor, "Family companion dog")

        XCTAssertEqual(sut.bredFor, "Family companion dog")
        XCTAssertEqual(sut.country, "US")
        XCTAssertEqual(sut.group, "Data not available")
        XCTAssertEqual(sut.temprament, "Strong Willed, Stubborn, Friendly, Clownish, Affectionate, Loyal, Obedient, Intelligent, Courageous")
        XCTAssertEqual(sut.lifeSpan, "8 – 15 years")

        let height: Feature = sut.height
        XCTAssertEqual(height.imperial, "14 - 17")

        let weight: Feature = sut.weight
        XCTAssertEqual(weight.imperial, "30 - 150")
        XCTAssertEqual(sut.imageURL, "https://cdn2.thedogapi.com/images/sqQJDtbpY.jpg")
        XCTAssertEqual(sut.id, 11)
    }
}
