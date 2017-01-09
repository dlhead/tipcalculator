//
//  SettingsViewController.swift
//  Tip Calculator
//
//  Created by David Head on 12/18/16.
//  Copyright © 2016 David Head. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    @IBOutlet weak var defaultTipPercent: UISegmentedControl!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    @IBAction func saveDefaultTipPercent(_ sender: Any) {
        // Access UserDefaults
        
        let defaults = UserDefaults.standard
        
        defaults.set(defaultTipPercent.selectedSegmentIndex,forKey: "DefaultPercent")
        print(defaultTipPercent.selectedSegmentIndex)
        defaults.synchronize()
    }

}
