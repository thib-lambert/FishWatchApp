//
//  ContentView.swift
//  FishWatchApp
//
//  Created by Thibaud Lambert on 26/10/2020.
//

import SwiftUI

struct ContentView: View {

    /// Indicate if data are fetching
    @State private var isLoading = true

    /// Search term for fish species
    @State private var searchValue = ""

    /// List of species
    @State private var speciesList = SpeciesList(speciesData: [])

    /// Indicate if search is running
    @State private var isSearching = false

    /// SpeciesManager
    @ObservedObject var speciesManager = SpeciesManager.shared

    var body: some View {

        VStack {
            if isLoading {
                LoadingView(loadingText: "Fetching data...")
            } else {
                // We show the loading view during data recovery
                NavigationView {
                    VStack(alignment: .center, spacing: 0, content: {
                        SearchBarView(text: $searchValue, placeholder: "Search fish")
                            .accessibility(identifier: "SearchFish")

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
                // Fetching data when the view appear
                speciesManager.loadSpecies()
            }
            .onChange(of: speciesManager.species, perform: { value in
                // If we are here, so the data are fetched
                isLoading = false
                speciesList = SpeciesList(speciesData: speciesManager.speciesOrdered())
            })
            .onChange(of: searchValue, perform: { value in
                isSearching = true

                DispatchQueue(label: "SearchingSpecies", qos: .userInteractive).async {
                    speciesList = SpeciesList(speciesData: speciesManager.speciesSearched(searchValue: searchValue))
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
