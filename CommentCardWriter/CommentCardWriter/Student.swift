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
    var subjectTeacherDict: [String: String]
    var subjects: [String]
    var teachers: [String]
    var yearGroup: Int

    
    init(name: String, subjectTeacherDict: [String: String], yearGroup: Int) {
        self.name = name
        self.subjectTeacherDict = subjectTeacherDict
        self.subjects = Array(subjectTeacherDict.keys)
        self.teachers = Array(subjectTeacherDict.values)
        self.yearGroup = yearGroup
    }
}
