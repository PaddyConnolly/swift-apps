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
        updateDateDisplay()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let allPresent = UIContextualAction(style: .normal, title: "Mark all Present") { action, view,
            completionHandler in
            let division = self.divisions[indexPath.row]
            let absence = Absence(date: self.currentDate, present: division.students)
            division.absences.append(absence)
            tableView.reloadData()
            completionHandler(true)

        }
        
        allPresent.backgroundColor = UIColor.blue
        return UISwipeActionsConfiguration(actions: [allPresent])
    }
   
    override func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
    
        let clearAbsence = UIContextualAction(style: .normal, title: "Clear") { action, view,
            completionHandler in
            let division = self.divisions[indexPath.row]
            division.absences[indexPath.row].present.removeAll()
            tableView.reloadData()
            completionHandler(true)

        }
        
        clearAbsence.backgroundColor = UIColor.red
        return UISwipeActionsConfiguration(actions: [clearAbsence])
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
        cell.accessoryType = selectedDivision.getAbsence(for: currentDate) == nil ? .none : .checkmark
            
        
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
         return DivisionAbsenceViewController(coder: coder, division: selectedDivision, absence: absence)
        }) else {
         fatalError("Failed to load Division Abscence View Controller from Storyboard")
        }
        
        vc.division = selectedDivision
        
        navigationController?.pushViewController(vc, animated: true)
    }

    func convertDivisionsToJson() -> String? {
        let encoder = JSONEncoder()
        guard let encoded = try? encoder.encode(divisions) else {
            print("Unable to encode divisions into json")
            return nil
        }
        
        
        guard let json = String(data: encoded, encoding: .utf8) else {
            print("Unable to turn encoded divisions into a string")
            return nil
            
        }
        
        return json
    }
    
    func convertJsonToDivisions(json: Data) -> [Division]? {
        let decoder = JSONDecoder()
        
        guard let decoded = try? decoder.decode([Division].self, from: json) else {
            return nil
        }
        
        return decoded
        
    }
    
    func saveDataToFile() {
        guard let divisionsJson =  convertDivisionsToJson() else {
            return
        }
        
        let filePath = UserDocumentManager.getDocumentsDirectory().appendingPathComponent("divisions.txt")
        
        do {
            try divisionsJson.write(to: filePath, atomically: true, encoding: String.Encoding.utf8)
        } catch {
            print("Unable to save by writing to a file")
        }
    }
    
    func loadDataFromFile() {
        let filePath = UserDocumentManager.getDocumentsDirectory().appendingPathComponent("divisions.txt")
        
        do {
            let json = try Data(contentsOf: filePath)
            divisions = convertJsonToDivisions(json: json) ?? []
        } catch {
            print("Unable to load data from file.")
            addData()
        }
    }

        
    func addData() {
        divisions.append(DivisionFactory.createDivision(code: "vBY-1", of: 7))
        divisions.append(DivisionFactory.createDivision(code: "vCZ-1", of: 7))
        divisions.append(DivisionFactory.createDivision(code: "vCW-1", of: 7))
    }

}

