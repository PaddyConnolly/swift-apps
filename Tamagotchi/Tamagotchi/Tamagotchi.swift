//
//  Tamagotchi.swift
//  Tamagotchi
//
//  Created by Connolly, Patrick (IRG) on 22/11/2019.
//  Copyright © 2019 Connolly, Patrick (IRG). All rights reserved.
//

import Foundation

class Tamagotchi {
    
    var hunger: Int = 0
    var weight: Int = 10
    var happy: Int = 0
    var snackCount: Int = 0
    var isDead: Bool = false
    var isSick: Bool = false
    

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
            var computerChoice = String(Int.random(in: 0...1))
            if computerChoice == "0" {
                computerChoice = "Left"
            } else {
                computerChoice = "Right"
            }
            print(computerChoice)
            if let userChoice = readLine() {
                if userChoice == computerChoice {
                    roundsWon += 1
                    rounds += 1
                } else {
                    rounds += 1
                    finished = true
                }
            }
        } while finished == false && rounds <= 5
        if roundsWon >= 3 {
            happy += 1
        }
        
        
    }
}
