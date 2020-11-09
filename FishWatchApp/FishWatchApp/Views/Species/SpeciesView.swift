//
//  SpeciesView.swift
//  FishWatchApp
//
//  Created by Thibaud Lambert on 26/10/2020.
//

import SwiftUI

struct SpeciesView: View {
    var species: FishWatchSpecies

    var body: some View {
        VStack(spacing: 0) {
            SpeciesTitleView(name: species.speciesName, scientificNames: species.scientificName)

            SpeciesProfilView(imageSrc: species.speciesIllustrationPhoto?.src, speciesAliases: species.speciesAliases)

            Divider()

            ScrollView {
                VStack(alignment: .center, spacing: 20, content: {
                    SpeciesQuote(quote: species.quote)

                    Group {
                        SpeciesInformationsRow(title: "POPULATION", content: species.population, imageName: "population")

                        SpeciesInformationsRow(title: "FISHING RATE", content: species.fishingRate, imageName: "fishingRate")

                        SpeciesInformationsRow(title: "HABITAT IMPACTS", content: species.habitatImpacts, imageName: "habitatImpacts")

                        SpeciesInformationsRow(title: "BYCATCH", content: species.bycatch, imageName: "bycatch")

                        SpeciesInformationsRow(title: "AVAILABILITY", content: species.availability)

                        SpeciesInformationsRow(title: "SOURCE", content: species.source)

                        SpeciesInformationsRow(title: "TASTE", content: species.taste)

                        SpeciesInformationsRow(title: "TEXTURE", content: species.texture)

                        SpeciesInformationsRow(title: "COLOR", content: species.color)

                        SpeciesInformationsRow(title: "HEALTH BENEFITS", content: species.healthBenefits)

                    } // End Group

                    SpeciesScienceList(speciesScienceInformations: species.scienceInformations, lastUpdate: species.lastUpdate)

                }) // End VStack
                .padding()

            } // End ScrollView
            .background(Image("sand").resizable().aspectRatio(contentMode: .fill))
        } // END VStack main wrapper
        .navigationBarTitle(species.speciesName)
            .ignoresSafeArea(.all, edges: .bottom)
    }
}

struct SpeciesView_Previews: PreviewProvider {
    static var previews: some View {
        SpeciesView(species: FishWatchSpecies.preview)
    }
}
