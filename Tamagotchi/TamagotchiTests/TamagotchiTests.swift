//
//  TamagotchiTests.swift
//  TamagotchiTests
//
//  Created by Connolly, Patrick (IRG) on 19/11/2019.
//  Copyright © 2019 Connolly, Patrick (IRG). All rights reserved.
//

import XCTest

class TamagotchiTests: XCTestCase {

    func testTamagotchiWithNoArgumentsReturnsNonNilObject() {
        //arrange
        //act
        let tamagotchi = Tamagotchi()
        //assert
        XCTAssertNotNil(tamagotchi)
    }
}
