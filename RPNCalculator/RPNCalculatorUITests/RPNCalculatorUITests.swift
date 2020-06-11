//
//  RPNCalculatorUITests.swift
//  RPNCalculatorUITests
//
//  Created by Connolly, Patrick (IRG) on 09/06/2020.
//  Copyright © 2020 Connolly, Patrick (IRG). All rights reserved.
//

import XCTest

class RPNCalculatorUITests: XCTestCase {

    func testAllCharacterButtonsUpdateDisplay() {
        let app = XCUIApplication()
        app.launch()
        
        app.buttons["one"].tap()
        app.buttons["two"].tap()
        app.buttons["three"].tap()
        app.buttons["four"].tap()
        app.buttons["five"].tap()
        app.buttons["six"].tap()
        app.buttons["seven"].tap()
        app.buttons["eight"].tap()
        app.buttons["nine"].tap()
        app.buttons["zero"].tap()
        app.buttons["plus"].tap()
        app.buttons["minus"].tap()
        app.buttons["multiply"].tap()
        app.buttons["divide"].tap()
        
        let actual = app.staticTexts["display"].label
        let expected = "1234567890+-*/"
        XCTAssertEqual(actual, expected)

        
    }
}
