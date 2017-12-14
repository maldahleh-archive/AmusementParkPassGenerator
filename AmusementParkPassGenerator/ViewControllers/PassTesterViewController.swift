//
//  PassTesterViewController.swift
//  AmusementParkPassGenerator
//
//  Created by Mohammed Al-Dahleh on 2017-12-10.
//  Copyright © 2017 Mohammed Al-Dahleh. All rights reserved.
//

import UIKit

class PassTesterViewController: UIViewController {
    var entrant: Entrant?

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    
    @IBOutlet weak var resultsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let entrant = entrant {
            if let seasonGuest = entrant as? SeasonGuest {
                nameLabel.text = seasonGuest.name.fullName
                typeLabel.text = "Season Pass Guest Pass"
                return
            }
            
            if let seniorGuest = entrant as? SeniorGuest {
                nameLabel.text = seniorGuest.name.fullName
                typeLabel.text = "Senior Guest Pass"
                return
            }
            
            if entrant is ClassicGuest {
                nameLabel.text = "Unnamed"
                typeLabel.text = "Guest Pass"
            }
            
            if let hourlyEmployee = entrant as? HourlyEmployee {
                nameLabel.text = hourlyEmployee.name.fullName
                typeLabel.text = "Hourly Employee Pass"
            }
            
            if let contractEmployee = entrant as? ContractEmployee {
                nameLabel.text = contractEmployee.name.fullName
                typeLabel.text = "Contract Employee Pass"
            }
            
            if let manager = entrant as? Manager {
                nameLabel.text = manager.name.fullName
                typeLabel.text = "Manager Pass"
            }
            
            if let vendor = entrant as? Vendor {
                nameLabel.text = vendor.name.fullName
                typeLabel.text = "Vendor Pass"
            }
        }
    }
}
