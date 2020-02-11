//
//  Comment.swift
//  CommentCardWriter
//
//  Created by Connolly, Patrick (IRG) on 11/02/2020.
//  Copyright © 2020 Connolly, Patrick (IRG). All rights reserved.
//

import Foundation

class Comment {
    
    let teacherName: String
    let subject: String
    let characterCount: Int
    var studentEvaluation: StudentEvaluation
    
    init(teacherName: String, subject: String, characterCount: Int, studentEvaluation: StudentEvaluation) {
        self.teacherName = teacherName
        self.subject = subject
        self.characterCount = characterCount
        self.studentEvaluation = studentEvaluation
    }
    
}
