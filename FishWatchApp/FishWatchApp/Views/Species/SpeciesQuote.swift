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
            .multilineTextAlignment(.center)
            .frame(minWidth: 0, maxWidth: .infinity)
            .padding(20)
            .background(Color.SpeciesView.quote)
    }
}

#if DEBUG
struct SpeciesQuote_Previews: PreviewProvider {
    static var previews: some View {
        SpeciesQuote(quote: "Quote")
    }
}
#endif
