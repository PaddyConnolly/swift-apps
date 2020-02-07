//
//  DivisionFactory.swift
//  AbsenceRecorder
//
//  Created by Connolly, Patrick (IRG) on 30/01/2020.
//  Copyright © 2020 Connolly, Patrick (IRG). All rights reserved.
//

import Foundation

class DivisionFactory {
    static func createDivision(code: String, of size: Int) -> Division {
        let division = Division(code: code)
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/mm/yy"
        let studentsForenames = ["Maheraj", "JJ", "Sam", "Patrick", "Will", "Oscar", "Seb"]
        let studentsSurnames = ["Ahmed", "Andrew", "Barnham", "Connolly", "Goad", "Hassall", "Wade"]
        let studentsBirthdays = ["01/01/2003", "02/02/2003", "03/03/2003", "04/04/2003", "05/05/2003", "06/06/2003", "07/07/2003"]

        for i in 0..<size {
            division.students.append(Student(forename: studentsForenames[i], surname: studentsSurnames[i], birthday: formatter.date(from: studentsBirthdays[i])!))
        }
        
        return division
    }
}
