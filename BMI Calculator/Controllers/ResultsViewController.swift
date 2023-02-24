//
//  ResultsViewController.swift
//  BMI Calculator
//
//  Created by ivan cardenas on 24/02/2023.
//  Copyright © 2023 Angela Yu. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    var bmiValue: String?
    var advice: String?
    var color: UIColor?

    @IBOutlet weak var bmiLabel: UILabel!
    @IBOutlet weak var adviceLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        guard let bmiValue = self.bmiValue else {return}
        bmiLabel.text = bmiValue
        
        self.view.backgroundColor = color
        adviceLabel.text = advice

    }
    @IBAction func recalculateAction(_ sender: Any) {
        self.dismiss(animated: true)
    }
}
