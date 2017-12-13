//
//  VendorType.swift
//  AmusementParkPassGenerator
//
//  Created by Mohammed Al-Dahleh on 2017-12-13.
//  Copyright © 2017 Mohammed Al-Dahleh. All rights reserved.
//

enum VendorType: Int {
    case acme = 0
    case orkin
    case fedex
    case nwElectrical
}

extension VendorType {
    var name: String {
        switch self {
        case .acme: return "Acme"
        case .orkin: return "Orkin"
        case .fedex: return "Fedex"
        case .nwElectrical: return "NW Electrical"
        }
    }
    
    var areaAccess: [AreaAccess] {
        switch self {
        case .acme: return [.kitchen]
        case .orkin: return [.amusement, .rideControl, .kitchen]
        case .fedex: return [.maintenance, .office]
        case .nwElectrical: return [.amusement, .rideControl, .kitchen, .maintenance, .office]
        }
    }
}
