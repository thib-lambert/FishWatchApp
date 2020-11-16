//
//  SpeciesInformationsRow.swift
//  FishWatchApp
//
//  Created by Thibaud Lambert on 28/10/2020.
//

import SwiftUI

struct SpeciesInformationsRow: View {

    private var title: String
    private var content: String
    private var imageName: String?

    init(title: String, content: String, imageName: String? = nil) {
        self.title = title
        self.content = content
        self.imageName = imageName
    }

    var body: some View {

        if !title.isEmpty && !content.isEmpty {
            HStack(alignment: .center, spacing: 10, content: {
                if let imageName = imageName {
                    Image(imageName)
                        .resizable()
                        .renderingMode(.template)
                        .foregroundColor(Color.SpeciesView.information)
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 50, height: 50, alignment: .center)
                }

                VStack(alignment: .leading, spacing: 10, content: {
                    Text(title)
                        .font(.title2)
                        .bold()

                    Text(content)
                        .font(.subheadline)
                        .multilineTextAlignment(.leading)
                })

                Spacer()
            })
                .padding([.leading, .trailing], 20)
                .padding([.top, .bottom], 10)
                .frame(minWidth: 0, maxWidth: .infinity)
                .background(Color.white.opacity(0.8))
                .cornerRadius(10)
                .overlay(RoundedRectangle(cornerRadius: 10, style: .continuous).stroke(Color.black))
        } else {
            EmptyView()
        }
    }
}

struct SpeciesInformationsRow_Previews: PreviewProvider {
    static var previews: some View {
        SpeciesInformationsRow(title: "Cell test", content: "imageName=nil")

        SpeciesInformationsRow(title: "Cell test", content: "imageName!=nil", imageName: "bycatch")

        SpeciesInformationsRow(title: "", content: "")
    }
}
