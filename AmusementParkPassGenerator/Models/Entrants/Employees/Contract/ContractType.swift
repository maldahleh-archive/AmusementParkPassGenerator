//
//  ContractType.swift
//  AmusementParkPassGenerator
//
//  Created by Mohammed Al-Dahleh on 2017-12-13.
//  Copyright © 2017 Mohammed Al-Dahleh. All rights reserved.
//

enum ContractType: Int {
    case oneThousandAndOne = 0
    case oneThousandAndTwo = 1
    case oneThousandAndThree = 2
    case twoThousandAndOne = 3
    case twoThousandAndTwo = 4
}

extension ContractType {
    var name: String {
        switch self {
        case .oneThousandAndOne: return "1001"
        case .oneThousandAndTwo: return "1002"
        case .oneThousandAndThree: return "1003"
        case .twoThousandAndOne: return "2001"
        case .twoThousandAndTwo: return "2002"
        }
    }
    
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
