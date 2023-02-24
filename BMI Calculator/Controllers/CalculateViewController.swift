//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Ivan Cardenas on 23/02/2023.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {

    var calculatorBrain = CalculatorBrain()

    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func heightSliderAction(_ sender: UISlider) {
        heightLabel.text = "\(String(format: "%.2f", sender.value))m"
    }

    @IBAction func weightSliderAction(_ sender: UISlider) {
        weightLabel.text = "\(Int(sender.value))Kg"
    }

    @IBAction func calculateButtton(_ sender: UIButton) {
        calculatorBrain.calculateBmi(height: heightSlider.value, weight: weightSlider.value)
        performSegue(withIdentifier: "goToResult", sender: self)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let resultsController =  segue.destination as? ResultsViewController else {return}
        resultsController.bmiValue = calculatorBrain.getBmiValue()
        resultsController.advice = calculatorBrain.getAdvice()
        resultsController.color = calculatorBrain.getColor()
    }
}

