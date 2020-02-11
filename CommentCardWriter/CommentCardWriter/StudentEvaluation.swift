//
//  StudentEvaluation.swift
//  CommentCardWriter
//
//  Created by Connolly, Patrick (IRG) on 11/02/2020.
//  Copyright © 2020 Connolly, Patrick (IRG). All rights reserved.
//

import Foundation

class StudentEvaluation {
    
    var enjoyment: Int
    var attainment: Int
    var difficulty: Int
    var topics: [String]
    
    init(enjoyment: Int, attainment: Int, difficulty: Int, topics: [String]) {
        self.enjoyment = enjoyment
        self.attainment = attainment
        self.difficulty = difficulty
        self.topics = topics
    }

}
