//
//  ViewController.swift
//  CarCustomizer
//
//  Created by Connolly, Patrick (IRG) on 10/01/2020.
//  Copyright © 2020 Connolly, Patrick (IRG). All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var carstatistics: UILabel!

    var starterCars = StarterCars()
    var carIndex = 0
    var car: Car? {
        didSet {
            carstatistics.text = car?.displayStats()
        }
    }
    


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        car = starterCars.cars[carIndex]
        
    }
    
    @IBAction func cycleCars(_ sender: Any) {
        carIndex += 1
        if carIndex >= starterCars.cars.count {
            carIndex = 0
        }
        car = starterCars.cars[carIndex]

    }
    


}

