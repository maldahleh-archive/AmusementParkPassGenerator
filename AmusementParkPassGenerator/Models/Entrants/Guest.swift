//
//  Guest.swift
//  AmusementParkPassGenerator
//
//  Created by Mohammed Al-Dahleh on 2017-12-06.
//  Copyright © 2017 Mohammed Al-Dahleh. All rights reserved.
//

class ClassicGuest: Entrant {
    let areaAccess: [AreaAccess]
    let rideAccess: [RideAccess]
    var discountAccess: [DiscountAccess]
    
    init() {
        areaAccess = [.amusement]
        rideAccess = [.allRides]
        discountAccess = []
    }
}

class VIPGuest: ClassicGuest {
    override init() {
        super.init()
        
        discountAccess = [
            .foodDiscount(discount: 10),
            .merchandiseDiscount(discount: 20)
        ]
    }
}

class ChildGuest: ClassicGuest {
    override init() {
        super.init()
    }
}
