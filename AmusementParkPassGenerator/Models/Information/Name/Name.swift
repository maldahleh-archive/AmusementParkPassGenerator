//
//  File.swift
//  AmusementParkPassGenerator
//
//  Created by Mohammed Al-Dahleh on 2017-12-06.
//  Copyright © 2017 Mohammed Al-Dahleh. All rights reserved.
//

struct Name {
    let firstName: String
    let lastName: String
    
    var fullName: String {
        return "\(firstName) \(lastName)"
    }
    
    init(firstName: String, lastName: String) throws {
        if firstName.isEmpty {
            // FIXME: Throw error
        }
        
        if lastName.isEmpty {
            // FIXME: Throw error
        }
        
        self.firstName = firstName
        self.lastName = lastName
    }
}
