//
//  CalculatorViewModel.swift
//  AddEmUp
//
//  Created by Davaughn Williams on 8/13/25.
//

import Foundation
import SwiftUI

class CalculatorViewModel: ObservableObject {
    @Published var displayText = "0"
    @Published var previousValue: Double? = nil
    @Published var currentOperator: String? = nil
    @Published var isTypingNumber = false
    
    let buttonLayout: [[String]] = [
        ["AC", "+/-", "%", "÷"],
        ["7", "8", "9", "x"],
        ["4", "5", "6", "-"],
        ["1", "2", "3", "+"],
        ["⬅️", "0", ".", "="]
    ]

    /// Decides color based on type of button
    func colorForButton(_ label: String) -> Color {
        if ["÷", "×", "−", "+", "="].contains(label) {
            return .orange
        } else if ["AC", "+/-", "%"].contains(label) {
            return .secondary
        } else {
            return .black
        }
    }
    
    func handleButtonPress(_ label: String) {
        switch label {
        case "0"..."9":
            appendDigit(label)
            
        case ".":
            appendDecimal()
            
        case "+", "-", "x", "÷":
            setOperator(label)
            
        case "=":
            calculateResult()
            
        case "AC":
            resetCalculator()
            
        case "+/-":
            toggleSign()
            
        case "%":
            applyPercentage()
            
        case "⬅️":
            backspace()
            
        default:
            break
        }
    }
    
    private func appendDigit(_ digit: String) {
        if displayText == "0" || !isTypingNumber {
            displayText = digit
            isTypingNumber = true
        } else {
            displayText += digit
        }
    }

    private func appendDecimal() {
        if !displayText.contains(".") {
            displayText += "."
            isTypingNumber = true
        }
    }

    private func setOperator(_ op: String) {
        if let value = Double(displayText) {
            previousValue = value
            currentOperator = op
            isTypingNumber = false
        }
    }

    private func calculateResult() {
        if let op = currentOperator,
           let prev = previousValue,
           let current = Double(displayText) {
            
            let result: Double
            switch op {
            case "+": result = prev + current
            case "-": result = prev - current
            case "x": result = prev * current
            case "÷": result = current != 0 ? prev / current : 0
            default: return
            }
            
            displayText = String(result)
            currentOperator = nil
            previousValue = nil
            isTypingNumber = false
        }
    }

    private func resetCalculator() {
        displayText = "0"
        previousValue = nil
        currentOperator = nil
        isTypingNumber = false
    }

    private func toggleSign() {
        if let value = Double(displayText) {
            displayText = String(-value)
        }
    }

    private func applyPercentage() {
        if let value = Double(displayText) {
            displayText = String(value / 100)
        }
    }
    
    private func backspace() {
        if displayText.count > 1 {
            displayText.removeLast()
        } else {
            displayText = "0"
            isTypingNumber = false
        }
    }
}
