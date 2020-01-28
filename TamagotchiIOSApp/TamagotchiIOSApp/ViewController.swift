//
//  ViewController.swift
//  TamagotchiIOSApp
//
//  Created by Connolly, Patrick (IRG) on 14/01/2020.
//  Copyright © 2020 Connolly, Patrick (IRG). All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var useMedicineButton: UIButton!
    @IBOutlet var feedSnackButton: UIButton!
    @IBOutlet var playGameButtonPaper: UIButton!
    @IBOutlet var playGameButtonScissors: UIButton!
    @IBOutlet var playGameButtonRock: UIButton!
    @IBOutlet var playingGameLabel: UILabel!
    @IBOutlet var startingStatistics: UILabel!
    @IBOutlet var feedMealButton: UIButton!
    @IBOutlet var playGameButton: UIButton!
    
    var tamagotchi = Tamagotchi()
    var timer: Timer?
    var timerStatus = 0
    var healCount = 0
    var toiletCount = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateDisplay()
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(backgroundTimer), userInfo: nil, repeats: true)
    }
    
    func updateDisplay() {
        startingStatistics.text = tamagotchi.displayStartingStats()

    }
    
    
    @IBAction func playGame(_ sender: Any) {
        play()
        updateDisplay()
    }
    @IBAction func feedMeal(_ sender: Any) {
        if tamagotchi.hunger == 4 {
            let alert = UIAlertController(title: "\(tamagotchi.name) is not hungry!", message: "It doesn't want a meal right now. Give it some time", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            self.present(alert, animated: true)
        }
        tamagotchi.feed(food: "Meal")

        updateDisplay()
    }
    @IBAction func feedSnack(_ sender: Any) {
        if tamagotchi.hunger == 4 {
            let alert = UIAlertController(title: "\(tamagotchi.name) is not hungry!", message: "It doesn't want a snack right now. Give it some time", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            self.present(alert, animated: true)
        }
        tamagotchi.feed(food: "Snack")
        updateDisplay()
    }
    
    @IBAction func playGameChooseRock(_ sender: Any) {
    }
    
    @IBAction func playGameChoosePaper(_ sender: Any) {
    }
    
    @IBAction func playGameChooseScissors(_ sender: Any) {
    }
    
    
    
    @IBAction func useMedicine(_ sender: Any) {
        let start = timerStatus
        if timerStatus - start >= 60 || healCount == 0 {
            tamagotchi.heal()
            updateDisplay()
            healCount += 1
        }
    }


    @objc func backgroundTimer() {
            
            timerStatus += 1
            print(timerStatus)
            if tamagotchi.mealCount == 2 {
                toilet()
                toiletCount += 1
            }
            if tamagotchi.mealCount >= 5 {
                die()
            }
            
            if timerStatus % 60 == 0 {

                let dieChance = Int.random(in: 0...500)
                let sickChance = Int.random(in: 0...100)
                let ageChance = Int.random(in: 0...1)
                let hungerChance = Int.random(in: 0...9)
                let happyChance = Int.random(in: 0...14)
                if dieChance == 333 {
                    tamagotchi.isDead = true
                }
                
                if sickChance == 44 {
                    tamagotchi.isSick = true
                    if tamagotchi.isSick == true {
                        let start = timerStatus
                        if start - timerStatus >= 600 {
                            die()
                        }
                    }
                }
                
                if ageChance == 1 {
                    tamagotchi.age += 1
                    if tamagotchi.age >= 25  {
                        die()
                    }
                }
                
                if hungerChance == 6 {
                    if tamagotchi.hunger == 0 {
                        die()
                    } else {
                    tamagotchi.hunger -= 1
                    }
                }
                
                if happyChance == 12 {
                    if tamagotchi.happy == 0 {
                        die()
                    } else {
                        tamagotchi.happy -= 1
                    }
                    
                }
            
            
 
            
            
        }
    }
    
    func toilet() {
        let alert = UIAlertController(title: "Alert", message: "\(tamagotchi.name) went to the toilet", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Clean up", style: .cancel, handler: { action in
        }))
        alert.addAction(UIAlertAction(title: "Ignore", style: .destructive))
        self.present(alert, animated: true)
        tamagotchi.mealCount = 0
        
        
    }
    
    func die() {
        useMedicineButton.isHidden = true
        useMedicineButton.isEnabled = false
        playGameButton.isHidden = true
        playGameButton.isEnabled = false
        feedMealButton.isHidden = true
        feedMealButton.isEnabled = false
        feedSnackButton.isHidden = true
        feedSnackButton.isEnabled = false
        let alert = UIAlertController(title: "\(tamagotchi.name) died!", message: "Try to take better care of it next time!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Mourn", style: .cancel, handler: { action in
            exit(0)
        }))
        alert.addAction(UIAlertAction(title: "Get a new one", style: .destructive))
        self.present(alert, animated: true)
        
        
    }
    
    func play() {
        
        playGameButtonRock.isHidden = false
        playGameButtonPaper.isHidden = false
        playGameButtonScissors.isHidden = false
        playingGameLabel.isHidden = false
    }
    
    
    

    

}

