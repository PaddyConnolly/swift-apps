//
//  ViewController.swift
//  CarCustomizer
//
//  Created by Connolly, Patrick (IRG) on 10/01/2020.
//  Copyright © 2020 Connolly, Patrick (IRG). All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    

    @IBOutlet var drivetrainPackage: UISwitch!
    @IBOutlet var fuelSystemPackage: UISwitch!
    @IBOutlet var remainingFundsDisplay: UILabel!
    @IBOutlet var carstatistics: UILabel!
    @IBOutlet var engineAndExhaustPackage: UISwitch!
    @IBOutlet var tiresPackage: UISwitch!
    var remainingFunds = 1000 {
        didSet {
            remainingFundsDisplay.text = "Remaining Funds: \(remainingFunds)"
        }
    }
    var starterCars = StarterCars()
    var carIndex = 0
    var car: Car? {
        didSet {
            carstatistics.text = car?.displayStats()
            disableUnafforablePackages()
        }
    }
    


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        car = starterCars.cars[carIndex]
        remainingFunds = 1000
        
        
    }
    
    
    @IBAction func cycleCars(_ sender: Any) {
        carIndex += 1
        remainingFunds = 1000
        if carIndex >= starterCars.cars.count {
            carIndex = 0
        }
        engineAndExhaustPackage.isOn = false
        tiresPackage.isOn = false
        fuelSystemPackage.isOn = false
        drivetrainPackage.isOn = false
 
        engineAndExhaustPackage.isEnabled = true
        tiresPackage.isEnabled = true
        fuelSystemPackage.isEnabled = true
        drivetrainPackage.isEnabled = true
        
        car = starterCars.cars[carIndex]

    }

    
    @IBAction func engineAndExhaustToggle(_ sender: Any) {

        if engineAndExhaustPackage.isOn {
            car?.topSpeed += 5
            remainingFunds -= 500
        } else {
            car?.topSpeed -= 5
            remainingFunds += 500
        }
    }
    
    @IBAction func tiresPackageToggle(_ sender: Any) {

        if tiresPackage.isOn {
            car?.handling += 1
            remainingFunds -= 500
        } else {
            car?.handling -= 1
            remainingFunds += 500
        }
    }
    
    @IBAction func fuelSystemPackageToggle(_ sender: Any) {

        if fuelSystemPackage.isOn {
            car?.topSpeed += 2
            car?.acceleration -= 0.5
            remainingFunds -= 500
        } else {
            car?.topSpeed -= 2
            car?.acceleration += 0.5
            remainingFunds += 500
        }
    }
    @IBAction func drivetrainPackageToggle(_ sender: Any) {

        if drivetrainPackage.isOn {
            car?.acceleration -= 1
            remainingFunds -= 500
        } else {
            car?.acceleration += 1
            remainingFunds += 500
        }
    }
    
    func disableUnafforablePackages() {
        engineAndExhaustPackage.isEnabled = enable(engineAndExhaustPackage)
        tiresPackage.isEnabled = enable(tiresPackage)
        fuelSystemPackage.isEnabled = enable(fuelSystemPackage)
        drivetrainPackage.isEnabled = enable(drivetrainPackage)
    }
    func enable(_ control: UISwitch) -> Bool {
        if control.isOn {
            return true
        } else {
            if remainingFunds >= 500 {
                return true
            } else {
                return false
            }
        }
    }
}

