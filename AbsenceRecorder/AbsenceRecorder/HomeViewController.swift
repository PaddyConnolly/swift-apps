//
//  ViewController.swift
//  AbsenceRecorder
//
//  Created by Connolly, Patrick (IRG) on 30/01/2020.
//  Copyright © 2020 Connolly, Patrick (IRG). All rights reserved.
//

import UIKit

class HomeViewController: UITableViewController {
    
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
    
    override func viewDidAppear(_ animated: Bool) {
        tableView.reloadData()
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
        let selectedDivision = divisions[indexPath.row]
        cell.textLabel?.text = selectedDivision.code
        if selectedDivision.getAbsence(for: currentDate) != nil {
            cell.accessoryType = .checkmark

        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

 

        let selectedDivision = divisions[indexPath.row]
        
        var absence: Absence = Absence(date: currentDate)

        if let existingAbsence = selectedDivision.getAbsence(for: currentDate) {
            absence = existingAbsence
        } else {
          selectedDivision.absences.append(absence)
        }
        
        guard let vc = storyboard?.instantiateViewController(identifier: "DivisionAbscenceViewController", creator: { coder in
         return DivisionAbscenceViewController(coder: coder, division: selectedDivision, absence: absence)
        }) else {
         fatalError("Failed to load Division Abscence View Controller from Storyboard")
        }
        
        vc.division = selectedDivision
        
        navigationController?.pushViewController(vc, animated: true)
    }

    

        
    func addData() {
        divisions.append(DivisionFactory.createDivision(code: "vBY-1", of: 7))
        divisions.append(DivisionFactory.createDivision(code: "vCZ-1", of: 7))
        divisions.append(DivisionFactory.createDivision(code: "vCW-1", of: 7))
    }

}

