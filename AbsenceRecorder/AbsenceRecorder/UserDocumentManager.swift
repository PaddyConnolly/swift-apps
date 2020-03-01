//
//  UserDocumentManager.swift
//  AbsenceRecorder
//
//  Created by Connolly, Patrick (IRG) on 01/03/2020.
//  Copyright © 2020 Connolly, Patrick (IRG). All rights reserved.
//

import Foundation

class UserDocumentManager {
    
    static func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        
        return paths[0]
    }
}
