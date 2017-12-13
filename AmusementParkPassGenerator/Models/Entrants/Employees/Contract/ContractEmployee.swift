//
//  ContractEmployee.swift
//  AmusementParkPassGenerator
//
//  Created by Mohammed Al-Dahleh on 2017-12-13.
//  Copyright © 2017 Mohammed Al-Dahleh. All rights reserved.
//

import Foundation

class ContractEmployee: Employee {
    var lastSwipe: Date?
    
    var name: Name
    var birthday: CreatedDate
    var address: Address
    let contractType: ContractType
    
    var areaAccess: [AreaAccess]
    var rideAccess: [RideAccess]
    var discountAccess: [DiscountAccess]
    
    init(name: Name, birthday: CreatedDate, address: Address, type: ContractType) {
        self.name = name
        self.birthday = birthday
        self.address = address
        self.contractType = contractType
        
        areaAccess = type.areaAccess
        rideAccess = []
        discountAccess = []
    }
    
    func swiped() {
        lastSwipe = Date()
    }
}
