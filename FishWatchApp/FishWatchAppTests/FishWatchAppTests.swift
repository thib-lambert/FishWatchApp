//
//  FishWatchAppTests.swift
//  FishWatchAppTests
//
//  Created by Thibaud Lambert on 16/11/2020.
//

@testable import FishWatchApp

import XCTest

class FishWatchAppTests: XCTestCase {
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testSpeciesScienceList() {
        // Empty data
        var list = SpeciesScienceList(speciesScienceInformations: [], lastUpdate: "lastUpdate")
        XCTAssertNotNil(list)
        XCTAssertNotNil(list.body)
        
        // No empty data
        let info = SpeciesScienceOption(title: "title", informations: "informations")
        XCTAssertEqual(info.title, "title")
        XCTAssertEqual(info.informations, "informations")
        XCTAssertNotNil(info.id)
        
        list = SpeciesScienceList(speciesScienceInformations: [info], lastUpdate: "lastUpdate")
        XCTAssertNotNil(list)
        XCTAssertNotNil(list.body)
        
        let preview = SpeciesScienceList_Previews.previews
        XCTAssertNotNil(preview)
        XCTAssertNotNil(preview.body)
    }
    
    func testSpeciesScienceRow() {
        let row = SpeciesScienceRow(title: "title", content: "content")
        XCTAssertNotNil(row)
        XCTAssertNotNil(row.body)
        XCTAssertEqual(row.title, "title")
        XCTAssertEqual(row.content, "content")
        
        let preview = SpeciesScienceRow_Previews.previews
        XCTAssertNotNil(preview)
        XCTAssertNotNil(preview.body)
    }
    
    func testSpeciesList() {
        var list = SpeciesList(speciesData: [])
        XCTAssertNotNil(list)
        XCTAssertNotNil(list.body)
        
        let fish = FishWatchSpecies.preview
        XCTAssertNotNil(fish)
        
        list = SpeciesList(speciesData: [[fish]])
        XCTAssertNotNil(list)
        XCTAssertNotNil(list.body)
        
        let preview = SpeciesList_Previews.previews
        XCTAssertNotNil(preview)
        XCTAssertNotNil(preview.body)
    }
    
    func testContentView() {
        let view = ContentView()
        XCTAssertNotNil(view)
        XCTAssertNotNil(view.body)
        
        let preview = ContentView_Previews.previews
        XCTAssertNotNil(preview)
        XCTAssertNotNil(preview.body)
    }
    
    func testSpeciesQuote() {
        let quote = SpeciesQuote(quote: "quote")
        XCTAssertNotNil(quote)
        XCTAssertNotNil(quote.body)
        
        let preview = SpeciesQuote_Previews.previews
        XCTAssertNotNil(preview)
        XCTAssertNotNil(preview.body)
    }
    
    func testSpeciesTitleView() {
        let view = SpeciesTitleView(name: "name", scientificNames: "scientificNames")
        XCTAssertNotNil(view)
        XCTAssertNotNil(view.body)
        
        let preview = SpeciesTitleView_Previews.previews
        XCTAssertNotNil(preview)
        XCTAssertNotNil(preview.body)
    }
    
    func testNoDataView() {
        let view = NoDataView()
        XCTAssertNotNil(view)
        XCTAssertNotNil(view.body)
        
        let preview = NoDataView_Previews.previews
        XCTAssertNotNil(preview)
        XCTAssertNotNil(preview.body)
    }
    
    func testStringExtension() {
        let html = "<div><a href='#'>Link</a></div>"
        XCTAssertEqual("Link", html.clearHtml)
    }
    
    func testLoadingView() {
        let preview = LoadingView_Previews.previews
        XCTAssertNotNil(preview)
        XCTAssertNotNil(preview.body)
    }
    
    func testSpeciesManager() {
        var result = SpeciesManager.shared.speciesSearched(searchValue: "")
        XCTAssertEqual(SpeciesManager.shared.speciesOrdered(), result)
        
        result = SpeciesManager.shared.speciesSearched(searchValue: "Test")
        XCTAssertEqual(SpeciesManager.shared.speciesOrdered(), result)
        
        XCTAssertEqual([], SpeciesManager.shared.speciesOrdered(speciesToOrder: []))
    }
    
    func testSpeciesView() {
        let view = SpeciesView(species: FishWatchSpecies.preview)
        XCTAssertNotNil(view)
        XCTAssertNotNil(view.body)
        
        let preview = SpeciesView_Previews.previews
        XCTAssertNotNil(preview)
        XCTAssertNotNil(preview.body)
    }
    
    func testSpeciesProfilView() {
        let view = SpeciesProfilView(imageSrc: nil, speciesAliases: ["Alias_1"])
        XCTAssertNotNil(view)
        XCTAssertNotNil(view.body)
        
        let preview = SpeciesProfilView_Previews.previews
        XCTAssertNotNil(preview)
        XCTAssertNotNil(preview.body)
    }
    
    func testFishWatchSpecies() {
        let fishA = FishWatchSpecies.preview
        let fishB = FishWatchSpecies.preview
        
        XCTAssertTrue(fishA == fishB)
        
        XCTAssertNotNil(fishA.scienceInformations)
        XCTAssertEqual(fishA.habitat, "habitat")
        XCTAssertEqual(fishA.habitatImpacts, "habitatImpacts")
        XCTAssertEqual(fishA.imageGallery, [FishWatchSpecies.SpeciesImages.preview])
        XCTAssertEqual(fishA.location, "location")
        XCTAssertEqual(fishA.population, "population")
        XCTAssertEqual(fishA.populationStatus, "populationStatus")
        XCTAssertEqual(fishA.scientificName, "scientificName")
        XCTAssertEqual(fishA.speciesAliases, ["speciesAliasesA", "speciesAliasesB"])
        XCTAssertEqual(fishA.speciesIllustrationPhoto, FishWatchSpecies.SpeciesImages.preview)
        XCTAssertEqual(fishA.speciesName, "speciesName")
        XCTAssertEqual(fishA.availability, "availability")
        XCTAssertEqual(fishA.biology, "biology")
        XCTAssertEqual(fishA.bycatch, "bycatch")
        XCTAssertEqual(fishA.color, "color")
        XCTAssertEqual(fishA.fishingRate, "fishingRate")
        XCTAssertEqual(fishA.healthBenefits, "healthBenefits")
        XCTAssertEqual(fishA.physicalDescription, "physicalDescription")
        XCTAssertEqual(fishA.quote, "quote")
        XCTAssertEqual(fishA.research, "research")
        XCTAssertEqual(fishA.source, "source")
        XCTAssertEqual(fishA.taste, "taste")
        XCTAssertEqual(fishA.texture, "texture")
        XCTAssertEqual(fishA.lastUpdate, "lastUpdate")
        
        let bundle = Bundle(for: FishWatchAppTests.self)
        guard let urlJson = bundle.url(forResource: "FishWatchSpecies", withExtension: ".json") else { fatalError("FishWatchSpecies.json not found!") }
        
        do {
            let data = try Data(contentsOf: urlJson)
            let fishC = try JSONDecoder().decode([FishWatchSpecies].self, from: data).first
            XCTAssertNotNil(fishC)
            XCTAssertEqual(fishC!.speciesName, "Red Snapper")
        } catch {
            fatalError("Error occured! -> \(error.localizedDescription)")
        }
    }
    
    func testSpeciesInformationsRow() {
        var view = SpeciesInformationsRow(title: "title", content: "content")
        XCTAssertNotNil(view)
        XCTAssertNotNil(view.body)
        
        view = SpeciesInformationsRow(title: "", content: "")
        XCTAssertNotNil(view)
        XCTAssertNotNil(view.body)
    }
    
    func testSpeciesRow() {
        let view = SpeciesRow(species: FishWatchSpecies.preview)
        XCTAssertNotNil(view)
        XCTAssertNotNil(view.body)
        
        let preview = SpeciesRow_Previews.previews
        XCTAssertNotNil(preview)
        XCTAssertNotNil(preview.body)
    }
}
