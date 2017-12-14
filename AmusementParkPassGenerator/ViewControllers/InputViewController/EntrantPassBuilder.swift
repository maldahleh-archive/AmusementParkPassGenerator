//
//  EntrantPassBuilder.swift
//  AmusementParkPassGenerator
//
//  Created by Mohammed Al-Dahleh on 2017-12-13.
//  Copyright © 2017 Mohammed Al-Dahleh. All rights reserved.
//

import Foundation

extension ViewController {
    func createEntrant() throws -> Entrant? {
        var name: Name?
        var birthday: CreatedDate?
        var address: Address?
        
        let contractType = ContractType(rawValue: selectionHandler.secondarySelection)
        let vendorType = VendorType(rawValue: selectionHandler.secondarySelection)
        
        let splitDate = dobTextField.text?.split(separator: "/")
        
        do {
            if let splitDate = splitDate, let dayObj = splitDate[safe: 1], let day = Int(dayObj), let monthObj = splitDate[safe: 0], let month = Int(monthObj), let yearObj = splitDate[safe: 2], let year = Int(yearObj) {
                birthday = try CreatedDate(day: day, month: month, year: year)
            } else {
                throw DataError.invalidDate
            }
        } catch let error {
            throw error
        }
        
        if firstNameTextField.isEnabled {
            if let firstName = firstNameTextField.text, let lastName = lastNameTextField.text {
                do {
                    name = try Name(firstName: firstName, lastName: lastName)
                } catch let error {
                    throw error
                }
            } else {
                throw DataError.missingInformation(missing: "Name")
            }
        }
        
        if streetAddressTextField.isEnabled {
            if let streetAddress = streetAddressTextField.text, let city = cityTextField.text, let state = stateTextField.text, let zipCode = zipTextField.text {
                do {
                    address = try Address(streetAddress: streetAddress, city: city, state: state, zipCode: zipCode)
                } catch let error {
                    throw error
                }
            } else {
                throw DataError.missingInformation(missing: "Address")
            }
        }
        
        switch selectionHandler.mainBarSelection {
        case .guest:
            switch selectionHandler.secondarySelection {
            case 0:
                let guest = ChildGuest(birthday: birthday!)
                if !guest.isUnderFive() { throw DataError.overAgeOfFive }
                
                return guest
            case 1: return ClassicGuest(birthday: birthday!)
            case 2: return VIPGuest(birthday: birthday!)
            case 3: return SeniorGuest(name: name!, birthday: birthday!)
            case 4: return SeasonGuest(name: name!, address: address!, birthday: birthday!)
            default: return nil
            }
        case .employee:
            switch selectionHandler.secondarySelection {
            case 0: return HourlyEmployeeFood(name: name!, birthday: birthday!, address: address!)
            case 1: return HourlyEmployeeRideServices(name: name!, birthday: birthday!, address: address!)
            case 2: return HourlyEmployeeMaintenance(name: name!, birthday: birthday!, address: address!)
            default: return nil
            }
        case .manager: return Manager(name: name!, birthday: birthday!, address: address!)
        case .contract: return ContractEmployee(name: name!, birthday: birthday!, address: address!, type: contractType!)
        case .vendor: return Vendor(name: name!, birthday: birthday!, type: vendorType!)
        }
    }
}
