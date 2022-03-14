//
//  BreedsViewModel.swift
//  FabDogs
//
//  Created by Jidh George on 10/03/2022.
//

import Foundation
import SwiftUI

class BreedsViewModel: ObservableObject {

    @Published var dataSource: [BreedDetailViewModel] = []
    private let contentLoader: TheDogAPILoaderProtocol

    init(contentLoader: TheDogAPILoaderProtocol = TheDogAPIFetcher()) {

        self.contentLoader = contentLoader
        updateDogBreeds()
    }

    func updateDogBreeds() {
        print("Fetch Common Dog Breeds  \(self.contentLoader)")

        self.contentLoader.getCommonDogBreeds()
            .map { response in
              response.map(BreedDetailViewModel.init)
            }
            .done { [weak self ] breeds in
                self?.dataSource = breeds
                print("!! Breeds  -  \(String(describing: self?.dataSource.count))")
            }.catch { error in
                print("!! Error  \(error)")
                self.dataSource = []
            }
    }
}

