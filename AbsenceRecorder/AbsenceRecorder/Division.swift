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
    var abscences: [Abscence] = []
    
    init(code: String) {
        self.code = code
    }
    
    func getAbscence(for date: Date) -> Abscence? {
       return abscences.first { $0.takenOn == date }
    }
    
}
