//
//  ViewController.swift
//  tippy
//
//  Created by Yao Yu on 12/21/19.
//  Copyright © 2019 Yao Yu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var segmentLabel: UISegmentedControl!
    @IBOutlet weak var TotalTextLabel: UILabel!
    @IBOutlet weak var TipTextLabel: UILabel!
    @IBOutlet weak var BillAmountLabel: UILabel!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        billField.becomeFirstResponder()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        view.backgroundColor = Theme.current.backgroundColor
        BillAmountLabel.textColor = Theme.current.textColor
        TipTextLabel.textColor = Theme.current.textColor
        TotalTextLabel.textColor = Theme.current.textColor
        segmentLabel.backgroundColor = Theme.current.segmentColor

    }
    
    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        let bill = Double(billField.text!) ?? 0
        let tipPercent = [0.15, 0.18, 0.20]
        let tip = bill * tipPercent[tipControl.selectedSegmentIndex]
        let total = bill + tip
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }
}

