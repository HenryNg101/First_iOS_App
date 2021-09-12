//
//  ViewController.swift
//  Assignment 1: A horsepower calculator
//  Created by nguqy034
//
//

import UIKit

class ViewController: UIViewController {
    
    //Horsepower measurement and unit buttons
    @IBOutlet weak var KilowattsButton: UIButton!
    @IBOutlet weak var HorsepowerButton: UIButton!
    @IBOutlet weak var MechanicalButton: UIButton!
    @IBOutlet weak var ElectricalButton: UIButton!
    @IBOutlet weak var MetricButton: UIButton!
    @IBOutlet weak var ConvertedResult: UILabel!
    @IBOutlet weak var EnteredValue: UILabel!
    
    var ratio = 0.0     //Ratio to convert
    var isNew = true    //Check if number is a new number of not
    var convert_unit = ""   //Unit to convert to, horsepower (hp) or Kilowatts (kW)
    var measurementButtons: [UIButton: Double] = [:]    //Dictionary for all measurement buttons (Mechanical, Electrical or Metric)
    var unitButtons: [UIButton] = []    //List for unit buttons (Kilowatts or Horsepower)
    
    //When user click on a number on the pad to add number
    @IBAction func numberButtonEvent(_ sender: UIButton) {
        let newNumeral = sender.titleLabel?.text
        var oldNumber = EnteredValue.text
        
        if (isNew) {
            oldNumber = ""
            isNew = false
        }
        EnteredValue.text = (oldNumber ?? "") + (newNumeral ?? "")
    }
    
    //When users convert their entered value
    @IBAction func ConvertValue(_ sender: UIButton) {
        let hp_value = Double(EnteredValue.text ?? "")
        if (hp_value != nil){
            if ((ratio != 0.0) && (convert_unit != "")) {
                if (convert_unit == "Horsepower (hp)"){
                    //Convert back from Kilowatts to horsepower, so need to use division, which is the reverse of multiplication
                    ConvertedResult.text = String(hp_value! / ratio) + " hp"
                }
                else if (convert_unit == "Kilowatts (kW)") {
                    ConvertedResult.text = String(hp_value! * ratio) + " kW"
                }
            }
        }
    }
    
    //When user need to choose what unit to convert to
    @IBAction func ChooseConvertUnit(_ sender: UIButton) {
        convert_unit = sender.titleLabel?.text ?? ""
        sender.backgroundColor = UIColor.yellow
        
        for button in unitButtons {
            if (button.titleLabel?.text != convert_unit){
                button.backgroundColor = UIColor.systemGray2
            }
        }
    }
    
    //When user need to reset for a new conversion
    @IBAction func deleteNumEvent(_ sender: UIButton) {
        EnteredValue.text = "0"
        ratio = 0.0
        isNew = true
        
        //Reset all buttons's color back to default
        for button in unitButtons {
            button.backgroundColor = UIColor.systemGray2
        }
        for (key, value) in measurementButtons {
            key.backgroundColor = UIColor.systemGray2
        }
    }
    
    //When user can choose different types of horsepower to calculate
    @IBAction func measurementSelect(_ sender: UIButton) {
        var hp_measurement = sender.titleLabel?.text
        //Set color to the selected button, and also reset the other buttons's color to let user know what they chose
        sender.backgroundColor = UIColor.yellow
        ratio = measurementButtons[sender] ?? 0.0
        
        for (key, value) in measurementButtons {
            if (key.titleLabel?.text != hp_measurement) {
                key.backgroundColor = UIColor.systemGray2
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //Setup collections's values
        measurementButtons[MetricButton] = 0.73549875
        measurementButtons[MechanicalButton] = 0.745699872
        measurementButtons[ElectricalButton] = 0.746
        unitButtons.append(HorsepowerButton)
        unitButtons.append(KilowattsButton)
    }
}
