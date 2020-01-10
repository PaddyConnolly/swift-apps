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
    var car = Car(make: "Mazda", model: "MX-5", topSpeed: 125, acceleration: 7.7, handling: 5)

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        carstatistics.text = car.displayStats()
    }


}

