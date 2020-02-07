//
//  ViewController.swift
//  AbsenceRecorder
//
//  Created by Connolly, Patrick (IRG) on 30/01/2020.
//  Copyright © 2020 Connolly, Patrick (IRG). All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    var divisions: [Division] = []
    var currentDate: Date = Date()
    


    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addData()
        for division in divisions {
            print(division.code)
            for student in division.students {
                print("\(student.forename) \(student.surname)")
            }
        }
        
        updateDateDisplay()
    }
    
    @IBAction func previousDay(_ sender: Any) {
        currentDate = Calendar.current.date(byAdding: .day, value: -1, to: currentDate) ?? Date()
        updateDateDisplay()
    }
    
    @IBAction func nextDay(_ sender: Any) {
    currentDate = Calendar.current.date(byAdding: .day, value: +1, to: currentDate) ?? Date()
        updateDateDisplay()
        
    }
    func updateDateDisplay() {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE d MMMM YYYY"
        
        
        navigationItem.title = formatter.string(from: currentDate)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return divisions.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Division", for: indexPath)
        
        cell.textLabel?.text = divisions[indexPath.row].code
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "DivisionAbscenceViewController" ) as? DivisionAbscenceViewController else {
                fatalError("Failed to load Division Abscence View Controller from Storyboard")
        }

        let selectedDivision = divisions[indexPath.row]

        if let existingAbscence = selectedDivision.getAbscence(for: currentDate) {
          vc.abscence = existingAbscence
        } else {
          let newAbscence = Abscence(date: currentDate)
          selectedDivision.abscences.append(newAbscence)
          vc.abscence = newAbscence
        }

        vc.division = selectedDivision
        
        navigationController?.pushViewController(vc, animated: true)
    }
        
    func addData() {
        divisions.append(DivisionFactory.createDivision(code: "BY-1", of: 7))
        divisions.append(DivisionFactory.createDivision(code: "CX-1", of: 7))
        divisions.append(DivisionFactory.createDivision(code: "CW-1", of: 7))
    }

}

