//
//  DataRandomizer.swift
//  AmusementParkPassGenerator
//
//  Created by Mohammed Al-Dahleh on 2017-12-13.
//  Copyright © 2017 Mohammed Al-Dahleh. All rights reserved.
//

import Foundation

extension ViewController {
    // Populated with random data retrieved from random address generator
    func populateData() {
        var dobYear = "1990"
        
        if selectionHandler.mainBarSelection == .guest {
            switch selectionHandler.secondarySelection {
            case 0: dobYear = "2016"
            case 3: dobYear = "1942"
            default: break
            }
        }
        
        dobTextField.text = "10/05/\(dobYear)"
        ssnTextField.text = "613-42-9837"
        
        if firstNameTextField.isEnabled {
            firstNameTextField.text = "Eric"
            lastNameTextField.text = "Morse"
        }
        
        if streetAddressTextField.isEnabled {
            streetAddressTextField.text = "70 Bowman St"
            cityTextField.text = "South Windsor"
            stateTextField.text = "CT"
            zipTextField.text = "06074"
        }
    }
}
