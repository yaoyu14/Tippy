//
//  SettingsViewController.swift
//  tippy
//
//  Created by Yao Yu on 12/21/19.
//  Copyright © 2019 Yao Yu. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    @IBOutlet weak var switchButton: UISwitch!
    @IBOutlet weak var LightThemeLabel: UILabel!
  
    override func viewDidLoad() {
        super.viewDidLoad()
        applyTheme()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
         super.viewWillAppear(false)
         switchButton?.isOn =  UserDefaults.standard.bool(forKey: "switchState")
         switchButton?.addTarget(self, action: #selector(themeChange(_:)), for: .touchUpInside)
     }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func themeChange(_ sender: UISwitch) {
        if sender.isOn {
            Theme.current = DarkTheme()
        }
        else {
            Theme.current = LightTheme()
        }
        UserDefaults.standard.set(sender.isOn, forKey: "LightTheme")
        applyTheme()
        UserDefaults.standard.set(sender.isOn, forKey: "switchState")
        UserDefaults.standard.synchronize()

    }
    
    fileprivate func applyTheme() {
        view.backgroundColor = Theme.current.backgroundColor
        LightThemeLabel.textColor = Theme.current.textColor
    }
    

}
