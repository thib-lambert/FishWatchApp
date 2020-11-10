//
//  SpeciesQuote.swift
//  FishWatchApp
//
//  Created by Thibaud Lambert on 28/10/2020.
//

import SwiftUI

struct SpeciesQuote: View {

    private var quote: String

    init(quote: String) {
        self.quote = quote
    }

    var body: some View {
        Text(quote)
            .foregroundColor(.white)
            .font(.footnote)
            .bold()
            .padding(20)
            .frame(minWidth: 0, maxWidth: .infinity)
            .multilineTextAlignment(.center)
            .background(Color.SpeciesView.quote)
    }
}

struct SpeciesQuote_Previews: PreviewProvider {
    static var previews: some View {
        SpeciesQuote(quote: "Quote")
    }
}
