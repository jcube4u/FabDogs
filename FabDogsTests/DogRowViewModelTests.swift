//
//  DogRowViewModelTests.swift
//  FabDogsTests
//
//  Created by Jidh George on 13/03/2022.
//

import XCTest

@testable import FabDogs
class DogRowViewModelTests: XCTestCase {


    func test_dogRowViewModel_createsObject_correctTitle() throws {
        let modelData =  MockBreedsModelData().load().first!
        let sut = DogBreedRowViewModel(dogBreed: modelData)

        XCTAssertEqual(sut.title, "American Bully")
        XCTAssertEqual(sut.subTitle, "Family companion dog")
        XCTAssertEqual(sut.id, 11)
    }

    func test_dogRowViewModel_createsObject_correctSubtitle() throws {
        let dogBreed =  MockBreedsModelData(filename: "missingBredFor.json").load().first!
        let sut = DogBreedRowViewModel(dogBreed: dogBreed)

        XCTAssertEqual(sut.subTitle, "Data not available")
    }
}
