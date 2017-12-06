//
//  HourlyEmployee.swift
//  AmusementParkPassGenerator
//
//  Created by Mohammed Al-Dahleh on 2017-12-06.
//  Copyright © 2017 Mohammed Al-Dahleh. All rights reserved.
//

import Foundation

class HourlyEmployee: Entrant, Nameable {
    var firstName: String
    var lastName: String
    var birthday: Date
    
    var areaAccess: [AreaAccess]
    var rideAccess: [RideAccess]
    var discountAccess: [DiscountAccess]
    
    init(firstName: String, lastName: String, birthday: Date) {
        self.firstName = firstName
        self.lastName = lastName
        self.birthday = birthday
        
        areaAccess = [
            .amusement
        ]
        
        rideAccess = [
            .allRides
        ]
        
        discountAccess = [
            .foodDiscount(discount: 15),
            .merchandiseDiscount(discount: 25)
        ]
    }
}

class HourlyEmployeeFood: HourlyEmployee {
    override init(firstName: String, lastName: String, birthday: Date) {
        super.init(firstName: firstName, lastName: lastName, birthday: birthday)
        
        areaAccess.append(contentsOf: [
            .kitchen
        ])
    }
}

class HourlyEmployeeRideServices: HourlyEmployee {
    override init(firstName: String, lastName: String, birthday: Date) {
        super.init(firstName: firstName, lastName: lastName, birthday: birthday)
        
        areaAccess.append(contentsOf: [
            .rideControl
        ])
    }
}

class HourlyEmployeeMaintenance: HourlyEmployee {
    override init(firstName: String, lastName: String, birthday: Date) {
        super.init(firstName: firstName, lastName: lastName, birthday: birthday)
        
        areaAccess.append(contentsOf: [
            .kitchen,
            .rideControl,
            .maintenance,
            .office
        ])
    }
}
