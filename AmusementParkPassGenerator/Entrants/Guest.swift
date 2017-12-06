//
//  Guest.swift
//  AmusementParkPassGenerator
//
//  Created by Mohammed Al-Dahleh on 2017-12-06.
//  Copyright © 2017 Mohammed Al-Dahleh. All rights reserved.
//

protocol Guest {
    var areaAccess: [AreaAccess] { get }
    var rideAccess: [RideAccess] { get }
    var discountAccess: [DiscountAccess] { get set }
}

class ClassicGuest: Guest {
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
