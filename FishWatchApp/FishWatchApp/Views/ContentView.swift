//
//  ContentView.swift
//  FishWatchApp
//
//  Created by Thibaud Lambert on 26/10/2020.
//

import SwiftUI

struct ContentView: View {

    @State private var isLoading = true
    @State private var searchValue = ""
    @State private var speciesList = SpeciesList(speciesData: [[]])
    @State private var isSearching = false

    var body: some View {

        VStack {
            if isLoading {
                LoadingView(loadingText: "Fetching data...")
            } else {
                // We show the loading view during data recovery
                NavigationView {
                    VStack(alignment: .center, spacing: 0, content: {
                        SearchBarView(text: $searchValue, placeholder: "Search fish")

                        if isSearching {
                            ZStack(alignment: Alignment(horizontal: .center, vertical: .center), content: {
                                ProgressView("Searching...")
                            })
                                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                        } else {
                            speciesList
                        }
                    })
                        .background(Color.App.background.edgesIgnoringSafeArea(.all))
                        .navigationBarTitle("Species", displayMode: .inline)
                }
            }
        }
            .onAppear {
                SpeciesManager.shared.loadSpecies {
                    isLoading.toggle()
                    speciesList = SpeciesList(speciesData: SpeciesManager.shared.speciesOrdered())
                }
            }
            .onChange(of: searchValue, perform: { value in
                isSearching = true

                DispatchQueue(label: "SearchingSpecies", qos: .userInteractive).async/*After(deadline: .now() + 1)*/ {
                    speciesList = SpeciesList(speciesData: SpeciesManager.shared.speciesSearched(searchValue: searchValue))
                    isSearching = false
                }
            })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
