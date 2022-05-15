//
//  ViewController.swift
//  Calculator
//
//  Created by Юрий Бирюков on 18.01.2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var viewResult: UILabel!
    
        var firstNumber:Double = 0
        var numberFromView:Double = 0
        var currentOperation: Operation?
            enum Operation {
            case add, subtract, multiply, divide
    }
    
    @IBAction func buttonNumber(_ sender: UIButton) {
        
        if viewResult.text == "0" {
                viewResult.text = "\(sender.tag)"
            } else {
                viewResult.text = "\(viewResult.text!)\(sender.tag)"
            }
        }
    
    @IBAction func buttonOperation(_ sender: UIButton) {
        let tag = sender.tag
        
        if let text = viewResult.text, let value = Int(text), firstNumber == 0 {
            firstNumber = Double(value)
            viewResult.text = "0"
        }
        if tag == 0 {
            if let operation = currentOperation {
                var secondNumber = 0
                if let text = viewResult.text, let value = Int(text) {
                    secondNumber = value
                }
                
                switch operation {
                case .add:
                    firstNumber = firstNumber + Double(secondNumber)
                    secondNumber = 0
                    viewResult.text = "\(firstNumber)"
                    currentOperation = nil
                    firstNumber = 0
                    
                    break
                    
                case .subtract:
                    firstNumber = firstNumber - Double(secondNumber)
                    secondNumber = 0
                    viewResult.text = "\(firstNumber)"
                    currentOperation = nil
                    firstNumber = 0
                    
                    break
                    
                case .multiply:
                    firstNumber = firstNumber * Double(secondNumber)
                    secondNumber = 0
                    viewResult.text = "\(firstNumber)"
                    currentOperation = nil
                    firstNumber = 0
                    
                    break
                    
                case .divide:
                    firstNumber = firstNumber / Double(secondNumber)
                    secondNumber = 0
                    viewResult.text = "\(firstNumber)"
                    currentOperation = nil
                    firstNumber = 0
                }
            }
        }
        else if tag == 10 {
            currentOperation = .add
        }
        else if tag == 11 {
            currentOperation = .subtract
        }
        else if tag == 12 {
            currentOperation = .multiply
        }
        else if tag == 13 {
            currentOperation = .divide
        }
    }
    
    @IBAction func buttonPercent(_ sender: UIButton) {
    }
    
    @IBAction func buttonPlusMinus(_ sender: UIButton) {
    
    }
    
    @IBAction func buttonAllClean(_ sender: UIButton) {
        viewResult.text = "0"
        currentOperation = nil
        firstNumber = 0
    }
    }
