//
//  ContractType.swift
//  AmusementParkPassGenerator
//
//  Created by Mohammed Al-Dahleh on 2017-12-13.
//  Copyright © 2017 Mohammed Al-Dahleh. All rights reserved.
//

enum ContractType: String {
    case oneThousandAndOne = "1001"
    case oneThousandAndTwo = "1002"
    case oneThousandAndThree = "1003"
    case twoThousandAndOne = "2001"
    case twoThousandAndTwo = "2002"
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
