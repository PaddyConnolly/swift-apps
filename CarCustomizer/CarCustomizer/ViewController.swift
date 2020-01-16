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
    
    
    var remainingFunds = 1000
    var starterCars = StarterCars()
    var carIndex = 0
    var car: Car?


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        car = starterCars.cars[carIndex]
        remainingFunds = 1000
        updateDisplay()
        
        
    }
    
    func updateDisplay() {
        carstatistics.text = car?.displayStats()
        checkRemainingFunds()
        remainingFundsDisplay.text = "Remaining Funds: \(remainingFunds)"
    }
    
    
    @IBAction func cycleCars(_ sender: Any) {
        carIndex += 1
        remainingFunds = 1000
        car = starterCars.cars[carIndex % starterCars.cars.count]
        if carIndex >= starterCars.cars.count {
            carIndex = 0
        }
        engineAndExhaustPackage.setOn(false, animated: true)
        tiresPackage.setOn(false, animated: true)
        fuelSystemPackage.setOn(false, animated: true)
        drivetrainPackage.setOn(false, animated: true)
        updateDisplay()


    }

    
    @IBAction func engineAndExhaustToggle(_ sender: Any) {

        if engineAndExhaustPackage.isOn {
            car?.topSpeed += 5
            remainingFunds -= 500
        } else {
            car?.topSpeed -= 5
            remainingFunds += 500
        }
        updateDisplay()
    }
    
    @IBAction func tiresPackageToggle(_ sender: Any) {

        if tiresPackage.isOn {
            car?.handling += 1
            remainingFunds -= 500
        } else {
            car?.handling -= 1
            remainingFunds += 500
        }
        updateDisplay()
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
        updateDisplay()
    }
    @IBAction func drivetrainPackageToggle(_ sender: Any) {

        if drivetrainPackage.isOn {
            car?.acceleration -= 1
            remainingFunds -= 500
        } else {
            car?.acceleration += 1
            remainingFunds += 500
        }
        updateDisplay()
    }
    
    func checkRemainingFunds() {
        if remainingFunds < 500 {
            if engineAndExhaustPackage.isOn {
                engineAndExhaustPackage.isEnabled = true
            } else {
                engineAndExhaustPackage.isEnabled = false
            }
            if tiresPackage.isOn {
                tiresPackage.isEnabled = true
            } else {
                tiresPackage.isEnabled = false
            }
            if fuelSystemPackage.isOn {
                fuelSystemPackage.isEnabled = true
            } else {
                fuelSystemPackage.isEnabled = false
            }
            if drivetrainPackage.isOn {
                drivetrainPackage.isEnabled = true
            } else {
                drivetrainPackage.isEnabled = false
            }
        } else {
            engineAndExhaustPackage.isEnabled = true
            tiresPackage.isEnabled = true
            fuelSystemPackage.isEnabled = true
            drivetrainPackage.isEnabled = true
        }
        
    }
    
}

