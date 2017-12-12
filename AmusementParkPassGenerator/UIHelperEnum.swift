//
//  EntrantUIHelper.swift
//  AmusementParkPassGenerator
//
//  Created by Mohammed Al-Dahleh on 2017-12-12.
//  Copyright © 2017 Mohammed Al-Dahleh. All rights reserved.
//

import Foundation

enum MainEntrantUIBar: Int {
    case guest = 0
    case employee = 1
    case manager = 2
    case contract = 3
    case vendor = 4
}

extension MainEntrantUIBar {
    var secondaryValues: [String] {
        switch self {
        case .guest: return ["Child", "Adult", "VIP", "Senior", "Season"]
        case .employee: return ["Food Services", "Ride Services", "Maintenance"]
        case .manager: return []
        case .contract: return ["1001", "1002", "1003", "2001", "2002"]
        case .vendor: return ["Acme", "Orkin", "Fedex", "NW Electrical"]
        }
    }
}
