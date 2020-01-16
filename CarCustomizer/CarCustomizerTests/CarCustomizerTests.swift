//
//  CarCustomizerTests.swift
//  CarCustomizerTests
//
//  Created by Connolly, Patrick (IRG) on 10/01/2020.
//  Copyright © 2020 Connolly, Patrick (IRG). All rights reserved.
//

import XCTest
@testable import CarCustomizer

class CarCustomizerTests: XCTestCase {

    func testCarDisplayStatsFunctionsReturnsValuesOfAttributes() {
        //arrange
        let car = Car(make: "Mazda", model: "MX-5", topSpeed: 125, acceleration: 7.7, handling: 5)
        let expected = """
            Make: Mazda
            Model: MX-5
            Top Speed (mph): 125
            Acceleration (0-60): 7.70
            Handling: 5
        """
        //act
        let actual = car.displayStats()
        //assert
        XCTAssertEqual(actual,expected)
    }

}
