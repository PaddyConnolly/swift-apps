//
//  Stack.swift
//  RPNCalculator
//
//  Created by Connolly, Patrick (IRG) on 09/06/2020.
//  Copyright © 2020 Connolly, Patrick (IRG). All rights reserved.
//

import Foundation

struct Stack { // Swift stack implementation (simple)
    
    var stack: [String]
    
    init(stack: [String]) {
        self.stack = stack
    }
    
    mutating func push(value: String) {
        stack.append(value)
    }
    
    mutating func pop() -> String {
        return stack.removeLast()
    }
    
    mutating func count() -> Int {
        return stack.count
    }
    
}
