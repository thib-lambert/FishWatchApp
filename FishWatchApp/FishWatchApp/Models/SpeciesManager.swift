//
//  SpeciesManager.swift
//  FishWatchApp
//
//  Created by Thibaud Lambert on 26/10/2020.
//

import Alamofire
import Combine

class SpeciesManager: NSObject, ObservableObject {

    static let shared = SpeciesManager()

    @Published var species: [FishWatchSpecies] = []

    fileprivate var speciesUnordered: [FishWatchSpecies] = [] {
        didSet {
            // Sort by alphabetical order
            species = speciesUnordered.sorted { (firstSpecies, secondSpecies) -> Bool in
                return firstSpecies.speciesName.localizedCaseInsensitiveCompare(secondSpecies.speciesName) == .orderedAscending
            }
        }
    }

    fileprivate override init() {
        super.init()
    }

    func loadSpecies() {
        AF.request("https://www.fishwatch.gov/api/species").responseDecodable(of: [FishWatchSpecies].self) { [weak self] response in
            if let strongSelf = self {
                // Check if an error occured
                if response.error == nil {
                    strongSelf.speciesUnordered = response.value.unsafelyUnwrapped
                }
            }
        }
    }

    func speciesSearched(searchValue: String = "") -> [[FishWatchSpecies]] {
        var result: [[FishWatchSpecies]]
        
        if searchValue.isEmpty {
            result = SpeciesManager.shared.speciesOrdered()
        } else {
            let tmp = SpeciesManager.shared.species.filter {
                $0.speciesName.lowercased().contains(searchValue.lowercased())
            }

            result = SpeciesManager.shared.speciesOrdered(speciesToOrder: tmp)
        }
        
        return result
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
