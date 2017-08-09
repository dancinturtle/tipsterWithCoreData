//
//  ViewController.swift
//  tipster
//
//  Created by Anna Propas on 7/6/17.
//  Copyright © 2017 Anna Propas. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    var billString = "0"
    var billNum = Double(0.00)    
    
    // add outlets for all targets
    
    @IBOutlet weak var billTotal: UILabel!
    @IBOutlet weak var tenPercentTip: UILabel!
    @IBOutlet weak var tenPercentTotal: UILabel!
    @IBOutlet weak var fifteenPercentTip: UILabel!
    @IBOutlet weak var fifteenPercentTotal: UILabel!
    @IBOutlet weak var twentyPercentTip: UILabel!
    @IBOutlet weak var twentyPercentTotal: UILabel!
    @IBOutlet weak var decimalButton: UIButton!
    
    @IBAction func calculatorButtonWasPressed(_ sender: UIButton) {
        if (billString == "0") {
            billString = String(sender.tag)
        } else {
            billString += String(sender.tag)
        }
        updateDisplay()
    }
    
    // add actions for clear and decimal
    @IBAction func clearButtonWasPressed(_ sender: UIButton) {
        billString = "0"
        billNum = 0.00
        decimalButton.isEnabled = true
        updateDisplay()
    }
    @IBAction func decimalButtonWasPressed(_ sender: UIButton) {
        sender.isEnabled = false
        billString += "."
        updateDisplay()
    }
    
    // add function to handle updating the view
    
    func updateDisplay() {
        billNum = Double(billString)!
        
        billTotal.text = billString
        
        tenPercentTip.text = String(billNum * 0.1)
        tenPercentTotal.text = String(billNum * 1.1)
        fifteenPercentTip.text = String(billNum * 0.15)
        fifteenPercentTotal.text = String(billNum * 1.15)
        twentyPercentTip.text = String(billNum * 0.2)
        twentyPercentTotal.text = String(billNum * 1.2)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

