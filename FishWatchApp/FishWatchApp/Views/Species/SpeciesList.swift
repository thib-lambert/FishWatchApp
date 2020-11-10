//
//  SpeciesList.swift
//  FishWatchApp
//
//  Created by Thibaud Lambert on 26/10/2020.
//

import SwiftUI

struct SpeciesList: View {

    private var speciesData: [[FishWatchSpecies]]

    init(speciesData: [[FishWatchSpecies]]) {
        self.speciesData = speciesData
    }

    var body: some View {
        // Display list only if is not empty
        if !speciesData.isEmpty {

            ScrollView {
                VStack(alignment: .center, spacing: 10, content: {
                    ForEach(speciesData, id: \.self) { speciesOrdered in
                        let firstLetter = String(speciesOrdered.first!.speciesName.first!.uppercased())

                        VStack(alignment: .center, spacing: 5, content: {
                            Text(firstLetter)
                                .font(.title2)
                                .padding()
                                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)

                            ForEach(speciesOrdered) { species in
                                NavigationLink(
                                    destination: SpeciesView(species: species),
                                    label: {
                                        SpeciesRow(species: species)
                                    }) // End NavigationLink
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray))
                                    .padding([.leading, .trailing], 15)
                            } // End ForEach speciesOrdered
                        })
                    } // End ForEach speciesData
                }) // End VStack
            } // End ScrollView
        } else {
            // Display NoData view
            NoDataView()
        }
    }
}

struct SpeciesList_Previews: PreviewProvider {
    static var previews: some View {
        SpeciesList(speciesData: [[FishWatchSpecies.preview, FishWatchSpecies.preview], [FishWatchSpecies.preview]])
    }
}
