//
//  TamagotchiTests.swift
//  TamagotchiTests
//
//  Created by Connolly, Patrick (IRG) on 19/11/2019.
//  Copyright © 2019 Connolly, Patrick (IRG). All rights reserved.
//

import XCTest

class TamagotchiTests: XCTestCase {
    
    func testTamagotchiReturnsNotNil() {
        //arrange
        let tamagotchi = Tamagotchi()
        //act
        //assert
        XCTAssertNotNil(tamagotchi)
    }
    
    func testFuncFeedIncreasesHungerAndReturnsNewHungerForParameterMeal() {
        //arrange
        let tamagotchi = Tamagotchi()
        let tamagotchi = Tamagotchi()
        tamagotchi.hunger = 2
        
        let expected = 3
        //act
        let actual = tamagotchi.feed(food: "Meal")
        //assert
        XCTAssertEqual(expected,actual)
    }
}
