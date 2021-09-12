//
//  ViewController.swift
//  Assignment 1
//
//  Created by user928878 on 9/11/21.
//

import UIKit

class ViewController: UIViewController {
    
    var ratio = 0.0
    var isNew = true
    var convert_unit = ""
    
    @IBOutlet weak var KilowattsButton: UIButton!
    @IBOutlet weak var HorsepowerButton: UIButton!
    @IBOutlet weak var MechanicalButton: UIButton!
    @IBOutlet weak var ElectricalButton: UIButton!
    @IBOutlet weak var MetricButton: UIButton!
    @IBOutlet weak var ConvertedResult: UILabel!
    @IBOutlet weak var EnteredValue: UILabel!
    @IBAction func numberButtonEvent(_ sender: UIButton) {
        //Add number here
        let newNumeral = sender.titleLabel?.text
        var oldNumber = EnteredValue.text
        
        if (isNew) {
            oldNumber = ""
            isNew = false
        }
        EnteredValue.text = (oldNumber ?? "") + (newNumeral ?? "")
    }
    
    @IBAction func ConvertValue(_ sender: UIButton) {
        let hp_value = Double(EnteredValue.text ?? "")
        if (hp_value != nil){
            if ((ratio != 0.0) && (convert_unit != "")) {
                if (convert_unit == "Horsepower (hp)"){
                    ConvertedResult.text = String(hp_value! / ratio) + " hp"
                }
                else if (convert_unit == "Kilowatts (kW)") {
                    ConvertedResult.text = String(hp_value! * ratio) + " kW"
                }
                ResetValue()
            }
        }
    }
    
    func ResetValue() {
        ratio = 0.0
        isNew = true
        MetricButton.backgroundColor = UIColor.systemGray2
        KilowattsButton.backgroundColor = UIColor.systemGray2
        HorsepowerButton.backgroundColor = UIColor.systemGray2
        MechanicalButton.backgroundColor = UIColor.systemGray2
        ElectricalButton.backgroundColor = UIColor.systemGray2
    }
    
    @IBAction func ChooseConvertUnit(_ sender: UIButton) {
        convert_unit = sender.titleLabel?.text ?? ""
        sender.backgroundColor = UIColor.yellow
        if (convert_unit == "Horsepower (hp)"){
            KilowattsButton.backgroundColor = UIColor.systemGray2
        }
        else if (convert_unit == "Kilowatts (kW)"){
            HorsepowerButton.backgroundColor = UIColor.systemGray2
        }
    }
    
    @IBAction func deleteNumEvent(_ sender: UIButton) {
        EnteredValue.text = "0"
        isNew = true
    }
    
    @IBAction func measurementSelect(_ sender: UIButton) {
        var hp_measurement = sender.titleLabel?.text
        sender.backgroundColor = UIColor.yellow
        if (hp_measurement == "Metric"){
            ratio = 0.73549875
            ElectricalButton.backgroundColor = UIColor.systemGray2
            MechanicalButton.backgroundColor = UIColor.systemGray2
        }
        else if (hp_measurement == "Electrical"){
            ratio = 0.746
            MetricButton.backgroundColor = UIColor.systemGray2
            MechanicalButton.backgroundColor = UIColor.systemGray2
        }
        else if (hp_measurement == "Mechanical"){
            ratio = 0.745699872
            MetricButton.backgroundColor = UIColor.systemGray2
            ElectricalButton.backgroundColor = UIColor.systemGray2
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}
