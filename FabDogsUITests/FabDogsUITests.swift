//
//  FabDogsUITests.swift
//  FabDogsUITests
//
//  Created by Jidh George on 10/03/2022.
//

import XCTest

class FabDogsUITests: XCTestCase {

    override func setUpWithError() throws {

        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()

        XCUIApplication().tables/*@START_MENU_TOKEN@*/.buttons["German Shepherd Dog, Herding, Guard dog"]/*[[".cells[\"German Shepherd Dog, Herding, Guard dog\"].buttons[\"German Shepherd Dog, Herding, Guard dog\"]",".buttons[\"German Shepherd Dog, Herding, Guard dog\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.navigationBars["Fab Dogs"].buttons["Fab Dogs"].tap()
    }


    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
