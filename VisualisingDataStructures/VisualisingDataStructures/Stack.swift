//
//  Stack.swift
//  VisualisingDataStructures
//
//  Created by Connolly, Patrick (IRG) on 28/01/2020.
//  Copyright © 2020 Connolly, Patrick (IRG). All rights reserved.
//

import Foundation

class Stack {
    
    var items: [Int]
    var top = 0
    init(maxSize: Int) {
        items = Array(repeating: 0, count: maxSize)
    }
    
    func pop() -> Int? {
        var empty = true
        for item in items {
            if item != 0 {
                empty = false
            }
        }
        if !empty {
            top -= 1
            let item = items[top]
            items[top] = 0
            return item
        } else {
            return nil
        }}
    
    func push(item: Int) {
        items[top] = item
        top += 1
    }
    

   
    
}
