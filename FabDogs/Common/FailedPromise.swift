//
//  FailedPromise.swift
//  FabDogs
//
//  Created by Jidh George on 10/03/2022.
//

import Foundation
import PromiseKit

func brokenPromise<T>(method: String = #function) -> Promise<T> {
  return Promise<T>() { seal in
    let err = NSError(domain: "TheDogBreedAPI", code: 0, userInfo: [NSLocalizedDescriptionKey: "'\(method)' not yet implemented."])
    seal.reject(err)
  }
}

