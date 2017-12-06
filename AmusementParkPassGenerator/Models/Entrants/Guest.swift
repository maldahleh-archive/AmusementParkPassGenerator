//
//  Guest.swift
//  AmusementParkPassGenerator
//
//  Created by Mohammed Al-Dahleh on 2017-12-06.
//  Copyright © 2017 Mohammed Al-Dahleh. All rights reserved.
//

import Foundation

class ClassicGuest: Entrant {
    let birthday: Date
    
    let areaAccess: [AreaAccess]
    var rideAccess: [RideAccess]
    var discountAccess: [DiscountAccess]
    
    init(birthday: Date) throws {
        self.birthday = birthday
        
        areaAccess = [.amusement]
        rideAccess = [.allRides]
        discountAccess = []
    }
    
    convenience init (day: Int, month: Int, year: Int) throws {
        let createdBirthday = Date.create(day: day, month: month, year: year)
        
        try! self.init(birthday: createdBirthday)
    }
}

class VIPGuest: ClassicGuest {
    init(day: Int, month: Int, year: Int) throws {
        let createdBirthday = Date.create(day: day, month: month, year: year)
        try! super.init(birthday: createdBirthday)
        
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

class ChildGuest: ClassicGuest {
    init(day: Int, month: Int, year: Int) throws {
        let createdBirthday = Date.create(day: day, month: month, year: year)
        try! super.init(birthday: createdBirthday)
     
        if !isUnderFive() {
            // FIXME: Throw error
        }
    }
}
