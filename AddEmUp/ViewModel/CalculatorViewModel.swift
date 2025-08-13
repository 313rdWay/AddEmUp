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
            if displayText == "0" || !isTypingNumber {
                displayText = label
                isTypingNumber = true
            } else {
                displayText += label
            }
        case ".":
            if !displayText.contains(".") {
                displayText += "."
            }
        case "+", "-", "x", "÷":
            if let value = Double(displayText) {
                previousValue = value
                currentOperator = label
                isTypingNumber = false // The next number will replace displayText
            }
        case "=":
            if let op = currentOperator,
               let prev = previousValue,
               let current = Double(displayText) {
                
                var result: Double = prev
                
                switch op {
                case "+": result = prev + current
                case "-": result = prev - current
                case "x": result = prev * current
                case "÷": result = current != 0 ? prev / current : 0
                default: break
                }
                
                displayText = String(result)
                currentOperator = nil
                previousValue = nil
                isTypingNumber = false
            }
        case "AC":
            displayText = "0"
            previousValue = nil
            currentOperator = nil
            isTypingNumber = false
        case "+/-":
            if let value = Double(displayText) {
                displayText = String(-value)
            }
        case "%":
            if let value = Double(displayText) {
                displayText = String(value / 100)
            }
        default:
            break
        }
    }
}
