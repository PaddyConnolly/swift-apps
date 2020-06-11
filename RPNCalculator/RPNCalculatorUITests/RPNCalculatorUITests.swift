//
//  RPNCalculatorUITests.swift
//  RPNCalculatorUITests
//
//  Created by Connolly, Patrick (IRG) on 09/06/2020.
//  Copyright © 2020 Connolly, Patrick (IRG). All rights reserved.
//

import XCTest

class RPNCalculatorUITests: XCTestCase {
    
    
    // Any tests involving hthe Stack.swift file will fail. I'm not sure why it isn't being picked up
    
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
    
    func testNegateButtonNegatesPositiveNumber() {
        let app = XCUIApplication()
        app.launch()
        
        app.buttons["one"].tap()
        app.buttons["negate"].tap()
        
        let actual = app.staticTexts["display"].label
        let expected = "-1"
        XCTAssertEqual(actual, expected)
    }
    
    func testNegateButtonMakesNegativeNumberPositive() {
        let app = XCUIApplication()
        app.launch()
        
        app.buttons["one"].tap()
        app.buttons["negate"].tap()
        app.buttons["negate"].tap()

        
        let actual = app.staticTexts["display"].label
        let expected = "1"
        XCTAssertEqual(actual, expected)
    }
    
    func testClearButtonWorks() {
        let app = XCUIApplication()
        app.launch()
        
        app.buttons["one"].tap()
        app.buttons["clear"].tap()
        
        let actual = app.staticTexts["display"].label
        let expected = ""
        XCTAssertEqual(actual, expected)
    }
    
    func testEvaluateButtonWorks() {
        let app = XCUIApplication()
        app.activate()
        
        app.buttons["seven"].tap()
        app.buttons["enter"].tap()
        app.buttons["eight"].tap()
        app.buttons["enter"].tap()
        app.buttons["end"].tap()
        
        let actual = app.staticTexts["display"].label //Don't know what this error's about. Dont think it sees the stack file.
        let expected = "15"
        XCTAssertEqual(actual, expected)
    
    }
    
    func testEnterButtonAddsSpace() {
        let app = XCUIApplication()
        app.launch()
        
        app.buttons["seven"].tap()
        app.buttons["enter"].tap()
        app.buttons["eight"].tap()
        
        let actual = app.staticTexts["display"].label
        let expected = "7 8"
        XCTAssertEqual(actual, expected)
    }
    
    func testEnterButtonValidatesLargeInputs() {
        let app = XCUIApplication()
        app.launch()
        
        app.buttons["seven"].tap()
        app.buttons["seven"].tap()
        app.buttons["seven"].tap()
        app.buttons["seven"].tap()
        app.buttons["seven"].tap()
        app.buttons["enter"].tap()
        
        let actual = app.staticTexts["display"].label
        let expected = "Invalid operand"
        
        XCTAssertEqual(actual, expected)

    }
    
    func testEnterButtonValidatesLargeNegativeInputs() {
        let app = XCUIApplication()
        app.launch()
        
        app.buttons["seven"].tap()
        app.buttons["seven"].tap()
        app.buttons["seven"].tap()
        app.buttons["seven"].tap()
        app.buttons["seven"].tap()
        app.buttons["negate"].tap()
        app.buttons["enter"].tap()
        
        let actual = app.staticTexts["display"].label
        let expected = "Invalid operand"
        
        XCTAssertEqual(actual, expected)
        
    }
    
    func testOperatorWorksAsEnterButton() {
        let app = XCUIApplication()
        app.launch()
        app.buttons["seven"].tap()
        app.buttons["enter"].tap()
        app.buttons["eight"].tap()
        app.buttons["plus"].tap() //Instead of enter
        app.buttons["end"].tap()
        
        let actual = app.staticTexts["display"].label
        let expected = "15"
        
        XCTAssertEqual(actual, expected)
        
    }
    
}
