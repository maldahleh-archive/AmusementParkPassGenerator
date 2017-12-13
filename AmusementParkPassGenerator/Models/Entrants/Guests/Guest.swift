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
    
    init(birthday: CreatedDate) {
        self.birthday = birthday
        
        areaAccess = [.amusement]
        rideAccess = [.allRides]
        discountAccess = []
    }
    
    func swiped() {
        lastSwipe = Date()
    }
}

class ChildGuest: ClassicGuest {
    override init(birthday: CreatedDate) {
        super.init(birthday: birthday)
    }
}

class VIPGuest: ClassicGuest {
    override init(birthday: CreatedDate) {
        super.init(birthday: birthday)
        
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

class SeniorGuest: VIPGuest, Nameable {
    let name: Name
    
    init(name: Name, birthday: CreatedDate) {
        self.name = name
        
        super.init(birthday: birthday)
        
        discountAccess = [
            .foodDiscount(discount: 10),
            .merchandiseDiscount(discount: 10)
        ]
    }
}

class SeasonGuest: VIPGuest, Nameable, Addressable {
    let name: Name
    let address: Address
    
    init(name: Name, address: Address, birthday: CreatedDate) {
        self.name = name
        self.address = address
        
        super.init(birthday: birthday)
    }
}
