//
//  ViewController.swift
//  AmusementParkPassGenerator
//
//  Created by Mohammed Al-Dahleh on 2017-12-05.
//  Copyright © 2017 Mohammed Al-Dahleh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: UI Helper methods
    func setEnabledTo(_ enabled: Bool, for field: UITextField) {
        setActivityTo(enabled, for: [field])
    }
    
    func setEnabledTo(_ enabled: Bool, for fields: [UITextField]) {
        for field in fields {
            field.isEnabled = enabled
            
            if enabled {
                field.backgroundColor = .white
            } else {
                field.backgroundColor = Colours.mainBackgroundColour
            }
        }
    }
}
