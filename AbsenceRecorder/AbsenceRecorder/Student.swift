//
//  Student.swift
//  AbsenceRecorder
//
//  Created by Connolly, Patrick (IRG) on 30/01/2020.
//  Copyright © 2020 Connolly, Patrick (IRG). All rights reserved.
//

import Foundation

class Student: Equatable, Codable {

    
    let forename: String
    let surname: String
    let birthday: Date
    
    init(forename: String, surname: String, birthday: Date) {
        self.forename = forename
        self.surname = surname
        self.birthday = birthday
    }
    
    static func == (lhs: Student, rhs: Student) -> Bool {
        return lhs.forename == rhs.forename && lhs.surname == rhs.surname && lhs.birthday == rhs.birthday
    }
}
