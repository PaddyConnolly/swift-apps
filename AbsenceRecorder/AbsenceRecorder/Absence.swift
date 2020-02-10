//
//  Abscence.swift
//  AbsenceRecorder
//
//  Created by Connolly, Patrick (IRG) on 07/02/2020.
//  Copyright © 2020 Connolly, Patrick (IRG). All rights reserved.
//

import Foundation

class Absence {
  var takenOn: Date
  var present: [Student] = []
  var selectedRows: [IndexPath]?

  init(date: Date) {
    takenOn = date
  }
  
}
