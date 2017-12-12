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
    func setActivityTo(_ active: Bool, for field: UITextField) {
        setActivityTo(active, for: [field])
    }
    
    func setActivityTo(_ active: Bool, for fields: [UITextField]) {
        for field in fields {
            field.isEnabled = active
            
            if active {
                field.backgroundColor = .white
            } else {
                field.backgroundColor = Colours.mainBackgroundColour
            }
        }
    }
}
