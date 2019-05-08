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

        setConversion(converterTypes[0])
    }
    
    struct converter {
        let label: String
        let inputUnit: String
        let outputUnit: String
    }
    
    let converterTypes = [converter(label: "fahrenheit to celcius", inputUnit: "°F", outputUnit: "°C"),
                          converter(label: "celcius to fahrenheit", inputUnit: "°C", outputUnit: "°F"),
                          converter(label: "miles to kilometers", inputUnit: "mi", outputUnit: "km"),
                          converter(label: "kilometers to miles", inputUnit: "km", outputUnit: "mi")]
    
    func setConversion(_ converterType: converter) -> Void {
        outputDisplay.text = converterType.outputUnit
        inputDisplay.text = converterType.inputUnit
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
    
    /*
     // MARK: - Navigation
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
