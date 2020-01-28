//
//  VisualisingDataStructuresTests.swift
//  VisualisingDataStructuresTests
//
//  Created by Connolly, Patrick (IRG) on 28/01/2020.
//  Copyright © 2020 Connolly, Patrick (IRG). All rights reserved.
//

import XCTest
@testable import VisualisingDataStructures

class VisualisingDataStructuresTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testInitializationCreatesArrayOfCorrectLength() {
        //arrange
        let stack = Stack(maxSize: 10)
        //act
        let actual = stack.items
        let expected = Array(repeating: 0, count: 10)
        //assert
        XCTAssertEqual(expected, actual)
    }
    
    func testPushingToStacksAddsItemToStack() {
        //arrange
        let stack = Stack(maxSize: 10)
        stack.push(item: 7)
        //act
        let actual = stack.items
        let expected = [7,0,0,0,0,0,0,0,0,0]
        //assert
        XCTAssertEqual(actual, expected)
    }
    
    func testPoppingFromStacksRemovesItemFromTopOfStack() {
        //arrange
        let stack = Stack(maxSize: 10)
        stack.push(item: 7)
        stack.push(item: 4)
        stack.push(item: 3)
        //act
        let actual = stack.pop()
        let expected = 3
        //assert
        XCTAssertEqual(actual, expected)
    }
    
    func testPoppingFromEmptyStackReturnsNil() {
        //arrange
        let stack = Stack(maxSize: 10)
        //act
        let actual = stack.pop()
        let expected: Int? = nil
        //assert
        XCTAssertEqual(actual, expected)
    }
    
    
    


    

}
