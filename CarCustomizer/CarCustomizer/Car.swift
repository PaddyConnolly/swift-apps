//
//  Car.swift
//  CarCustomizer
//
//  Created by Connolly, Patrick (IRG) on 10/01/2020.
//  Copyright © 2020 Connolly, Patrick (IRG). All rights reserved.
//

import Foundation

struct Car {
    var make: String
    var model: String
    var topSpeed: Int
    var acceleration: Double
    var handling: Int
    
    func displayStats() -> String {
        return """
            Make: \(make)
            Model: \(model)
            Top Speed (mph): \(topSpeed)
            Acceleration (0-60): \(String(format: "%.2f", acceleration))
            Handling: \(handling)
        """
    }
}
