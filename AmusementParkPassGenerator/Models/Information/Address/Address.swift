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
            // FIXME: Throw error
        }
        
        if city.isEmpty {
            // FIXME: Throw error
        }
        
        if state.isEmpty {
            // FIXME: Throw error
        }
        
        if zipCode.isEmpty {
            // FIXME: Throw error
        }
        
        self.streetAddress = streetAddress
        self.city = city
        self.state = state
        self.zipCode = zipCode
    }
}
