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
    
    var student = Student(name: "Patrick", subjects: ["Pure Maths", "Applied Maths", "Computer Science", "Micro Economics", "Macro Economics"], teachers: ["CKSP", "JM", "DPC", "WGJA", "GBR"])
    
    override func viewDidAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return student.subjects.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Subject", for: indexPath)
        cell.textLabel?.text = "\(student.subjects[indexPath.row]) - \(student.teachers[indexPath.row])"
        cell.accessoryType = .disclosureIndicator
            
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        <#code#>
    }

}
