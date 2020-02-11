//
//  Student.swift
//  CommentCardWriter
//
//  Created by Connolly, Patrick (IRG) on 11/02/2020.
//  Copyright © 2020 Connolly, Patrick (IRG). All rights reserved.
//

import Foundation

class Student {
    var name: String
    var subjects: [String]
    var teachers: [String]
    
    init(name: String, subjects: [String], teachers: [String]) {
        self.name = name
        self.subjects = subjects
        self.teachers = teachers
    }
}
