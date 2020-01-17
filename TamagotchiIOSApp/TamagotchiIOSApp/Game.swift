//
//  Game.swift
//  TamagotchiIOSApp
//
//  Created by Connolly, Patrick (IRG) on 17/01/2020.
//  Copyright © 2020 Connolly, Patrick (IRG). All rights reserved.
//

import Foundation

class Game {
    var rounds: Int = 1
    let maxRounds: Int = 5
    var computerChoice: String
    var userChoice: String
    var tam
        
    func nextRound() {
        
    }
    
    func makeUserChoice(choice: String) -> String {
        return choice
    }
        
    func makeComputerChoice() -> String {
        let choice = Int.random(in: 0...1)
        if choice == 0 {
            return "Left"
        } else {
            return "Right"
        }
    }
    
    func win() {
        if rounds < 5 {
            rounds += 1
        } else {
            tamagotchi.happy += 2
        }
    }
    
  
}

