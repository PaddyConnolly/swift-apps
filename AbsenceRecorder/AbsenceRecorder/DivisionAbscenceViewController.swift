//
//  DivisionAbscenceViewController.swift
//  AbsenceRecorder
//
//  Created by Connolly, Patrick (IRG) on 05/02/2020.
//  Copyright © 2020 Connolly, Patrick (IRG). All rights reserved.
//

import UIKit

class DivisionAbscenceViewController: UITableViewController {
    
    var division: Division?
    var abscence: Abscence?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let selectedRows = abscence?.selectedRows {
          for selectedRow in selectedRows {
            tableView.selectRow(at: selectedRow, animated: false, scrollPosition: .none)
          }
        }


    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return division?.students.count ??  0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Student", for: indexPath)
        
        cell.textLabel?.text = division?.students[indexPath.row].surname
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      if let selectedStudent = division?.students[indexPath.row] {
        abscence?.present.append(selectedStudent)
      }

    }

    override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
      if let selectedStudent = division?.students[indexPath.row] {
        abscence?.present.removeAll {
          $0.forename == selectedStudent.forename && $0.surname == selectedStudent.surname
      }
      }
    }

    override func viewDidDisappear(_ animated: Bool) {
      abscence?.selectedRows = tableView.indexPathsForSelectedRows
    }

}
