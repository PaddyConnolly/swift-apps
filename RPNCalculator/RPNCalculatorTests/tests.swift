//
//  tests.swift
//  RPNCalculatorTests
//
//  Created by Connolly, Patrick (IRG) on 11/06/2020.
//  Copyright © 2020 Connolly, Patrick (IRG). All rights reserved.
//

import XCTest

class tests: XCTestCase {

   func testEvalFunctionGetsCorrectResult() {
       //arrange
       let expected = "15"
       //act
       let actual = eval(item: "7 8 +")
       //assert
       XCTAssertEqual(actual, expected)
   }

}
