//
//  String+Utils.swift
//  FishWatchApp
//
//  Created by Thibaud Lambert on 28/10/2020.
//

import Foundation

extension String {
    var clearHtml: String {
        var result = self
        result = result
            .replacingOccurrences(of: #"\n{1,}"#, with: "", options: .regularExpression)
            .replacingOccurrences(of: "&nbsp;", with: " ")
            .replacingOccurrences(of: #"<[^>]+>"#, with: "", options: .regularExpression)
            .replacingOccurrences(of: #"\s{2,}"#, with: " ", options: .regularExpression)
        return result
    }
}
