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

            src = try container.decode(String.self, forKey: .src)
            alt = try container.decode(String.self, forKey: .alt)
            title = try container.decode(String.self, forKey: .title)
        }

        fileprivate init() {
            src = "src"
            alt = "alt"
            title = "title"
        }
    }

    var id = UUID()
    var fisheryManagement: String
    var habitat: String
    var habitatImpacts: String
    var imageGallery: [SpeciesImages]
    var location: String
    var management: String
    var nOAAFisheriesRegion: String
    var population: String
    var populationStatus: String
    var scientificName: String
    var speciesAliases: [String]
    var speciesIllustrationPhoto: SpeciesImages?
    var speciesName: String
    var animalHealth: String
    var availability: String
    var biology: String
    var bycatch: String
    var calories: String
    var carbohydrate: String
    var cholesterol: String
    var color: String
    var diseaseTreatmentAndPrevention: String
    var diseasesInSalmon: String
    var displayedSeafoodProfileIllustration: String
    var ecosystemServices: String
    var environmentalConsiderations: String
    var environmentalEffects: String
    var farmingMethods: String
    var fatTotal: String
    var feeds: String
    var fiberTotalDietary: String
    var fishingRate: String
    var harvest: String
    var harvestType: String
    var healthBenefits: String
    var humanHealth: String
    var physicalDescription: String
    var production: String
    var protein: String
    var quote: String
    var quoteBackgroundColor: String
    var research: String
    var saturatedFattyAcidsTotal: String
    var selenium: String
    var servingWeight: String
    var servings: String
    var sodium: String
    var source: String
    var sugarsTotal: String
    var taste: String
    var texture: String
    var path: String
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
        case fisheryManagement = "Fishery Management",
        habitat = "Habitat",
        habitatImpacts = "Habitat Impacts",
        imageGallery = "Image Gallery",
        location = "Location",
        management = "Management",
        nOAAFisheriesRegion = "NOAA Fisheries Region",
        population = "Population",
        populationStatus = "Population Status",
        scientificName = "Scientific Name",
        speciesAliases = "Species Aliases",
        speciesIllustrationPhoto = "Species Illustration Photo",
        speciesName = "Species Name",
        animalHealth = "Animal Health",
        availability = "Availability",
        biology = "Biology",
        bycatch = "Bycatch",
        calories = "Calories",
        carbohydrate = "Carbohydrate",
        cholesterol = "Cholesterol",
        color = "Color",
        diseaseTreatmentAndPrevention = "Disease Treatment and Prevention",
        diseasesInSalmon = "Diseases in Salmon",
        displayedSeafoodProfileIllustration = "Displayed Seafood Profile Illustration",
        ecosystemServices = "Ecosystem Services",
        environmentalConsiderations = "Environmental Considerations",
        environmentalEffects = "Environmental Effects",
        farmingMethods = "Farming Methods",
        fatTotal = "Fat, Total",
        feeds = "Feeds",
        fiberTotalDietary = "Fiber, Total Dietary",
        fishingRate = "Fishing Rate",
        harvest = "Harvest",
        harvestType = "Harvest Type",
        healthBenefits = "Health Benefits",
        humanHealth = "Human Health",
        physicalDescription = "Physical Description",
        production = "Production",
        protein = "Protein",
        quote = "Quote",
        quoteBackgroundColor = "Quote Background Color",
        research = "Research",
        saturatedFattyAcidsTotal = "Saturated Fatty Acids, Total",
        selenium = "Selenium",
        servingWeight = "Serving Weight",
        servings = "Servings",
        sodium = "Sodium",
        source = "Source",
        sugarsTotal = "Sugars, Total",
        taste = "Taste",
        texture = "Texture",
        path = "Path",
        lastUpdate = "last_update"
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        fisheryManagement = try container.decodeIfPresent(String.self, forKey: .fisheryManagement) ?? ""
        habitat = (try container.decodeIfPresent(String.self, forKey: .habitat) ?? "").clearHtml
        habitatImpacts = try container.decodeIfPresent(String.self, forKey: .habitatImpacts) ?? ""

        // Sometimes it's only an dictionnary
        do {
            imageGallery = try container.decodeIfPresent([SpeciesImages].self, forKey: .imageGallery) ?? []
        } catch {
            if let tmpValue = try container.decodeIfPresent(SpeciesImages.self, forKey: .imageGallery) {
                imageGallery = [tmpValue]
            } else {
                imageGallery = []
            }
        }

        location = (try container.decodeIfPresent(String.self, forKey: .location) ?? "").clearHtml
        management = try container.decodeIfPresent(String.self, forKey: .management) ?? ""
        nOAAFisheriesRegion = try container.decodeIfPresent(String.self, forKey: .nOAAFisheriesRegion) ?? ""
        population = try container.decodeIfPresent(String.self, forKey: .population) ?? ""
        populationStatus = (try container.decodeIfPresent(String.self, forKey: .populationStatus) ?? "").clearHtml
        scientificName = try container.decodeIfPresent(String.self, forKey: .scientificName) ?? ""
        speciesAliases = (try container.decodeIfPresent(String.self, forKey: .speciesAliases) ?? "").clearHtml.components(separatedBy: ",")
        speciesIllustrationPhoto = try container.decodeIfPresent(SpeciesImages.self, forKey: .speciesIllustrationPhoto)
        speciesName = try container.decodeIfPresent(String.self, forKey: .speciesName) ?? ""
        animalHealth = try container.decodeIfPresent(String.self, forKey: .animalHealth) ?? ""
        availability = (try container.decodeIfPresent(String.self, forKey: .availability) ?? "").clearHtml
        biology = (try container.decodeIfPresent(String.self, forKey: .biology) ?? "").clearHtml
        bycatch = try container.decodeIfPresent(String.self, forKey: .bycatch) ?? ""
        calories = try container.decodeIfPresent(String.self, forKey: .calories) ?? ""
        carbohydrate = try container.decodeIfPresent(String.self, forKey: .carbohydrate) ?? ""
        cholesterol = try container.decodeIfPresent(String.self, forKey: .cholesterol) ?? ""
        color = (try container.decodeIfPresent(String.self, forKey: .color) ?? "").clearHtml
        diseaseTreatmentAndPrevention = try container.decodeIfPresent(String.self, forKey: .diseaseTreatmentAndPrevention) ?? ""
        diseasesInSalmon = try container.decodeIfPresent(String.self, forKey: .diseasesInSalmon) ?? ""
        displayedSeafoodProfileIllustration = try container.decodeIfPresent(String.self, forKey: .displayedSeafoodProfileIllustration) ?? ""
        ecosystemServices = try container.decodeIfPresent(String.self, forKey: .ecosystemServices) ?? ""
        environmentalConsiderations = try container.decodeIfPresent(String.self, forKey: .environmentalConsiderations) ?? ""
        environmentalEffects = try container.decodeIfPresent(String.self, forKey: .environmentalEffects) ?? ""
        farmingMethods = try container.decodeIfPresent(String.self, forKey: .farmingMethods) ?? ""
        fatTotal = try container.decodeIfPresent(String.self, forKey: .fatTotal) ?? ""
        feeds = try container.decodeIfPresent(String.self, forKey: .feeds) ?? ""
        fiberTotalDietary = try container.decodeIfPresent(String.self, forKey: .fiberTotalDietary) ?? ""
        fishingRate = try container.decodeIfPresent(String.self, forKey: .fishingRate) ?? ""
        harvest = try container.decodeIfPresent(String.self, forKey: .harvest) ?? ""
        harvestType = try container.decodeIfPresent(String.self, forKey: .harvestType) ?? ""
        healthBenefits = (try container.decodeIfPresent(String.self, forKey: .healthBenefits) ?? "").clearHtml
        humanHealth = try container.decodeIfPresent(String.self, forKey: .humanHealth) ?? ""
        physicalDescription = (try container.decodeIfPresent(String.self, forKey: .physicalDescription) ?? "").clearHtml
        production = try container.decodeIfPresent(String.self, forKey: .production) ?? ""
        protein = try container.decodeIfPresent(String.self, forKey: .protein) ?? ""
        quote = try container.decodeIfPresent(String.self, forKey: .quote) ?? ""
        quoteBackgroundColor = try container.decodeIfPresent(String.self, forKey: .quoteBackgroundColor) ?? ""
        research = (try container.decodeIfPresent(String.self, forKey: .research) ?? "").clearHtml
        saturatedFattyAcidsTotal = try container.decodeIfPresent(String.self, forKey: .saturatedFattyAcidsTotal) ?? ""
        selenium = try container.decodeIfPresent(String.self, forKey: .selenium) ?? ""
        servingWeight = try container.decodeIfPresent(String.self, forKey: .servingWeight) ?? ""
        servings = try container.decodeIfPresent(String.self, forKey: .servings) ?? ""
        sodium = try container.decodeIfPresent(String.self, forKey: .sodium) ?? ""
        source = (try container.decodeIfPresent(String.self, forKey: .source) ?? "").clearHtml
        sugarsTotal = try container.decodeIfPresent(String.self, forKey: .sugarsTotal) ?? ""
        taste = (try container.decodeIfPresent(String.self, forKey: .taste) ?? "").clearHtml
        texture = (try container.decodeIfPresent(String.self, forKey: .texture) ?? "").clearHtml
        path = try container.decodeIfPresent(String.self, forKey: .path) ?? ""
        lastUpdate = try container.decodeIfPresent(String.self, forKey: .lastUpdate) ?? ""
    }

    fileprivate init() {
        fisheryManagement = "fisheryManagement"
        habitat = "habitat"
        habitatImpacts = "habitatImpacts"
        imageGallery = [SpeciesImages.preview]
        location = "location"
        management = "management"
        nOAAFisheriesRegion = "nOAAFisheriesRegion"
        population = "population"
        populationStatus = "populationStatus"
        scientificName = "scientificName"
        speciesAliases = ["speciesAliasesA", "speciesAliasesB"]
        speciesIllustrationPhoto = SpeciesImages.preview
        speciesName = "speciesName"
        animalHealth = "animalHealth"
        availability = "availability"
        biology = "biology"
        bycatch = "bycatch"
        calories = "calories"
        carbohydrate = "carbohydrate"
        cholesterol = "cholesterol"
        color = "color"
        diseaseTreatmentAndPrevention = "diseaseTreatmentAndPrevention"
        diseasesInSalmon = "diseasesInSalmon"
        displayedSeafoodProfileIllustration = "displayedSeafoodProfileIllustration"
        ecosystemServices = "ecosystemServices"
        environmentalConsiderations = "environmentalConsiderations"
        environmentalEffects = "environmentalEffects"
        farmingMethods = "farmingMethods"
        fatTotal = "fatTotal"
        feeds = "feeds"
        fiberTotalDietary = "fiberTotalDietary"
        fishingRate = "fishingRate"
        harvest = "harvest"
        harvestType = "harvestType"
        healthBenefits = "healthBenefits"
        humanHealth = "humanHealth"
        physicalDescription = "physicalDescription"
        production = "production"
        protein = "protein"
        quote = "quote"
        quoteBackgroundColor = "quoteBackgroundColor"
        research = "research"
        saturatedFattyAcidsTotal = "saturatedFattyAcidsTotal"
        selenium = "selenium"
        servingWeight = "servingWeight"
        servings = "servings"
        sodium = "sodium"
        source = "source"
        sugarsTotal = "sugarsTotal"
        taste = "taste"
        texture = "texture"
        path = "path"
        lastUpdate = "lastUpdate"
    }
}
