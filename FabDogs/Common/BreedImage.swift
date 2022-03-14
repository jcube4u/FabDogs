//
//  BreedImage.swift
//  FabDogs
//
//  Created by Jidh George on 11/03/2022.
//

import Foundation
import SwiftUI

struct BreedImage: View {
    var image: Image

    var body: some View {
        image.padding()
    }
}

struct BreedImage_Previews: PreviewProvider {
    static var previews: some View {
        BreedImage(image: Image("defaultImage"))
    }
}
