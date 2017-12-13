//
//  Guest.swift
//  AmusementParkPassGenerator
//
//  Created by Mohammed Al-Dahleh on 2017-12-06.
//  Copyright © 2017 Mohammed Al-Dahleh. All rights reserved.
//

import Foundation

class ClassicGuest: Entrant {
    var lastSwipe: Date?
    
    let birthday: Date
    
    let areaAccess: [AreaAccess]
    var rideAccess: [RideAccess]
    var discountAccess: [DiscountAccess]
    
    init(day: Int, month: Int, year: Int) throws {
        self.birthday = Date.create(day: day, month: month, year: year)
        
        areaAccess = [.amusement]
        rideAccess = [.allRides]
        discountAccess = []
    }
    
    func swiped() {
        lastSwipe = Date()
    }
}

class ChildGuest: ClassicGuest {
    override init(day: Int, month: Int, year: Int) throws {
        try! super.init(day: day, month: month, year: year)
     
        if !isUnderFive() {
            throw DataError.overAgeOfFive
        }
    }
}

class VIPGuest: ClassicGuest {
    override init(day: Int, month: Int, year: Int) throws {
        try! super.init(day: day, month: month, year: year)
        
        rideAccess = [
            .allRides,
            .skipLines
        ]
        
        discountAccess = [
            .foodDiscount(discount: 10),
            .merchandiseDiscount(discount: 20)
        ]
    }
}

class SeniorGuest: ClassicGuest, Nameable {
    let name: Name
    
    init(name: Name, day: Int, month: Int, year: Int) {
        self.name = name
        
        try! super.init(day: day, month: month, year: year)
        
        rideAccess = [
            .allRides,
            .skipLines
        ]
        
        discountAccess = [
            .foodDiscount(discount: 10),
            .merchandiseDiscount(discount: 10)
        ]
    }
}

class SeasonGuest: ClassicGuest, Nameable, Addressable {
    let name: Name
    let address: Address
    
    init(name: Name, address: Address, day: Int, month: Int, year: Int) {
        self.name = name
        self.address = address
        
        try! super.init(day: day, month: month, year: year)
        
        rideAccess = [
            .allRides,
            .skipLines
        ]
        
        discountAccess = [
            .foodDiscount(discount: 10),
            .merchandiseDiscount(discount: 20)
        ]
    }
}
