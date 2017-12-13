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
    
    var areaAccess: [AreaAccess]
    var rideAccess: [RideAccess]
    var discountAccess: [DiscountAccess]
    
    init(name: Name, birthday: CreatedDate, address: Address, type: ContractType) {
        self.name = name
        self.birthday = birthday
        self.address = address
        
        areaAccess = type.areaAccess
        rideAccess = []
        discountAccess = []
    }
    
    func swiped() {
        lastSwipe = Date()
    }
}

enum ContractType {
    case oneThousandAndOne
    case oneThousandAndTwo
    case oneThousandAndThree
    case twoThousandAndOne
    case twoThousandAndTwo
}

extension ContractType {
    var areaAccess: [AreaAccess] {
        switch self {
        case .oneThousandAndOne: return [.amusement, .rideControl]
        case .oneThousandAndTwo: return [.amusement, .rideControl, .maintenance]
        case .oneThousandAndThree: return [.amusement, .rideControl, .kitchen, .office, .maintenance]
        case .twoThousandAndOne: return [.office]
        case .twoThousandAndTwo: return [.kitchen, .maintenance]
        }
    }
}
