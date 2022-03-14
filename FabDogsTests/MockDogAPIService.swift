//
//  MockDogAPIService.swift
//  FabDogsTests
//
//  Created by Jidh George on 12/03/2022.
//

import XCTest
import PromiseKit

@testable import FabDogs

class MockDogAPIService: TheDogAPILoaderProtocol {
    private let fileName: String
    init(with file: String ){
        fileName = file
    }

    func getCommonDogBreeds() -> Promise<[DogBreed]> {
        print("Calling Mock Dog Api Service")
        let (promise, resolver) = Promise<[DogBreed]>.pending()
        let breeds: [DogBreed] = load(fileName)
        resolver.fulfill(breeds)
        return promise
    }

}
