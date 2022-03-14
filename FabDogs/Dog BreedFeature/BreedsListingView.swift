//
//  BreedsListingView.swift
//  FabDogs
//
//  Created by Jidh George on 10/03/2022.
//

import Foundation
import SwiftUI

struct BreedsListingView: View {
    @ObservedObject var viewModel: BreedsViewModel

    init(viewModel: BreedsViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
      NavigationView {
        List {
          if viewModel.dataSource.isEmpty {
            emptySection
          } else {
              DogsListSection
          }
        }
        .listStyle(GroupedListStyle())
        .navigationBarTitle("Fab Dogs")
      }
    }
}

extension  BreedsListingView {

    var DogsListSection: some View {
      Section {
          ForEach(viewModel.dataSource) { breed in
              NavigationLink {
                  BreedDetailView.init(viewModel: breed)
              } label: {
                  DogBreedRow.init(viewModel: breed)
              }
          }
      }
    }
    var emptySection: some View {
      Section {
          HStack(alignment: .center) {
              Text("No results")
                  .foregroundColor(.gray)
          }
      }
    }
}

struct BreedsListingView_Previews: PreviewProvider {
    static var previews: some View {
        let breedsViewModel = BreedsViewModel(contentLoader: TheDogAPIFetcher())
        BreedsListingView(viewModel: breedsViewModel)
    }
}
