//
//  CalculatorBrain.swift
//  BMI Calculator
//
//  Created by ivan cardenas on 24/02/2023.
//  Copyright © 2023 Angela Yu. All rights reserved.
//

import UIKit

struct CalculatorBrain {
    var bmi: BMI?

    func getBmiValue() -> String {
        guard let value = bmi?.value else {return ""}
        return String(format: "%.1f", value)
    }

    func getAdvice() -> String {
        return bmi?.advice ?? ""
    }

    func getColor() -> UIColor {
        guard let color = bmi?.color else {return UIColor.white}
        return color
    }

    mutating func calculateBmi(height: Float, weight: Float) {

        let bmiValue = weight / (height * height)
        var color: UIColor?
        var advice: String?

        if bmiValue <= 18.5 {
            color = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
            advice = "Eat more pies."
        } else if bmiValue > 18.5 && bmiValue <= 24.9{
            color = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
            advice = "You are right 👍🏽"
        } else {
            color = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
            advice = "Eat less pies 😬"
        }

        self.bmi = BMI(value: bmiValue, advice: advice ?? "", color: color ?? UIColor.green)
    }
}
