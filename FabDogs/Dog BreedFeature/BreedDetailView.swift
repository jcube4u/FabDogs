//
//  BreedDetailView.swift
//  FabDogs
//
//  Created by Jidh George on 11/03/2022.
//

import Foundation
import SwiftUI

struct BreedDetailView: View {

    let viewModel: BreedDetailViewModel
    init(viewModel: BreedDetailViewModel){
        self.viewModel = viewModel
    }

    var body: some View {
        ScrollView {
            VStack(alignment: .center) {
                Text(viewModel.name)
                    .font(.title)
                    .fontWeight(.heavy)
                NetworkImage(url: URL(string: viewModel.imageURL))
                         .frame(width: 350, height: 300)
                         .cornerRadius(5)
            }
            VStack(alignment: .leading) {

            Spacer()
            DividerView().padding(.leading).padding(.trailing)

            Text("About :")
                .font(.title2)
                .fontWeight(.semibold)
            Spacer()

            VStack(alignment: .leading) {
                HStack {
                    Text("Life Span  ").italic()
                    Text(":  " + viewModel.lifeSpan).foregroundColor(.secondary)
                }
                HStack {
                    Text("Country    ").italic()
                    Text(":  " + viewModel.country).foregroundColor(.secondary)
                }

            }.font(.subheadline)


            Spacer()

                categorySection()

            Group() {

                DividerView().padding(.leading).padding(.trailing)
                Spacer()
                Text(viewModel.temprament)

                }
            }.padding(20)
        }

        .navigationTitle("Fab Dogs")
        .navigationBarTitleDisplayMode(.inline)
    }

    fileprivate func categorySection() -> VStack<TupleView<(Spacer, Text, Text, Text, Text)>> {
        return VStack(alignment: HorizontalAlignment.leading) {
            Spacer()
            Text("Category    " + viewModel.bredFor)

            Text("Group         " + viewModel.group)

            let height: Feature = viewModel.height
            Text("Height        " + height.imperial)

            let weight: Feature = viewModel.weight
            Text("Weigth       " + weight.imperial)
        }
    }

}


struct BreedDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let model = BreedDetailViewModel(breed: DogBreedsModelData().breeds.last!)
        BreedDetailView(viewModel: model)
    }
}

