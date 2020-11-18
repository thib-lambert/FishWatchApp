//
//  NoDataView.swift
//  FishWatchApp
//
//  Created by Thibaud Lambert on 26/10/2020.
//

import SwiftUI

struct NoDataView: View {

    var body: some View {

        VStack(alignment: .center, spacing: 0, content: {
            LottieView(filename: "noData")
                .frame(width: 250, height: 250, alignment: .center)

            Text("No data")
        })
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
    }
}

#if DEBUG
struct NoDataView_Previews: PreviewProvider {
    static var previews: some View {
        NoDataView()
    }
}
#endif
