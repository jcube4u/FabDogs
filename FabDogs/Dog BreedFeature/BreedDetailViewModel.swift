//
//  BreedDetailViewModel.swift
//  FabDogs
//
//  Created by Jidh George on 11/03/2022.
//

import Foundation
import PromiseKit

struct BreedDetailViewModel: Identifiable {

    let dataNotAvailable: String = "Data not available"
    let breed: DogBreed

    init(breed: DogBreed) {
        self.breed = breed

    }

    var name: String {
        return breed.name
    }
    var bredFor: String {
        if let bredfor = breed.bredFor,
           bredfor.isEmpty == false {
            return bredfor
        }
        return dataNotAvailable
    }
    var country: String {
        if let countryCode = breed.countryCode,
           countryCode.isEmpty == false {
            return countryCode
        }
        return dataNotAvailable
    }
    var group: String {
        if let group = breed.breedGroup,
           group.isEmpty == false {
            return group
        }
        return dataNotAvailable
    }
    var temprament: String {
        return breed.temperament
    }
    var lifeSpan: String {
        return breed.lifeSpan
    }
    var height: Feature {
        return breed.height
    }
    var weight: Feature {
        return breed.weight
    }

    var imageURL: String {
        return breed.image.url
    }

    var id: Int {
        return breed.id
    }


}

//class ImageLoader {
//
//    func getIcon(named: String) -> Promise<UIImage> {
//
//      let url = URL(string: named)!
//
//      return firstly {
//        URLSession.shared.dataTask(.promise, with: url)
//      }
//      .then(on: DispatchQueue.global(qos: .background)) { urlResponse in
//        Promise.value(UIImage(data: urlResponse.data)!)
//      }
//    }
//}
