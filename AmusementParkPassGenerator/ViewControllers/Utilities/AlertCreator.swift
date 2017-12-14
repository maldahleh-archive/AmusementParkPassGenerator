//
//  AlertCreator.swift
//  AmusementParkPassGenerator
//
//  Created by Mohammed Al-Dahleh on 2017-12-14.
//  Copyright © 2017 Mohammed Al-Dahleh. All rights reserved.
//

import UIKit

class AlertCreator {
    static func createAlertWith(title: String, message: String) -> UIAlertController {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        
        alertController.addAction(alertAction)
        return alertController
    }
}
