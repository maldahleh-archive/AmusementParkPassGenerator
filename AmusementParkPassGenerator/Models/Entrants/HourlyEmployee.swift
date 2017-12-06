//
//  HourlyEmployee.swift
//  AmusementParkPassGenerator
//
//  Created by Mohammed Al-Dahleh on 2017-12-06.
//  Copyright © 2017 Mohammed Al-Dahleh. All rights reserved.
//

import Foundation

class HourlyEmployee: Employee {
    let name: Name
    var birthday: Date
    
    var areaAccess: [AreaAccess]
    var rideAccess: [RideAccess]
    var discountAccess: [DiscountAccess]
    
    init(name: Name, birthday: Date) {
        self.name = name
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
    override init(name: Name, birthday: Date) {
        super.init(name: name, birthday: birthday)
        
        areaAccess.append(contentsOf: [
            .kitchen
        ])
    }
}

class HourlyEmployeeRideServices: HourlyEmployee {
    override init(name: Name, birthday: Date) {
        super.init(name: name, birthday: birthday)
        
        areaAccess.append(contentsOf: [
            .rideControl
        ])
    }
}

class HourlyEmployeeMaintenance: HourlyEmployee {
    override init(name: Name, birthday: Date) {
        super.init(name: nsame, birthday: birthday)
        
        areaAccess.append(contentsOf: [
            .kitchen,
            .rideControl,
            .maintenance,
            .office
        ])
    }
}
