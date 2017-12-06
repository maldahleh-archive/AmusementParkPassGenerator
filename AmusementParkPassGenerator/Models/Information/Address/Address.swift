//
//  Address.swift
//  AmusementParkPassGenerator
//
//  Created by Mohammed Al-Dahleh on 2017-12-06.
//  Copyright © 2017 Mohammed Al-Dahleh. All rights reserved.
//

struct Address {
    let streetAddress: String
    let city: String
    let state: String
    let zipCode: String
    
    init(streetAddress: String, city: String, state: String, zipCode: String) throws {
        if streetAddress.isEmpty {
            throw DataError.missingInformation(missing: "Street Address")
        }
        
        if city.isEmpty {
            throw DataError.missingInformation(missing: "City")
        }
        
        if state.isEmpty {
            throw DataError.missingInformation(missing: "State")
        }
        
        if zipCode.isEmpty {
            throw DataError.missingInformation(missing: "Zip Code")
        }
        
        self.streetAddress = streetAddress
        self.city = city
        self.state = state
        self.zipCode = zipCode
    }
}
