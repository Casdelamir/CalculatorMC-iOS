//
//  ViewController.swift
//  CalculatorMC-iOS
//
//  Created by Mañanas on 23/7/24.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var valueHight: UILabel!
    @IBOutlet weak var valueWeight: UILabel!
    @IBOutlet weak var result: UILabel!
    
    var currentValueHight: Float = 0.0
    var currentValueWeghit: Float = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    

    @IBAction func setWeight(_ sender: UIStepper) {
        currentValueWeghit = Float(sender.value)
        valueWeight.text = "\( currentValueWeghit) kg"
    }
    
    
    @IBAction func setHight(_ sender: UISlider) {
        currentValueHight = sender.value
        valueHight.text = "\(currentValueHight) cm"
    }
    
    @IBAction func calculateResult(_ sender: Any) {
        var resultNum = currentValueWeghit / pow((currentValueHight / 100.0), 2)
        result.text = String(format: "%.2f", resultNum)
    }
}

