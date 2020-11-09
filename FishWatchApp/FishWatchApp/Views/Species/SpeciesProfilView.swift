//
//  SpeciesProfilView.swift
//  FishWatchApp
//
//  Created by Thibaud Lambert on 27/10/2020.
//

import SwiftUI
import Alamofire
import SDWebImageSwiftUI

struct SpeciesProfilView: View {

    @State fileprivate var isFailure = false

    var imageSrc: String?
    var speciesAliases: [String]

    var body: some View {
        VStack {

            if let imageUrl = imageSrc, !isFailure {
                WebImage(url: URL(string: imageUrl))
                    .resizable()
                    .placeholder {
                        LottieView(filename: "loading")
                    }
                    .onFailure(perform: { _ in
                        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2) {
                            isFailure.toggle()
                        }
                    })
                    .aspectRatio(contentMode: .fit)
                    .transition(.fade(duration: 0.5))
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .frame(height: 100, alignment: .center)
                    .padding([.top, .bottom], 5)
            } else {
                Image("notFound")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .frame(height: 75, alignment: .center)
                    .padding()
            }

            VStack(spacing: 0) {
                Text("ALSO KNOW AS")
                    .font(.body)
                    .bold()

                Text(speciesAliases.joined(separator: " \u{2E31} "))
                    .italic()
                    .multilineTextAlignment(.center)
                    .font(.subheadline)
                    .padding([.top, .bottom], 5)
                    .padding([.leading, .trailing], 10)
            }
        }
        .background(Color.white)
    }
}

struct SpeciesProfilView_Previews: PreviewProvider {
    static var previews: some View {
        SpeciesProfilView(imageSrc: nil, speciesAliases: ["Alias_1", "Alias_2", "Alias_3"])
    }
}
