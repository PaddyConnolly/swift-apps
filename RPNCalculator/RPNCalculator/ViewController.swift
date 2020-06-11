//
//  ViewController.swift
//  RPNCalculator
//
//  Created by Connolly, Patrick (IRG) on 09/06/2020.
//  Copyright © 2020 Connolly, Patrick (IRG). All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var textDisplay: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func updateDisplay(value: String) {
        if let input = textDisplay.text {
            textDisplay.text = input + value
        } else {
            textDisplay.text = value
        }
    }
    
    func eval(item: String) -> String {
        let result = NSExpression(format: item).expressionValue(with: nil, context: nil) as! Int
        return "\(result)"
    }

    
    func calculate(input: [String]) -> String {
        while RPN_stack.count() != 1 {
            for item in input {
                if Int(item) != nil {
                    RPN_stack.push(value: item)
                } else {
                    let b = RPN_stack.pop()
                    let a = RPN_stack.pop()
                    let equation = a + item + b
                    RPN_stack.push(value: eval(item: equation))
                }
            }
        }
        
        return RPN_stack.pop()
            
    }
    
    var calculation: [String] = []
    var RPN_stack = Stack(stack: [])
    var operand: [String] = []

    @IBAction func zeroButton(_ sender: Any) {
        updateDisplay(value: "0")
        operand.append("0")
    }
    @IBAction func oneButton(_ sender: Any) {
        updateDisplay(value: "1")
        operand.append("1")
    }
    @IBAction func twoButton(_ sender: Any) {
        updateDisplay(value: "2")
        operand.append("2")
    }
    @IBAction func threeButton(_ sender: Any) {
        updateDisplay(value: "3")
        operand.append("3")
    }
    @IBAction func fourButton(_ sender: Any) {
        updateDisplay(value: "4")
        operand.append("4")
    }
    @IBAction func fiveButton(_ sender: Any) {
        updateDisplay(value: "5")
        operand.append("5")
    }
    @IBAction func sixButton(_ sender: Any) {
        updateDisplay(value: "6")
        operand.append("6")
    }
    @IBAction func sevenButton(_ sender: Any) {
        updateDisplay(value: "7")
        operand.append("7")
    }
    @IBAction func eightButton(_ sender: Any) {
        updateDisplay(value: "8")
        operand.append("8")
    }
    @IBAction func nineButton(_ sender: Any) {
        updateDisplay(value: "9")
        operand.append("9")
    }
    @IBAction func plusButton(_ sender: Any) {
        updateDisplay(value: "+")
        operand.append("+")
    }
    @IBAction func minusButton(_ sender: Any) {
        updateDisplay(value: "-")
        operand.append("+")
    }
    @IBAction func multiplyButton(_ sender: Any) {
        updateDisplay(value: "*")
        operand.append("*")
    }
    @IBAction func divideButton(_ sender: Any) {
        updateDisplay(value: "/")
        operand.append("/")
    }
    @IBAction func clearButton(_ sender: Any) {
        textDisplay.text = ""
        operand = []
    }
    @IBAction func enterButton(_ sender: Any) {
        calculation.append(operand.joined(separator: ""))
        operand = []
        updateDisplay(value: " ")
    }
    @IBAction func endButton(_ sender: Any) {
        textDisplay.text = ""
        updateDisplay(value: calculate(input: calculation))
        calculation = []
    }
    
    
}

