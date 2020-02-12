//
//  AbsenceRecorderTests.swift
//  AbsenceRecorderTests
//
//  Created by Connolly, Patrick (IRG) on 30/01/2020.
//  Copyright © 2020 Connolly, Patrick (IRG). All rights reserved.
//

import XCTest
@testable import AbsenceRecorder

class AbsenceRecorderTests: XCTestCase {

    func testTwoAbsences() {
        //arrange
        let newDivision = Division(code: "XDXD")
        let absence = Absence(date: Date())
        absence.present = [Student(forename: "y", surname: "u", birthday: Date())]
        let absence2 = Absence(date: Date())
        absence2.present = [Student(forename: "u", surname: "n", birthday: Date())]
        newDivision.absences.append(absence)
        newDivision.absences.append(absence2)
        //act
        let expected = absence2
        let actual = newDivision.getAbsence(for: Date())
        //assert
        XCTAssertEqual(expected, actual)
    }


}
