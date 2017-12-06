//
//  Nameable.swift
//  AmusementParkPassGenerator
//
//  Created by Mohammed Al-Dahleh on 2017-12-06.
//  Copyright © 2017 Mohammed Al-Dahleh. All rights reserved.
//

protocol Nameable {
    var firstName: String { get set }
    var lastName: String { get set }
    
    func fullName() -> String
}

extension Nameable {
    func fullName() -> String {
        return "\(firstName) \(lastName)"
    }
}
