//
//  SpeciesScienceInformations.swift
//  FishWatchApp
//
//  Created by Thibaud Lambert on 28/10/2020.
//

import Foundation

struct SpeciesScienceOption: Identifiable {
    let id = UUID()
    let title: String
    let informations: String

    init(title: String, informations: String) {
        self.title = title
        self.informations = informations
    }
}
