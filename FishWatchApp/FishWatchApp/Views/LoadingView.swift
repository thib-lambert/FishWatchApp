//
//  LoadingView.swift
//  FishWatchApp
//
//  Created by Thibaud Lambert on 26/10/2020.
//

import SwiftUI

struct LoadingView: View {

    var loadingText: String?

    var body: some View {
        VStack(alignment: .center, spacing: 0, content: {
            Group {
                LottieView(filename: "boat")
                    .padding()
                    .overlay(Circle().stroke(Color.black, lineWidth: 2))
                    .frame(width: 250, height: 250, alignment: .center)
            }
                .padding()

            Text(loadingText ?? "Loading...")
        })
            .padding()
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
