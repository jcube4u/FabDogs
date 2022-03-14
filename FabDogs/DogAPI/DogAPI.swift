//
//  DogAPI.swift
//  FabDogs
//
//  Created by Jidh George on 10/03/2022.
//

import Foundation
import PromiseKit
import Alamofire

enum DogAPIError: Error {
    case networkError
    case parsingError

}
protocol TheDogAPILoaderProtocol {
    func getCommonDogBreeds() -> Promise<[DogBreed]>
}

class TheDogAPIFetcher: TheDogAPILoaderProtocol {

    func getCommonDogBreeds() -> Promise<[DogBreed]> {
        let components = listofBreedsComponents()
        let url = components.url?.absoluteString
        let (promise, resolver) = Promise<[DogBreed]>.pending()

        print("!! URL \(url!)")
        AF.request(url!)
            .validate(statusCode: 200..<300)
            .validate(contentType: ["application/json"])
            .responseData { response in
                if let error = response.error{
                    resolver.reject(error)
                }

                if let data = response.data {
                    do{
                        let breeds = try JSONDecoder().decode([DogBreed].self, from: data)
                        resolver.fulfill(breeds)
                        print("!! Success ")
                    } catch let error {
                        print("!!  \(error)")
                        resolver.reject(DogAPIError.parsingError)
                    }
                }else{
                    resolver.fulfill([DogBreed]())
                }
            }
            return promise
    }
/*
    private func downloadPhotos(photos: [Photo]) -> Promise<[UIImage]> {
        return Promise { seal in
            var count = 0
            for photo in photos {
                guard let photoUrl = URL(string: photo.url) else {
                    seal.reject(PhotoError.downloadPhotoUrl)
                    return
                }
                guard let photoData = try? Data(contentsOf: photoUrl) else {
                    seal.reject(PhotoError.downloadPhotoConvertToData)
                    return
                }
                guard let photoImage = UIImage(data: photoData) else {
                    seal.reject(PhotoError.downloadPhotoConvertToUIImage)
                    return
                }
                self.photos.append(photoImage)
                count+=1
                print("Finished downloading photo: " + String(count))

            }
            print("Finished downloading \(self.photos.count) photos")
            seal.fulfill(self.photos)
        }
    }
 */
}


private extension TheDogAPIFetcher {

    struct TheDogAPIFetcherAPI {
        static let scheme = "https"
        static let host = "api.thedogapi.com"
        static let breedsPath = "/v1/breeds"
        static let key = "340f3165-aece-46f2-8cdd-2b40782caaf3"

    }

    func listofBreedsComponents() -> URLComponents {

        var components = URLComponents()
        components.scheme =  TheDogAPIFetcherAPI.scheme
        components.host = TheDogAPIFetcherAPI.host
        components.path = TheDogAPIFetcherAPI.breedsPath

        components.queryItems = [
            URLQueryItem(name: "attach_breed", value: "0"),
            URLQueryItem(name: "page", value: "2"),
            URLQueryItem(name: "limit", value: "40"),
            URLQueryItem(name: "x-api-key", value: TheDogAPIFetcherAPI.key)
        ]
        return components
    }
}
