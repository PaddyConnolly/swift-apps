//
//  AbsenceRecorderUITests.swift
//  AbsenceRecorderUITests
//
//  Created by Connolly, Patrick (IRG) on 30/01/2020.
//  Copyright © 2020 Connolly, Patrick (IRG). All rights reserved.
//

import XCTest

class AbsenceRecorderUITests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    

    func testWhenRecordingAnAbsenceStudentsRemainSelected() {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        
        let tablesQuery = app.tables
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["vBY-1"]/*[[".cells.staticTexts[\"vBY-1\"]",".staticTexts[\"vBY-1\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["Ahmed"]/*[[".cells.staticTexts[\"Ahmed\"]",".staticTexts[\"Ahmed\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["Barnham"]/*[[".cells.staticTexts[\"Barnham\"]",".staticTexts[\"Barnham\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["Goad"]/*[[".cells.staticTexts[\"Goad\"]",".staticTexts[\"Goad\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["Wade"]/*[[".cells.staticTexts[\"Wade\"]",".staticTexts[\"Wade\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.navigationBars["vBY-1"].buttons["Sunday 1 March 2020"].tap()
        
        let divisionCell = tablesQuery.cells.element(boundBy: 0)
        let divisionCellNoAbsence = tablesQuery.cells.element(boundBy: 1)
        XCTAssertTrue(divisionCell.isSelected)
        XCTAssertFalse(divisionCellNoAbsence.isSelected)
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testLaunchPerformance() {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTOSSignpostMetric.applicationLaunch]) {
                XCUIApplication().launch()
            }
        }
    }
}
