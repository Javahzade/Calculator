//
//  ViewController.swift
//  Calculator
//
//  Created by student on 2/19/20.
//  Copyright © 2020 student. All rights reserved.
//

import UIKit

enum Operation : String {
    case Plus = "+"
    case Minus = "-"
    case Multiply = "*"
    case Divide = "/"
    case NULL = "NULL"
}

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        resultLabel.text = "0"
    }
    
    @IBOutlet weak var resultLabel: UILabel!
    
    var startNumber = ""
    var num1 = ""
    var num2 = ""
    var result = ""
    var currentOperation : Operation = .NULL
    let error = "На 0 делить нельзя!"
    var dot = false
    
    @IBAction func divideButton(_ sender: UIButton) {
        if result != error {
            mathOperation(operation: .Divide)
            sender.backgroundColor = #colorLiteral(red: 1, green: 0.5781051517, blue: 0, alpha: 1)
            colorPlus.backgroundColor = #colorLiteral(red: 0.6642242074, green: 0.6642400622, blue: 0.6642315388, alpha: 1)
            colorMultiply.backgroundColor = #colorLiteral(red: 0.6642242074, green: 0.6642400622, blue: 0.6642315388, alpha: 1)
            colorMinus.backgroundColor = #colorLiteral(red: 0.6642242074, green: 0.6642400622, blue: 0.6642315388, alpha: 1)
        } else {
            return
        }
    }
    
    @IBAction func multiplyButton(_ sender: UIButton) {
        if result != error {
            mathOperation(operation: .Multiply)
            sender.backgroundColor = #colorLiteral(red: 1, green: 0.5781051517, blue: 0, alpha: 1)
            colorPlus.backgroundColor = #colorLiteral(red: 0.6642242074, green: 0.6642400622, blue: 0.6642315388, alpha: 1)
            colorMinus.backgroundColor = #colorLiteral(red: 0.6642242074, green: 0.6642400622, blue: 0.6642315388, alpha: 1)
            colorDivide.backgroundColor = #colorLiteral(red: 0.6642242074, green: 0.6642400622, blue: 0.6642315388, alpha: 1)
        } else {
            return
        }
    }
    
    @IBAction func minusButton(_ sender: UIButton) {
        if result != error {
            mathOperation(operation: .Minus)
            sender.backgroundColor = #colorLiteral(red: 1, green: 0.5781051517, blue: 0, alpha: 1)
            colorPlus.backgroundColor = #colorLiteral(red: 0.6642242074, green: 0.6642400622, blue: 0.6642315388, alpha: 1)
            colorMultiply.backgroundColor = #colorLiteral(red: 0.6642242074, green: 0.6642400622, blue: 0.6642315388, alpha: 1)
            colorDivide.backgroundColor = #colorLiteral(red: 0.6642242074, green: 0.6642400622, blue: 0.6642315388, alpha: 1)
        } else {
            return
        }
    }
    
    @IBAction func plusButton(_ sender: UIButton) {
        if result != error {
            mathOperation(operation: .Plus)
            sender.backgroundColor = #colorLiteral(red: 1, green: 0.5781051517, blue: 0, alpha: 1)
            colorMinus.backgroundColor = #colorLiteral(red: 0.6642242074, green: 0.6642400622, blue: 0.6642315388, alpha: 1)
            colorMultiply.backgroundColor = #colorLiteral(red: 0.6642242074, green: 0.6642400622, blue: 0.6642315388, alpha: 1)
            colorDivide.backgroundColor = #colorLiteral(red: 0.6642242074, green: 0.6642400622, blue: 0.6642315388, alpha: 1)
        } else {
            return
        }
    }
    
    @IBAction func equalityButton(_ sender: UIButton) {
        
        if result != error {
            dot = false
            mathOperation(operation: currentOperation)
            colorPlus.backgroundColor = #colorLiteral(red: 0.6642242074, green: 0.6642400622, blue: 0.6642315388, alpha: 1)
            colorMultiply.backgroundColor = #colorLiteral(red: 0.6642242074, green: 0.6642400622, blue: 0.6642315388, alpha: 1)
            colorDivide.backgroundColor = #colorLiteral(red: 0.6642242074, green: 0.6642400622, blue: 0.6642315388, alpha: 1)
            colorMinus.backgroundColor = #colorLiteral(red: 0.6642242074, green: 0.6642400622, blue: 0.6642315388, alpha: 1)
        }else {
            return
        }
    }
    
    @IBAction func dotButton(_ sender: UIButton) {
        
        if result != error {
            if !dot {
            startNumber += "."
            resultLabel.text = startNumber
            dot = true
            }else if !dot {
            resultLabel.text = "0."
        }
        }
        else {
            return
        }
    }
    
    @IBAction func clearButton(_ sender: UIButton) {
        num1 = ""
        num2 = ""
        result = ""
        startNumber = ""
        currentOperation = .NULL
        resultLabel.text = "0"
        dot = false
        colorPlus.backgroundColor = #colorLiteral(red: 0.6642242074, green: 0.6642400622, blue: 0.6642315388, alpha: 1)
        colorMultiply.backgroundColor = #colorLiteral(red: 0.6642242074, green: 0.6642400622, blue: 0.6642315388, alpha: 1)
        colorDivide.backgroundColor = #colorLiteral(red: 0.6642242074, green: 0.6642400622, blue: 0.6642315388, alpha: 1)
        colorMinus.backgroundColor = #colorLiteral(red: 0.6642242074, green: 0.6642400622, blue: 0.6642315388, alpha: 1)
    }
    
    @IBAction func numbersButton(_ sender: UIButton) {
        if result != error {
        startNumber += "\(sender.tag)"
            resultLabel.text = startNumber
        }
        else {
            return
        }
    }
    func mathOperation (operation : Operation){
        
        if currentOperation != .NULL {
            if startNumber != "" {
                dot = false
                num2 = startNumber
                startNumber = ""
                
                if currentOperation == .Plus {
                    result = "\(Float(num1)! + Float(num2)!)"
                } else if currentOperation == .Minus {
                    result = "\(Float(num1)! - Float(num2)!)"
                }else if currentOperation == .Multiply {
                    result = "\(Float(num1)! * Float(num2)!)"
                }else if currentOperation == .Divide {
                    if num2 != "0" {
                        result = "\(Float(num1)! / Float(num2)!)" }
                    else {
                        result = error
                    }
                    }
                num1 = result
                resultLabel.text = result
            }
            currentOperation = operation
        } else {
            num1 = startNumber
            startNumber = ""
            currentOperation = operation
            dot = false
        }
    }
    
    @IBOutlet weak var colorPlus: UIButton!
    
    @IBOutlet weak var colorMinus: UIButton!
    
    @IBOutlet weak var colorDivide: UIButton!
    
    @IBOutlet weak var colorMultiply: UIButton!

}
