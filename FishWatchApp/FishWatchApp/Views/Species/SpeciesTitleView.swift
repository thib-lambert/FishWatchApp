//
//  SpeciesTitleView.swift
//  FishWatchApp
//
//  Created by Thibaud Lambert on 27/10/2020.
//

import SwiftUI

/// View wich indicate the species name and scientif name
struct SpeciesTitleView: View {

    private var name: String
    private var scientificNames: String

    init(name: String, scientificNames: String) {
        self.name = name
        self.scientificNames = scientificNames
    }

    var body: some View {
        VStack(alignment: .center, spacing: nil, content: {
            Text(name)
                .foregroundColor(.white)
                .font(.title)
                .bold()

            Text(scientificNames)
                .foregroundColor(.white)
                .font(.title3)
                .italic()
        }).frame(minWidth: 0, maxWidth: .infinity)
            .background(LinearGradient(gradient: Gradient(colors: [Color.SpeciesView.gradientBottom, Color.SpeciesView.gradientTop]), startPoint: .bottom, endPoint: .top))
    }
}

#if DEBUG
struct SpeciesTitleView_Previews: PreviewProvider {
    static var previews: some View {
        SpeciesTitleView(name: "species.speciesName", scientificNames: "species.scientificName")
    }
}
#endif
