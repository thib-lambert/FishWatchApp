//
//  SpeciesManager.swift
//  FishWatchApp
//
//  Created by Thibaud Lambert on 26/10/2020.
//

import Alamofire

class SpeciesManager {

    static let shared = SpeciesManager()

    var species: [FishWatchSpecies] = []

    fileprivate var speciesUnordered: [FishWatchSpecies] = [] {
        didSet {
            // Sort by alphabetical order
            species = speciesUnordered.sorted { (firstSpecies, secondSpecies) -> Bool in
                return firstSpecies.speciesName.localizedCaseInsensitiveCompare(secondSpecies.speciesName) == .orderedAscending
            }
        }
    }

    fileprivate init() {

    }

    func loadSpecies(_ didFinish: (() -> Void)?) {
        AF.request("https://www.fishwatch.gov/api/species").responseDecodable(of: [FishWatchSpecies].self) { [weak self] response in
            if let strongSelf = self {
                // Check if an error occured
                if response.error == nil {
                    strongSelf.speciesUnordered = response.value.unsafelyUnwrapped
                }
            }
            didFinish?()
        }
    }

    func speciesSearched(searchValue: String = "") -> [[FishWatchSpecies]] {
        if searchValue.isEmpty {
            return SpeciesManager.shared.speciesOrdered()
        } else {
            let tmp = SpeciesManager.shared.species.filter {
                $0.speciesName.lowercased().contains(searchValue.lowercased())
            }

            return SpeciesManager.shared.speciesOrdered(speciesToOrder: tmp)
        }
    }

    func speciesOrdered(speciesToOrder: [FishWatchSpecies] = SpeciesManager.shared.species) -> [[FishWatchSpecies]] {
        let groupByFirstLetter = Dictionary(grouping: speciesToOrder) {
            $0.speciesName.first?.uppercased() ?? "No letter"
        }

        return Array(groupByFirstLetter.keys).sorted(by: <).map {
            return groupByFirstLetter[$0]!
        }
    }
}
