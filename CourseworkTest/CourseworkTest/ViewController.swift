//
//  ViewController.swift
//  CourseworkTest
//
//  Created by Connolly, Patrick (IRG) on 30/03/2020.
//  Copyright © 2020 Connolly, Patrick (IRG). All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var testButton1 = CustomButton()
    var testButton2 = CustomButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupConstraints()
        testButton1.setTitle("I'm a volunteer!", for: .normal)
        testButton2.setTitle("I'm looking for volunteers!", for: .normal)
    }
        
    func setupConstraints() {
         view.addSubview(testButton1)
         testButton1.translatesAutoresizingMaskIntoConstraints = false
         testButton1.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
         testButton1.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -500).isActive = true
        
        view.addSubview(testButton2)
        testButton2.translatesAutoresizingMaskIntoConstraints = false
        testButton2.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        testButton2.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -200).isActive = true
     }
    
 
}

