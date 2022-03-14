//
//  FabDogsApp.swift
//  FabDogs
//
//  Created by Jidh George on 10/03/2022.
//

import SwiftUI

@main
struct FabDogsApp: App {
    @StateObject var modelData =  DogBreedsModelData()
    @State private var selection: Tab = .topDogs

    enum Tab {
        case topDogs
        case bredFor
    }
    var body: some Scene {
        WindowGroup {
            if NSClassFromString("XCTestCase") == nil {
                AppMainView()
            } else {
                TestApp()
            }
        }
    }
    // We dont want the main view to be used in the Unit TestSuite
    fileprivate func AppMainView() -> some View {
        return TabView(selection: $selection) {
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
        .environmentObject(modelData)
    }
}

struct TestApp: View {

    var body: some View {
         Text("Running Unit Tests") 
    }
}
