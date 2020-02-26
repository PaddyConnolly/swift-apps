//
//  Division.swift
//  AbsenceRecorder
//
//  Created by Connolly, Patrick (IRG) on 30/01/2020.
//  Copyright © 2020 Connolly, Patrick (IRG). All rights reserved.
//

import Foundation

class Division {
    let code: String
    var students: [Student] = []
    var absences: [Absence] = []
    
    init(code: String) {
        self.code = code
    }
    
    func getAbsence(for date: Date) -> Absence? { // Chocolate Bar Winner?
        var todaysAbsences: [Absence] = []
        for absence in absences {
            if Calendar.current.isDate(absence.takenOn, inSameDayAs: date) {
                todaysAbsences.append(absence)
            }
        }
        return todaysAbsences.last
    }
    
}
