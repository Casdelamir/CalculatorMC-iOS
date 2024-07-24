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
    
    var resultMessage: String!
    var currentValueHight: Float = 0.0
    var currentValueWeghit: Float = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
            
    // Add a default action (OK button)
            let okAction = UIAlertAction(title: "OK", style: .default) { _ in
                print("OK tapped")
            }
    

    @IBAction func setWeight(_ sender: UIStepper) {
        currentValueWeghit = Float(sender.value)
        valueWeight.text = "\( currentValueWeghit) kg"
    }
    
    
    @IBAction func setHight(_ sender: UISlider) {
        currentValueHight = sender.value
        valueHight.text = String(format: "%.2f cm", currentValueHight)
    }
    
    @IBAction func calculateResult(_ sender: Any) {
        var resultNum = currentValueWeghit / pow((currentValueHight / 100.0), 2)
        result.text = String(format: "%.2f", resultNum)
        
        switch resultNum {
        case ..<18.5:
            resultMessage = "Underweight"
        case 18.5...24.9:
            resultMessage = "Normal"
        case 25.0...29.9:
            resultMessage = "Weight above normal"
        case 30...:
            resultMessage = "Obesity"
        default:
            resultMessage = "Invalid value"
        }
        
        // Create the alert controller
        let alertController = UIAlertController(title: resultMessage, message: nil, preferredStyle: .alert)

        alertController.addAction(okAction)
        
        // Present the alert
                present(alertController, animated: true, completion: nil)
    }
    
}

