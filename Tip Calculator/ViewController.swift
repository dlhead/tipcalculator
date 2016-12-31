//
//  ViewController.swift
//  Tip Calculator
//
//  Created by David Head on 12/7/16.
//  Copyright © 2016 David Head. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipControl: UISegmentedControl!


    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("view will appear")
        // This is a good place to retrieve the default tip percentage from UserDefaults
        // and use it to update the tip amount
        
        // Declare UserDefaults
        let defaults = UserDefaults.standard
        
        //Retrieve default tip percent
        let segmentIndex = defaults.integer(forKey: "DefaultPercent")
        tipControl.selectedSegmentIndex = segmentIndex
        
        // 2 problems here:
        // 1)Tip Calculator shows the new default percent BUT DOES NOT RECALCULATE TIP OR TOTAL 
        //   IF THEre IS ALREADY A VALUE IN BILL FIELD
        // 2) When returning to settings view, the default percent has returned to the original value
        // Maybe I should sync new UserDefaults
       // let bill = Double(billField.text!) ?? 0
       // let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
       // let total = bill + tip)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
         print("view did appear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("view will disappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("view did disappear")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }

    @IBAction func calculateTip(_ sender: AnyObject) {
        
        let tipPercentages = [0.18, 0.2, 0.25]
        
        let bill = Double(billField.text!) ?? 0
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }
}

