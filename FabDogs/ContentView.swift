//
//  ContentView.swift
//  FabDogs
//
//  Created by Jidh George on 10/03/2022.
//

import SwiftUI

struct ContentView: View {
    @State private var selection: Tab = .topDogs
    enum Tab {
        case topDogs
        case bredFor
    }

    var body: some View {
        TabView(selection: $selection) {
            let viewModel = BreedsViewModel()
            BreedsListingView(viewModel: viewModel)
                .tabItem {
                    Label("Featured", systemImage: "star")
                }
                .tag(Tab.topDogs)

            BreedsListingView(viewModel: viewModel)
                .tabItem {
                    Label("List", systemImage: "list.bullet")
                }
                .tag(Tab.bredFor)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(DogBreedsModelData())
    }
}
