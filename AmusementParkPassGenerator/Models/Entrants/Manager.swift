//
//  Manager.swift
//  AmusementParkPassGenerator
//
//  Created by Mohammed Al-Dahleh on 2017-12-06.
//  Copyright © 2017 Mohammed Al-Dahleh. All rights reserved.
//

import Foundation

class Manager: Employee {
    var firstName: String = ""
    var lastName: String = ""
    var birthday: Date = Date()
    
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
}
