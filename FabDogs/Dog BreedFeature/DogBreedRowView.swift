//
//  DogBreedRowView.swift
//  FabDogs
//
//  Created by Jidh George on 10/03/2022.
//

import Foundation
import SwiftUI

struct DogBreedRow: View {

    let viewModel: BreedDetailViewModel
    init(viewModel: BreedDetailViewModel){
        self.viewModel = viewModel
    }
    var body: some View {
        VStack(alignment: .leading, spacing:10) {
            Spacer()
            Text("\(viewModel.name)")
                .font(Font.system(size: 16).lowercaseSmallCaps()).bold()

            Text("\(viewModel.bredFor)")
                .font(Font.system(size: 13).lowercaseSmallCaps()).fontWeight(.regular)
            Spacer()

        }
    }
}

struct DogBreedRow_Previews: PreviewProvider {
    static var previews: some View {
        List {
            DogBreedRow(viewModel: BreedDetailViewModel(breed: DogBreedsModelData().breeds.first!))
            DogBreedRow(viewModel: BreedDetailViewModel(breed: DogBreedsModelData().breeds.last!))
            DogBreedRow(viewModel: BreedDetailViewModel(breed: DogBreedsModelData().breeds.first!))
            DogBreedRow(viewModel: BreedDetailViewModel(breed: DogBreedsModelData().breeds.last!))

        }.listRowBackground(Color.gray)
    }
}
