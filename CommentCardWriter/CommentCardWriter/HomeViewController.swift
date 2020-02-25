//
//  HomeViewController.swift
//  CommentCardWriter
//
//  Created by Connolly, Patrick (IRG) on 11/02/2020.
//  Copyright © 2020 Connolly, Patrick (IRG). All rights reserved.
//

import UIKit

class HomeViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    var student = Student(name: "Patrick", subjectTeacherDict: ["Pure Maths": "CKSP", "Applied Maths": "JM", "Computer Science": "DPC", "Micro Economics": "WGJA", "Macro Economics": "GBR"], yearGroup: 12)
    
    override func viewDidAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return student.subjectTeacherDict.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Subject", for: indexPath)
        cell.textLabel?.text = "\(student.subjects[indexPath.row]) - \(student.teachers[indexPath.row])"
        cell.accessoryType = .disclosureIndicator
            
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedSubject = student.subjects[indexPath.row]
        
        guard let vc = storyboard?.instantiateViewController(identifier: "StudentEvaluationViewController", creator: { coder in
            return StudentEvaluationViewController(coder: coder, student: self.student, subject: selectedSubject)
        }) else {
         fatalError("Failed to load Student Evaluation View Controller from Storyboard")
        }
        
        
        navigationController?.pushViewController(vc, animated: true)
        
    }

}
