//
//  ViewController.swift
//  AmusementParkPassGenerator
//
//  Created by Mohammed Al-Dahleh on 2017-12-05.
//  Copyright © 2017 Mohammed Al-Dahleh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var mainBarSelection: MainEntrantUIBar = MainEntrantUIBar.guest
    
    @IBOutlet var mainBarButtons: [UIButton]!
    @IBOutlet weak var secondaryRoleBar: UIView!
    
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
    
    // MARK: Role bars
    @IBAction func entrantGroupButtonTapped(_ sender: UIButton) {
        if let mainBarSelection = MainEntrantUIBar(rawValue: sender.tag) {
            self.mainBarSelection = mainBarSelection
            
            updateSecodaryBarWith(self.mainBarSelection)
        }
    }
    
    func updateSecodaryBarWith(_ role: MainEntrantUIBar) {
        secondaryRoleBar.isHidden = false
        updateMainButtonsWith(mainBarSelection)
        
        if role == .manager {
            secondaryRoleBar.isHidden = true
        }
    }
    
    // MARK: UI enabling/disabling
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
    
    func updateMainButtonsWith(_ selected: MainEntrantUIBar) {
        for button in mainBarButtons {
            let selected = (button.tag == mainBarSelection.rawValue)
            
            setSelectedTo(selected, for: button, withType: .main)
        }
    }
    
    func setEnabledTo(_ enabled: Bool, for objects: [AnyObject]) {
        for object in objects {
            if let textField = object as? UITextField {
                setEnabledTo(enabled, for: textField)
            }
            
            if let label = object as? UILabel {
                setEnabledTo(enabled, for: label)
            }
        }
    }
    
    func setSelectedTo(_ selected: Bool, for button: UIButton, withType type: ButtonType) {
        // FIXME: Implement second button type
        switch type {
        case .main:
            if selected {
                button.setTitleColor(Colours.mainBarEnabledColour, for: .normal)
            } else {
                button.setTitleColor(Colours.mainBarDisabledColour, for: .normal)
            }
        case .secondary: return
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

extension ViewController {
    enum ButtonType {
        case main
        case secondary
    }
}
