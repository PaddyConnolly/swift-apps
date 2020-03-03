//
//  CommentCardWriterUITests.swift
//  CommentCardWriterUITests
//
//  Created by Connolly, Patrick (IRG) on 11/02/2020.
//  Copyright © 2020 Connolly, Patrick (IRG). All rights reserved.
//

import XCTest

class CommentCardWriterUITests: XCTestCase {



    func testSliderValueIsZeroWhenOnFarLeftSide() {
        
        
        let app = XCUIApplication()
        app.tables.staticTexts["Computer Science - DPC"].tap()
        let slider = app.children(matching: .window).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .slider).matching(identifier: "75%")
        let slider1 = slider.element(boundBy: 0)
        let slider2 = slider.element(boundBy: 1)
        let slider3 = slider.element(boundBy: 2)
        
        slider1.swipeLeft()
        slider2.swipeLeft()
        slider3.swipeLeft()
        
        print(slider1.value!)
    
    }

}
