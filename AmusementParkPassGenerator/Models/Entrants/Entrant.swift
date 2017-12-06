//
//  Entrant.swift
//  AmusementParkPassGenerator
//
//  Created by Mohammed Al-Dahleh on 2017-12-06.
//  Copyright © 2017 Mohammed Al-Dahleh. All rights reserved.
//

import Foundation

extension Date {
    static func create(day: Int, month: Int, year: Int) -> Date {
        var dateComponents = DateComponents()
        dateComponents.day = day
        dateComponents.month = month
        dateComponents.year = year
        
        return Calendar.current.date(from: dateComponents)!
    }
}

protocol Entrant: Dateable {
    var areaAccess: [AreaAccess] { get }
    var rideAccess: [RideAccess] { get set }
    var discountAccess: [DiscountAccess] { get set }
}
