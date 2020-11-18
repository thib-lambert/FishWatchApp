//
//  SpeciesRow.swift
//  FishWatchApp
//
//  Created by Thibaud Lambert on 26/10/2020.
//

import SwiftUI
import SDWebImageSwiftUI

struct SpeciesRow: View {

    @State private var isFailure = false

    private var species: FishWatchSpecies

    init(species: FishWatchSpecies) {
        self.species = species
    }

    var body: some View {
        HStack(alignment: .center, spacing: 5, content: {
            if let imageUrl = species.speciesIllustrationPhoto?.src, !isFailure {
                WebImage(url: URL(string: imageUrl))
                    .resizable()
                    .placeholder {
                        LottieView(filename: "loading", animationSpeed: 2)
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 50, height: 50, alignment: .center)
                    }
                    .onFailure(perform: { _ in
                        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2) {
                            isFailure = true
                        }
                    })
                    .aspectRatio(contentMode: .fit)
                    .transition(.fade(duration: 0.5))
                    .frame(width: 50, height: 50, alignment: .center)
                    .padding(5)
            } else {
                Image("notFound")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 50, height: 50, alignment: .center)
                    .padding(5)
            }

            Spacer()

            Text(species.speciesName)
                .font(.headline)
                .multilineTextAlignment(.center)

            Spacer()
        })
    }
}

#if DEBUG
struct SpeciesRow_Previews: PreviewProvider {
    static var previews: some View {
        SpeciesRow(species: FishWatchSpecies.preview)
    }
}
#endif
