//
//  MockModelData.swift
//  FabDogsTests
//
//  Created by Jidh George on 13/03/2022.
//

import Foundation
@testable import FabDogs

final class MockBreedsModelData {

    private let filename: String
    init(filename: String = "dogBreedsSample.json") {
        self.filename = filename
    }

    func load() -> [DogBreed] {
        let data: Data

        guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
            else {
                fatalError("Couldn't find \(filename) in main bundle.")
        }

        do {
            data = try Data(contentsOf: file)
        } catch {
            fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
        }

        do {
            let decoder = JSONDecoder()
            return try decoder.decode(DogBreeds.self, from: data)
        } catch {
            fatalError("Couldn't parse \(filename) as \(DogBreeds.self):\n\(error)")
        }
    }
}
