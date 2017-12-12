//
//  ViewController.swift
//  AmusementParkPassGenerator
//
//  Created by Mohammed Al-Dahleh on 2017-12-05.
//  Copyright © 2017 Mohammed Al-Dahleh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var dobLabel: UILabel!
    @IBOutlet weak var dobTextField: UITextField!
    @IBOutlet weak var ssnLabel: UILabel!
    @IBOutlet weak var ssnTextField: UITextField!
    
    @IBOutlet weak var projectNoLabel: UILabel!
    @IBOutlet weak var projectNoTextField: UITextField!
    @IBOutlet weak var companyLabel: UILabel!
    @IBOutlet weak var companyTextField: UITextField!
    
    @IBOutlet var nameLabels: [UILabel]!
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    
    @IBOutlet var addressLabels: [UILabel]!
    @IBOutlet weak var streetAddressTextField: UITextField!
    @IBOutlet weak var cityTextField: UITextField!
    @IBOutlet weak var stateTextField: UITextField!
    @IBOutlet weak var zipTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: Main UI methods
    func updateFieldInteractivityFor(_ entrant: Entrant) {
        if entrant is Nameable {
            setEnabledTo(true, for: nameLabels)
            setEnabledTo(true, for: [firstNameTextField, lastNameTextField])
        }
        
        if entrant is Addressable {
            setEnabledTo(true, for: addressLabels)
            setEnabledTo(true, for: [streetAddressTextField, cityTextField, stateTextField, zipTextField])
        }
    }
    
    // MARK: UI Helper methods
    func setEnabledTo(_ enabled: Bool, for objects: [AnyObject]) {
        for object in objects {
            setEnabledTo(enabled, for: object)
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
}
