//
//  DogBreeds.swift
//  FabDogs
//
//  Created by Jidh George on 10/03/2022.
//

import Foundation

// MARK: - DogBreeds
struct DogBreed: Codable {
    let weight, height: Feature
    let id: Int
    let name: String
    let countryCode: String?
    let bredFor: String?
    let breedGroup: String?
    let lifeSpan, temperament, referenceImageID: String
    let image: DogImage

    enum CodingKeys: String, CodingKey {
        case weight, height, id, name
        case countryCode = "country_code"
        case bredFor = "bred_for"
        case breedGroup = "breed_group"
        case lifeSpan = "life_span"
        case temperament
        case referenceImageID = "reference_image_id"
        case image
    }
}

// MARK: - Feature
struct Feature: Codable {
    let imperial, metric: String
}

// MARK: - Image
struct DogImage: Codable {
    let id: String
    let width, height: Int
    let url: String
}

typealias DogBreeds = [DogBreed]


