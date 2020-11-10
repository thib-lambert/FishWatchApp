//
//  SpeciesScienceList.swift
//  FishWatchApp
//
//  Created by Thibaud Lambert on 28/10/2020.
//

import SwiftUI

struct SpeciesScienceList: View {

    private var speciesScienceInformations: [SpeciesScienceOption]
    private var lastUpdate: String

    init(speciesScienceInformations: [SpeciesScienceOption], lastUpdate: String) {
        self.speciesScienceInformations = speciesScienceInformations
        self.lastUpdate = lastUpdate
    }

    var body: some View {
        if !speciesScienceInformations.isEmpty {

            VStack(alignment: .center, spacing: 5, content: {
                Text("The Science")
                    .font(.title2)
                    .foregroundColor(.black)
                    .padding(.top)

                ForEach(speciesScienceInformations) { option in
                    SpeciesScienceRow(title: option.title, content: option.informations)
                        .padding()
                }

                Text("Last updated: \(lastUpdate)")
                    .font(.footnote)
                    .padding(10)
                    .foregroundColor(.white)
                    .background(Color(UIColor(red: 0, green: 0, blue: 0, alpha: 0.25)))
                    .padding(.bottom)
            })
                .frame(minWidth: 0, maxWidth: .infinity)
                .background(Color.App.background.opacity(0.7))
                .cornerRadius(10)
        } else {
            EmptyView()
        }
    }
}

struct SpeciesScienceList_Previews: PreviewProvider {
    static var previews: some View {
        SpeciesScienceList(speciesScienceInformations: [
            SpeciesScienceOption(title: "POPULATION STATUS", informations: FishWatchSpecies.preview.populationStatus),
            SpeciesScienceOption(title: "LOCATION", informations: FishWatchSpecies.preview.location),
            SpeciesScienceOption(title: "HABITAT", informations: FishWatchSpecies.preview.habitat),
            SpeciesScienceOption(title: "PHYSICAL DESCRIPTION", informations: FishWatchSpecies.preview.physicalDescription),
            SpeciesScienceOption(title: "BIOLOGY", informations: FishWatchSpecies.preview.biology),
            SpeciesScienceOption(title: "RESEARCH", informations: FishWatchSpecies.preview.research)
        ], lastUpdate: "10/28/2020")
    }
}
