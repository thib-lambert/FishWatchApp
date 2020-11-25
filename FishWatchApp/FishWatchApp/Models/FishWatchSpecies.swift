//
//  FishWatchSpecies.swift
//  FishWatchApp
//
//  Created by Thibaud Lambert on 26/10/2020.
//

import Foundation

struct FishWatchSpecies: Decodable, Identifiable, Hashable {
    static func == (lhs: FishWatchSpecies, rhs: FishWatchSpecies) -> Bool {
        return lhs.id == rhs.id
    }

    static let preview = FishWatchSpecies()

    struct SpeciesImages: Decodable, Identifiable, Hashable {
        static let preview = SpeciesImages()

        var id = UUID()
        var src: String
        var alt: String
        var title: String

        enum CodingKeys: String, CodingKey {
            case src, alt, title
        }

        init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)

            src = try container.decodeIfPresent(String.self, forKey: .src) ?? ""
            alt = try container.decodeIfPresent(String.self, forKey: .alt) ?? ""
            title = try container.decodeIfPresent(String.self, forKey: .title) ?? ""
        }

        fileprivate init() {
            src = "src"
            alt = "alt"
            title = "title"
        }
    }

    var id = UUID()
    var habitat: String
    var habitatImpacts: String
    var imageGallery: [SpeciesImages]
    var location: String
    var population: String
    var populationStatus: String
    var scientificName: String
    var speciesAliases: [String]
    var speciesIllustrationPhoto: SpeciesImages?
    var speciesName: String
    var availability: String
    var biology: String
    var bycatch: String
    var color: String
    var fishingRate: String
    var healthBenefits: String
    var physicalDescription: String
    var quote: String
    var research: String
    var source: String
    var taste: String
    var texture: String
    var lastUpdate: String

    var scienceInformations: [SpeciesScienceOption] {
        return [
            SpeciesScienceOption(title: "POPULATION STATUS", informations: populationStatus),
            SpeciesScienceOption(title: "LOCATION", informations: location),
            SpeciesScienceOption(title: "HABITAT", informations: habitat),
            SpeciesScienceOption(title: "PHYSICAL DESCRIPTION", informations: physicalDescription),
            SpeciesScienceOption(title: "BIOLOGY", informations: biology),
            SpeciesScienceOption(title: "RESEARCH", informations: research)
        ]
    }

    enum CodingKeys: String, CodingKey {
        case
        habitat = "Habitat",
        habitatImpacts = "Habitat Impacts",
        imageGallery = "Image Gallery",
        location = "Location",
        population = "Population",
        populationStatus = "Population Status",
        scientificName = "Scientific Name",
        speciesAliases = "Species Aliases",
        speciesIllustrationPhoto = "Species Illustration Photo",
        speciesName = "Species Name",
        availability = "Availability",
        biology = "Biology",
        bycatch = "Bycatch",
        color = "Color",
        fishingRate = "Fishing Rate",
        healthBenefits = "Health Benefits",
        physicalDescription = "Physical Description",
        quote = "Quote",
        research = "Research",
        source = "Source",
        taste = "Taste",
        texture = "Texture",
        lastUpdate = "last_update"
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        habitat = (try container.decodeIfPresent(String.self, forKey: .habitat) ?? "").clearHtml
        habitatImpacts = try container.decodeIfPresent(String.self, forKey: .habitatImpacts) ?? ""

        // Sometimes it's only an dictionnary
        // By default array is empty
        imageGallery = []
        do {
            imageGallery = try container.decodeIfPresent([SpeciesImages].self, forKey: .imageGallery) ?? []
        } catch {
            if let tmpValue = try container.decodeIfPresent(SpeciesImages.self, forKey: .imageGallery) {
                imageGallery = [tmpValue]
            }
        }

        location = (try container.decodeIfPresent(String.self, forKey: .location) ?? "").clearHtml
        population = try container.decodeIfPresent(String.self, forKey: .population) ?? ""
        populationStatus = (try container.decodeIfPresent(String.self, forKey: .populationStatus) ?? "").clearHtml
        scientificName = try container.decodeIfPresent(String.self, forKey: .scientificName) ?? ""
        speciesAliases = (try container.decodeIfPresent(String.self, forKey: .speciesAliases) ?? "").clearHtml.components(separatedBy: ",")
        speciesIllustrationPhoto = try container.decodeIfPresent(SpeciesImages.self, forKey: .speciesIllustrationPhoto)
        speciesName = try container.decodeIfPresent(String.self, forKey: .speciesName) ?? ""
        availability = (try container.decodeIfPresent(String.self, forKey: .availability) ?? "").clearHtml
        biology = (try container.decodeIfPresent(String.self, forKey: .biology) ?? "").clearHtml
        bycatch = try container.decodeIfPresent(String.self, forKey: .bycatch) ?? ""
        color = (try container.decodeIfPresent(String.self, forKey: .color) ?? "").clearHtml
        fishingRate = try container.decodeIfPresent(String.self, forKey: .fishingRate) ?? ""
        healthBenefits = (try container.decodeIfPresent(String.self, forKey: .healthBenefits) ?? "").clearHtml
        physicalDescription = (try container.decodeIfPresent(String.self, forKey: .physicalDescription) ?? "").clearHtml
        quote = try container.decodeIfPresent(String.self, forKey: .quote) ?? ""
        research = (try container.decodeIfPresent(String.self, forKey: .research) ?? "").clearHtml
        source = (try container.decodeIfPresent(String.self, forKey: .source) ?? "").clearHtml
        taste = (try container.decodeIfPresent(String.self, forKey: .taste) ?? "").clearHtml
        texture = (try container.decodeIfPresent(String.self, forKey: .texture) ?? "").clearHtml
        lastUpdate = try container.decodeIfPresent(String.self, forKey: .lastUpdate) ?? ""
    }

    fileprivate init() {
        habitat = "habitat"
        habitatImpacts = "habitatImpacts"
        imageGallery = [SpeciesImages.preview]
        location = "location"
        population = "population"
        populationStatus = "populationStatus"
        scientificName = "scientificName"
        speciesAliases = ["speciesAliasesA", "speciesAliasesB"]
        speciesIllustrationPhoto = SpeciesImages.preview
        speciesName = "speciesName"
        availability = "availability"
        biology = "biology"
        bycatch = "bycatch"
        color = "color"
        fishingRate = "fishingRate"
        healthBenefits = "healthBenefits"
        physicalDescription = "physicalDescription"
        quote = "quote"
        research = "research"
        source = "source"
        taste = "taste"
        texture = "texture"
        lastUpdate = "lastUpdate"
    }
}
