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
    
    // MARK: Main UI methods
    func updateFieldInteractivityFor(_ entrant: Entrant) {
        
    }
    
    // MARK: UI Helper methods
    func setEnabledTo<T>(_ enabled: Bool, for object: T) {
        if let textField = object as? UITextField {
            setEnabledTo(enabled, for: textField)
        }
        
        if let label = object as? UILabel {
            setEnabledTo(enabled, for: label)
        }
    }
    
    func setEnabledTo(_ enabled: Bool, for field: UITextField) {
        field.isEnabled = enabled
        
        if enabled {
            field.backgroundColor = .white
        } else {
            field.backgroundColor = Colours.mainBackgroundColour
        }
    }
    
    func setEnabledTo(_ enabled: Bool, for label: UILabel) {
        if enabled {
            label.backgroundColor = Colours.enabledLabelColour
        } else {
            label.backgroundColor = Colours.disabledLabelColour
        }
    }
    
    func setEnabledTo(_ enabled: Bool, for fields: [UITextField]) {
        for field in fields {
            setEnabledTo(enabled, for: field)
        }
    }
    
    func setEnabledTo(_ enabled: Bool, for labels: [UILabel]) {
        for label in labels {
            setEnabledTo(enabled, for: label)
        }
    }
}
