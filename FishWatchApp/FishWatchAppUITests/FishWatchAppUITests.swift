//
//  FishWatchAppUITests.swift
//  FishWatchAppUITests
//
//  Created by Thibaud Lambert on 16/11/2020.
//

import XCTest

class FishWatchAppUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testAllScreens() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        
        let elementsQuery = app.scrollViews.otherElements
        elementsQuery.buttons["Acadian Redfish"].tap()
        elementsQuery.staticTexts["Area closures and gear restrictions protect habitat that are affected by some kinds of trawl gear."].swipeUp()
        app.images["sand"].tap()
        app.navigationBars["Acadian Redfish"].buttons["Species"].tap()
        app/*@START_MENU_TOKEN@*/.searchFields["Search fish"]/*[[".otherElements[\"SearchFish\"].searchFields[\"Search fish\"]",".searchFields[\"Search fish\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
    }
}
