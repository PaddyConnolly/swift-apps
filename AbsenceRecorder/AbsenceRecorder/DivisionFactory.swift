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
        let studentsForenames = ["Will", "Patrick", "Maheraj", "Sam", "JJ", "Oscar", "Seb"]
        let studentsSurnames = ["Goad", "Connolly", "Ahmed", "Barnham", "Andrew", "Hassall", "Wade"]
        let studentsBirthdays = ["01/01/2003", "02/02/2003", "03/03/2003", "04/04/2003", "05/05/2003", "06/06/2003", "07/07/2003"]

        for _ in 1...size {
            division.students.append(Student(forename: studentsForenames.randomElement()!, surname: studentsSurnames.randomElement()!, birthday: formatter.date(from: studentsBirthdays.randomElement()!)!))
        }
        
        return division
    }
}