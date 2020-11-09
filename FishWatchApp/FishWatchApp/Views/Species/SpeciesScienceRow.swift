//
//  SpeciesScienceRow.swift
//  FishWatchApp
//
//  Created by Thibaud Lambert on 28/10/2020.
//

import SwiftUI

struct SpeciesScienceRow: View {

    @State fileprivate var isExpanded = false
    fileprivate let image = Image(systemName: "triangle.fill")

    var title: String
    var content: String

    var body: some View {

        VStack(spacing: 0) {
            HStack {
                Text(title)
                    .padding()
                    .foregroundColor(.white)

                Spacer()

                if isExpanded {
                    image
                        .foregroundColor(.white)
                        .padding()
                } else {
                    image
                        .rotationEffect(.init(degrees: 180))
                        .foregroundColor(.white)
                        .padding()
                }
            }
                .background(Color.App.scienceCell)
                .onTapGesture(perform: {
                    isExpanded.toggle()
                })

            if isExpanded {
                VStack(alignment: .center, spacing: nil, content: {
                    Text((content == "" ? "No data." : content))
                        .multilineTextAlignment(.leading)
                        .font(.body)
                        .padding()
                        .frame(minWidth: 0, maxWidth: .infinity)
                })
                    .background(Color.white)
            }
        }
            .cornerRadius(10)
            .shadow(color: .black, radius: 5, x: 0.0, y: 0.0)
    }
}

struct SpeciesScienceRow_Previews: PreviewProvider {
    static var previews: some View {
        SpeciesScienceRow(title: "Title", content: "Content")
    }
}
