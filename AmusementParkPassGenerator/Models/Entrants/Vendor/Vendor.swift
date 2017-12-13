//
//  Vendor.swift
//  AmusementParkPassGenerator
//
//  Created by Mohammed Al-Dahleh on 2017-12-13.
//  Copyright © 2017 Mohammed Al-Dahleh. All rights reserved.
//

import Foundation

class Vendor: Entrant, Nameable {
    var lastSwipe: Date?
    
    var name: Name
    var birthday: CreatedDate
    let vendorType: VendorType
    
    var visitDate: Date
    
    var areaAccess: [AreaAccess]
    var rideAccess: [RideAccess]
    var discountAccess: [DiscountAccess]
    
    init(name: Name, birthday: CreatedDate, type: VendorType) {
        self.name = name
        self.birthday = birthday
        self.vendorType = type
        
        visitDate = Date()
        
        areaAccess = type.areaAccess
        rideAccess = []
        discountAccess = []
    }
    
    func swiped() {
        lastSwipe = Date()
    }
}
