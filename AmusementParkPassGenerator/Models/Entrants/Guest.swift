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
    
    let birthday: CreatedDate
    
    let areaAccess: [AreaAccess]
    var rideAccess: [RideAccess]
    var discountAccess: [DiscountAccess]
    
    init(date: CreatedDate) {
        self.birthday = date
        
        areaAccess = [.amusement]
        rideAccess = [.allRides]
        discountAccess = []
    }
    
    func swiped() {
        lastSwipe = Date()
    }
}

class ChildGuest: ClassicGuest {
    override init(date: CreatedDate) {
        super.init(date: date)
    }
}

class VIPGuest: ClassicGuest {
    override init(date: CreatedDate) {
        super.init(date: date)
        
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
    
    init(name: Name, date: CreatedDate) {
        self.name = name
        
        super.init(date: date)
        
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
    
    init(name: Name, address: Address, date: CreatedDate) {
        self.name = name
        self.address = address
        
        super.init(date: date)
        
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
