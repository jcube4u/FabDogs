//
//  FabDogsTests.swift
//  FabDogsTests
//
//  Created by Jidh George on 10/03/2022.
//

import XCTest
@testable import FabDogs
import SwiftUI
import PromiseKit

class FabDogsTests: XCTestCase {

    var breedsViewModel: BreedsViewModel?

    override func setUp() {

        let mockAPIService: TheDogAPILoaderProtocol = MockDogAPIService(with: "dogBreedsSample.json")
        breedsViewModel = BreedsViewModel(contentLoader: mockAPIService)
    }
    func testInitialization() {
        let apiService = MockDogAPIService(with: "dogBreedsSample.json")
        let sut = BreedsViewModel(contentLoader: apiService)
        XCTAssertNotNil(sut)
    }

    func testUpdateView_emptyResponse_emptyDataSource() throws {

        let mockAPIService: TheDogAPILoaderProtocol = MockDogAPIService(with: "emptyResponse.json")
        let sut = BreedsViewModel(contentLoader: mockAPIService)

        sut.updateDogBreeds()

        XCTAssertEqual(sut.dataSource.count,0)

    }
}
