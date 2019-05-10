//
//  ConverterViewController.swift
//  Conversion Calculator
//
//  Created by Brian Cox on 4/10/19.
//  Copyright © 2019 Brian Cox. All rights reserved.
//

import UIKit

class ConverterViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        inputDisplay.isUserInteractionEnabled = false
        outputDisplay.isUserInteractionEnabled = false

        setConversion(converterTypes[0])
        
        updateDisplay()
    }
    
    struct converter {
        let id: Int
        let label: String
        let inputUnit: String
        let outputUnit: String
    }
    
    let converterTypes = [converter(id: 0, label: "fahrenheit to celcius", inputUnit: "°F", outputUnit: "°C"),
                          converter(id: 1, label: "celcius to fahrenheit", inputUnit: "°C", outputUnit: "°F"),
                          converter(id: 2, label: "miles to kilometers", inputUnit: "mi", outputUnit: "km"),
                          converter(id: 3, label: "kilometers to miles", inputUnit: "km", outputUnit: "mi")]
    
    var inputString: String = ""
    var converterID: Int = 0
    var negative: Bool = false
    
    func setConversion(_ converterType: converter) -> Void {
        converterID = converterType.id
        
        updateDisplay()
    }
    
    func updateDisplay() {
        inputDisplay.text = (negative ? "-" : "") + inputString + " " + converterTypes[converterID].inputUnit
        
        let inputNum: Float = (negative ? -1 : 1) * (Float(inputString) ?? 0)
        
        if inputString != "" {
            if converterID == 0 {
                outputDisplay.text = String(round(((inputNum - 32) * 5 / 9) * 1000) / 1000) + " " + converterTypes[converterID].outputUnit
            } else if converterID == 1 {
                outputDisplay.text = String(round(((inputNum * 9 / 5) + 32) * 1000) / 1000) + " " + converterTypes[converterID].outputUnit
            } else if converterID == 2 {
                outputDisplay.text = String(round(inputNum * 1.609344 * 1000) / 1000) + " " + converterTypes[converterID].outputUnit
            } else if converterID == 3 {
                outputDisplay.text = String(round(inputNum * 0.62137119 * 1000) / 1000) + " " + converterTypes[converterID].outputUnit
            }
        } else {
            outputDisplay.text = converterTypes[converterID].outputUnit
        }
    }
    
    @IBAction func ConverterButtonPressed(_ sender: Any) {
        let actionSheet = UIAlertController(title: "Choose Converter", message: nil, preferredStyle: .actionSheet)
        
        actionSheet.popoverPresentationController?.sourceView = self.view
        actionSheet.popoverPresentationController?.sourceRect = CGRect(x: self.view.bounds.midX, y: self.view.bounds.maxY, width: 0, height: 0)
        actionSheet.popoverPresentationController?.permittedArrowDirections = []
        
        actionSheet.addAction(UIAlertAction(title: NSLocalizedString("fahrenheit to celcius", comment: "Default action"), style: .default, handler: { action in
                self.setConversion(self.converterTypes[0])
        }))
        
        actionSheet.addAction(UIAlertAction(title: NSLocalizedString("celcius to fahrenheit", comment: "Default action"), style: .default, handler: { action in
                self.setConversion(self.converterTypes[1])
        }))
        
        actionSheet.addAction(UIAlertAction(title: NSLocalizedString("miles to kilometers", comment: "Default action"), style: .default, handler: { action in
                self.setConversion(self.converterTypes[2])
        }))
        
        actionSheet.addAction(UIAlertAction(title: NSLocalizedString("kilometers to miles", comment: "Default action"), style: .default, handler: { action in
                self.setConversion(self.converterTypes[3])
        }))
        
        self.present(actionSheet, animated: true, completion: nil)
    }
   
    @IBOutlet weak var outputDisplay: UITextField!
    
    @IBOutlet weak var inputDisplay: UITextField!
    
    @IBAction func clearInput(_ sender: Any) {
        inputString = ""
        negative = false
        updateDisplay()
    }
    
    @IBAction func changeSign(_ sender: Any) {
        if negative == false {
            negative = true
        } else {
            negative = false
        }
        
        updateDisplay()
    }
    
    @IBAction func pressDecimal(_ sender: Any) {
        if(inputString != "" && !inputString.contains(".")) {
            inputString += "."
            updateDisplay()
        }
    }
    
    @IBAction func press0(_ sender: Any) {
        if inputString != "" {
            inputString += "0"
            updateDisplay()
        }
    }
    
    @IBAction func press1(_ sender: Any) {
        inputString += "1"
        updateDisplay()
    }
    
    @IBAction func press2(_ sender: Any) {
        inputString += "2"
        updateDisplay()
    }
    
    @IBAction func press3(_ sender: Any) {
        inputString += "3"
        updateDisplay()
    }
    
    @IBAction func press4(_ sender: Any) {
        inputString += "4"
        updateDisplay()
    }
    
    @IBAction func press5(_ sender: Any) {
        inputString += "5"
        updateDisplay()
    }
    
    @IBAction func press6(_ sender: Any) {
        inputString += "6"
        updateDisplay()
    }
    
    @IBAction func press7(_ sender: Any) {
        inputString += "7"
        updateDisplay()
    }
    
    @IBAction func press8(_ sender: Any) {
        inputString += "8"
        updateDisplay()
    }
    
    @IBAction func press9(_ sender: Any) {
        inputString += "9"
        updateDisplay()
    }
    
    /*
     // MARK: - Navigation
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
