//
//  ViewController.swift
//  Tip Calculator
//
//  Created by David Head on 12/7/16.
//  Copyright © 2016 David Head. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // Class Variables
    
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var numPeopleText: UITextField!
    @IBOutlet weak var perPersonLabel: UILabel!



    // Class methods
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib
        print("View did load"); print(Date())
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("view will appear"); print(Date())
        // This is a good place to retrieve the default tip percentage from UserDefaults
        // and use it to update the tip amount
        
        // Declare UserDefaults
        let defaults = UserDefaults.standard
        
        //Retrieve default tip percent (set in Settings View)
        let segmentIndex = defaults.integer(forKey: "DefaultPercent")
        tipControl.selectedSegmentIndex = segmentIndex
        
        myCalculateTip()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("view did appear"); print(Date())
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("view will disappear"); print(Date())
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("view did disappear"); print(Date())
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        print("did receive memory warning"); print(Date())
    }

    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }

    @IBAction func calculateTip(_ sender: AnyObject) {
        
        myCalculateTip()
    }
    
    @IBAction func enterNumPeople(_ sender: Any) {
        myCalculateTip()
    }
    // User-written functions
    func myCalculateTip () {
        print("calculateTip")
        let tipPercentages = [0.18, 0.2, 0.25]
        
        let bill = Double(billField.text!) ?? 0
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        
        print(numPeopleText.text!)
        let numPeople = Double(numPeopleText.text!) ?? 1
        let perPerson = total/numPeople
        
        perPersonLabel.text = String(format: "$%.2f", perPerson)
    }
}

