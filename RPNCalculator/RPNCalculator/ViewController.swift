//
//  ViewController.swift
//  RPNCalculator
//
//  Created by Connolly, Patrick (IRG) on 09/06/2020.
//  Copyright © 2020 Connolly, Patrick (IRG). All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    /*
     Done:
     -    It must support variable length operands of up to 3 digits
     -    It must support the operators: plus, subtract, multiply, divide (integer division only)
     -    It must calculate the result of the entered Reverse Polish Notation Expression when the ‘Eval’ button is tapped
     -    It must support positive and negative integers both as input and output
     -    The +/- button must flip the sign of the operand currently being entered
     -    The ‘Enter’ button must signal to the calculator that the user has finished entering an operand
     -    The arithmetic operator buttons should also signal to the calculator that the user has finished entering an operand
     -    It must not allow use of the on-screen keyboard to enter in any part of the expression, only the buttons must be used
     -    It must perform suitable validation to prevent operands outside the range -999 to 999 from being entered
     
     Incomplete/In progress:
     -    It must handle errors caused by evaluating invalid expressions gracefully
     -    It must have a comprehensive set of unit and UI automated tests
     
     Notes: Have some trouble with tests.

     */

    @IBOutlet var textDisplay: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func updateDisplay(value: String) { // Appends the argument to the current value of the display unless the display is empty, in which case the argument becomes the display's value
        if let input = textDisplay.text {
            textDisplay.text = input + value
        } else {
            textDisplay.text = value
        }
    }
    
    func eval(item: String) -> String { // Takes a string and produces the mathematical output
        let result = NSExpression(format: item).expressionValue(with: nil, context: nil) as! Int
        return "\(result)" // Doesn't handle bad expressions well
    }

    
    func calculate(input: [String]) -> String { // Uses a stack implementation to perform RPN calculations
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
    
    var calculation: [String] = [] // Holds the operands
    var RPN_stack = Stack(stack: []) // Holds the operands in a stack for calculations
    var operand: [String] = [] // Holds the digits of the current operand

    @IBAction func zeroButton(_ sender: Any) { // These make a digit appear on the display when the button is pressed
        updateDisplay(value: "0")
        operand.append("0")
        updateDisplay(value: " ")

    }
    @IBAction func oneButton(_ sender: Any) {
        updateDisplay(value: "1")
        operand.append("1")
        updateDisplay(value: " ")

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
        updateDisplay(value: " +")
        operand.append("+")
        calculation.append(operand.joined(separator: ""))
        operand = []
        updateDisplay(value: " ")
    }
    @IBAction func minusButton(_ sender: Any) {
        updateDisplay(value: " -")
        operand.append("-")
        calculation.append(operand.joined(separator: ""))
        operand = []
        updateDisplay(value: " ")
    }
    @IBAction func multiplyButton(_ sender: Any) {
        updateDisplay(value: " *")
        operand.append("*")
        calculation.append(operand.joined(separator: ""))
        operand = []
        updateDisplay(value: " ")
    }
    @IBAction func divideButton(_ sender: Any) {
        
        updateDisplay(value: " /")
        operand.append("/")
        calculation.append(operand.joined(separator: ""))
        operand = []
        updateDisplay(value: " ")
    }
    @IBAction func clearButton(_ sender: Any) { // Clears display and the current operand and calculation
        textDisplay.text = ""
        operand = []
        calculation = []
    }
    @IBAction func enterButton(_ sender: Any) { // Validates the operand input and saves it as part of the calculation. Also adds a space

        if Int(operand.joined())! < -999 || Int(operand.joined())! > 999 {
            textDisplay.text = "Invalid operand"
            operand = []
            calculation = []
            return
        }
    
        calculation.append(operand.joined(separator: ""))
        operand = []
        updateDisplay(value: " ")
        
    }
    
    @IBAction func endButton(_ sender: Any) { // Tells the system that the input is complete and to start calculating
        textDisplay.text = ""
        updateDisplay(value: calculate(input: calculation))
        calculation = []
    }
    
    @IBAction func negateButton(_ sender: Any) { // Makes the current operand negative if positive or positive if negative
        if operand[0] == "-" {
            operand.remove(at: 0)
        } else {
            operand.insert("-", at: 0)
        }
        textDisplay.text = ""
        updateDisplay(value: operand.joined())
    }
    
    
    
    
}

