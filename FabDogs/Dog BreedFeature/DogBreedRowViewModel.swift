//
//  DogBreedsRowViewModel.swift
//  FabDogs
//
//  Created by Jidh George on 10/03/2022.
//

import Foundation


struct DogBreedRowViewModel: Identifiable {
    
    let dataNotAvailable: String = "Data not available"
    let dogBreed: DogBreed

    init(dogBreed: DogBreed){
        self.dogBreed = dogBreed
    }
    var title: String {
        return dogBreed.name
    }
    var subTitle: String {
        if let bredfor = dogBreed.bredFor,
           bredfor.isEmpty == false {
            return bredfor
        }
        return dataNotAvailable
    }

    var id: Int {
        return dogBreed.id
    }
}

extension DogBreedRowViewModel: Hashable {
    static func == (lhs: DogBreedRowViewModel, rhs: DogBreedRowViewModel) -> Bool {
      return lhs.title  == rhs.title
    }

    func hash(into hasher: inout Hasher) {
      hasher.combine(self.title)
    }
  }
