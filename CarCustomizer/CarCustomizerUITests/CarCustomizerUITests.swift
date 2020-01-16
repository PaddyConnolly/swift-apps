//
//  CarCustomizerUITests.swift
//  CarCustomizerUITests
//
//  Created by Connolly, Patrick (IRG) on 10/01/2020.
//  Copyright © 2020 Connolly, Patrick (IRG). All rights reserved.
//

import XCTest

class CarCustomizerUITests: XCTestCase {

    func testWhenBoughtTwoPackagesOtherPackagesAreDisabled() {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        
        //act
        app.switches["engineExhaustSwitch"].tap()
        app.switches["tiresSwitch"].tap()

        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        XCTAssertFalse(app.switches["fuelSystemSwitch"].isEnabled)
        XCTAssertFalse(app.switches["drivetrainSwitch"].isEnabled)
    }
    
    func testSwitchesReEnabledWhenNextCarButtonPressed() {
        //arrange
        let app = XCUIApplication()
        app.launch()
        
        app.switches["engineExhaustSwitch"].tap()
        app.switches["tiresSwitch"].tap()

        //act
        app.buttons["cycleCarButton"].tap()
        
        //assert
        XCTAssertTrue(app.switches["engineExhaustSwitch"].isEnabled)
        XCTAssertTrue(app.switches["tiresSwitch"].isEnabled)
        XCTAssertTrue(app.switches["fuelSystemSwitch"].isEnabled)
        XCTAssertTrue(app.switches["drivetrainSwitch"].isEnabled)
    }
    
    func testEverythingDisabledWhenTimerEnds() {
        //arrange
        let app = XCUIApplication()
        app.launch()
        
        //act
        sleep(35)
        
        //assert
        XCTAssertFalse(app.switches["engineExhaustSwitch"].isEnabled)
        XCTAssertFalse(app.switches["tiresSwitch"].isEnabled)
        XCTAssertFalse(app.switches["fuelSystemSwitch"].isEnabled)
        XCTAssertFalse(app.switches["drivetrainSwitch"].isEnabled)
        
    }

}
