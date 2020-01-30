//
//  ViewController.swift
//  AbsenceRecorder
//
//  Created by Connolly, Patrick (IRG) on 30/01/2020.
//  Copyright © 2020 Connolly, Patrick (IRG). All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var divisions: [Division] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        addData()
        for division in divisions {
            print(division.code)
            for student in division.students {
                print("\(student.forename) \(student.surname)")
            }
        }
    }
        
    func addData() {
        divisions.append(DivisionFactory.createDivision(code: "BY-1", of: 8))
        divisions.append(DivisionFactory.createDivision(code: "CX-1", of: 7))
        divisions.append(DivisionFactory.createDivision(code: "CZ-1", of: 8))
    }

}

