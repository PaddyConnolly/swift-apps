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
    var age: Int = 0
    var hunger: Int = 2
    var weight: Int = 25
    var happy: Int = 2
    var isDead: Bool = false
    var isSick: Bool = false
    var currentGame: Game?
    var snackCount: Int = 0

    
    func displayStartingStats() -> String {
        return """
        Name: \(name)
        Age: \(age) years old
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
            if hunger == 4 {
                return
            } else {
                hunger = 4
                weight += 1
                snackCount = 0
            }
        } else {
            if hunger == 4 {
                return
            } else {
                hunger += 1
                weight += 2
                happy += 1
                snackCount += 1
            }
        }
    }

    func play() {
        

    }
    
    func die() {
        isDead = true
    }

    
    func sick() {
        isSick = true
    }
    
    func heal() {
        isSick = false
    }
    

    

    
    
}

