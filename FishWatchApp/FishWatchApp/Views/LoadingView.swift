//
//  LoadingView.swift
//  FishWatchApp
//
//  Created by Thibaud Lambert on 26/10/2020.
//

import SwiftUI

struct LoadingView: View {

    private var loadingText: String

    init(loadingText: String = "Loading...") {
        self.loadingText = loadingText
    }

    var body: some View {
        VStack(alignment: .center, spacing: 0, content: {
            LottieView(filename: "boat")
                .frame(width: 250, height: 250, alignment: .center)
                .padding()
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.black, lineWidth: 2))

            Text(loadingText)
        })
            .padding()
    }
}

#if DEBUG
struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
#endif
