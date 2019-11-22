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
    var overfed: Bool = false
    

    func feed(food : String) -> Int {
        let tamagotchi = Tamagotchi()
        if tamagotchi.hunger == 4 {
            tamagotchi.overfed = true
            return 4
        } else {
            hunger += 1
            return hunger
        }
    }
}
