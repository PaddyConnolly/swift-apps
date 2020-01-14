//
//  tamagotchi.swift
//  TamagotchiIOSApp
//
//  Created by Connolly, Patrick (IRG) on 14/01/2020.
//  Copyright © 2020 Connolly, Patrick (IRG). All rights reserved.
//

import Foundation

class Tamagotchi {
    var name: String = "Tamagotchi"
    var hunger: Int = 3
    var weight: Int = 25
    var happy: Int = 3
    var isDead: Bool = false
    var isSick: Bool = false
    
    var snackCount: Int = 0

    
    func displayStartingStats() -> String {
        return """
        Name: \(name)
        Happiness: \(happy)/4
        Hunger: \(hunger)/4
        Weight: \(weight)lbs
        Sick? \(String(isSick).capitalized)
        Dead? \(String(isDead).capitalized)
        """
        
    }
    
    func feed(food : String) {
        if snackCount >= 5 {
            die()
        } else if snackCount >= 3 {
            sick()
        }
        
        if food == "Meal" {
            hunger = 4
            weight += 1
            snackCount = 0
        } else if food == "Snack" {
            hunger += 1
            weight += 2
            happy += 1
            snackCount += 1
        }
    }
    
    func die() {
        isDead = true
    }
    
    func sick() {
        isSick = true
    }
    
    func play() {
        weight -= 1
        var rounds = 0
        var roundsWon = 0
        var finished = false
        repeat {
            print("Round \(rounds+1)")
            var computerChoice = String(Int.random(in: 0...1))
            if computerChoice == "0" {
                computerChoice = "Left"
            } else {
                computerChoice = "Right"
            }
            print(computerChoice) // for testing only
            if let userChoice = readLine() {
                if userChoice == computerChoice {
                    print("Correct!")
                    roundsWon += 1
                    rounds += 1
                } else {
                    print("Incorrect")
                    rounds += 1
                    finished = true
                }
            }
        } while finished == false && rounds < 5
        if roundsWon >= 3 {
            happy += 1
        }
        
        
    }
}
