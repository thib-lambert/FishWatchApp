//
//  SpeciesScienceRow.swift
//  FishWatchApp
//
//  Created by Thibaud Lambert on 28/10/2020.
//

import SwiftUI

struct SpeciesScienceRow: View {

    @State private var isExpanded = false
    private let image = Image(systemName: "triangle.fill")

    var title: String
    var content: String

    init(title: String, content: String) {
        self.title = title
        self.content = content
    }

    var body: some View {

        VStack(spacing: 0) {
            HStack {
                Text(title)
                    .foregroundColor(.white)
                    .padding()

                Spacer()

                if isExpanded {
                    image
                        .foregroundColor(.white)
                        .padding()
                } else {
                    image
                        .foregroundColor(.white)
                        .rotationEffect(.init(degrees: 180))
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
                        .font(.body)
                        .multilineTextAlignment(.leading)
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .padding()
                })
                    .background(Color.white)
            }
        }
            .cornerRadius(10)
            .shadow(color: .black, radius: 5, x: 0.0, y: 0.0)
    }
}

#if DEBUG
struct SpeciesScienceRow_Previews: PreviewProvider {
    static var previews: some View {
        SpeciesScienceRow(title: "Title", content: "Content")
    }
}
#endif
