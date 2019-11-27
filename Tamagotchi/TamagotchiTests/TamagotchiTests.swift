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
    
    func testFuncFeedFillsHungerAndIncreasesWeightAndReturnsNewHungerForParameterMeal() {
        //arrange
        let tamagotchi = Tamagotchi()
        let expectedHunger = 4
        let expectedWeight = tamagotchi.weight + 1
        //act
        tamagotchi.feed(food: "Meal")
        let actualHunger = tamagotchi.hunger
        let actualWeight = tamagotchi.weight
        //assert
        XCTAssertEqual(expectedHunger,actualHunger)
        XCTAssertEqual(expectedWeight,actualWeight)

    }

    func testFuncFeedIncreasesHungerAndReturnsNewHungerForParameterSnack() {
        //arrange
        let tamagotchi = Tamagotchi()
        let expectedHunger = tamagotchi.hunger + 1
        let expectedWeight = tamagotchi.weight + 2
        let expectedHappy = tamagotchi.happy + 1
        //act
        tamagotchi.feed(food: "Snack")
        let actualHunger = tamagotchi.hunger
        let actualWeight = tamagotchi.weight
        let actualHappy = tamagotchi.happy
        //assert
        XCTAssertEqual(expectedHunger,actualHunger)
        XCTAssertEqual(expectedWeight,actualWeight)
        XCTAssertEqual(expectedHappy,actualHappy)

    }
    
    func testFuncFeedWithTooManySnacksKillsTamagotchi() {
        //arrange
        let tamagotchi = Tamagotchi()
        tamagotchi.snackCount = 5
        //act
        tamagotchi.feed(food: "Snack")
        //assert
        XCTAssertTrue(tamagotchi.isDead)
        
    }
    
    func testFuncFeedWithTooManySnacksMakesTamagotchiSick() {
        //arrange
        let tamagotchi = Tamagotchi()
        tamagotchi.snackCount = 3
        //act
        tamagotchi.feed(food: "Snack")
        //assert
        XCTAssertTrue(tamagotchi.isSick)
    
    }
    
    func testFuncPlayLowersWeightIfThreeRoundsWon() {
        //arrange
        let tamagotchi = Tamagotchi()
        let expected = tamagotchi.happy + 1
        //act
        tamagotchi.play()
        let actual = tamagotchi.happy
        //assert
        XCTAssertEqual(expected, actual)
    }
    
}
