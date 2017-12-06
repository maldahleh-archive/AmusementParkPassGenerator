//
//  Manager.swift
//  AmusementParkPassGenerator
//
//  Created by Mohammed Al-Dahleh on 2017-12-06.
//  Copyright © 2017 Mohammed Al-Dahleh. All rights reserved.
//

import Foundation

class Manager: Employee {
    let name: Name
    var birthday: Date
    let address: Address
    
    var areaAccess: [AreaAccess] = [
        .amusement,
        .kitchen,
        .rideControl,
        .maintenance,
        .office
    ]
    
    var rideAccess: [RideAccess] = [
        .allRides
    ]
    
    var discountAccess: [DiscountAccess] = [
        .foodDiscount(discount: 25),
        .merchandiseDiscount(discount: 25)
    ]
    
    init(name: Name, birthday: Date, address: Address) {
        self.name = name
        self.birthday = birthday
        self.address = address
    }
}
