//
//  Entrant.swift
//  AmusementParkPassGenerator
//
//  Created by Mohammed Al-Dahleh on 2017-12-06.
//  Copyright © 2017 Mohammed Al-Dahleh. All rights reserved.
//

import Foundation

protocol Swipeable {
    var lastSwipe: Date? { get set }
    
    func swiped()
}

protocol Entrant: Dateable, Swipeable {
    var areaAccess: [AreaAccess] { get }
    var rideAccess: [RideAccess] { get set }
    var discountAccess: [DiscountAccess] { get set }
    
    func birthday() -> Date
    func isBirthday() -> Bool
}

protocol Employee: Entrant, Nameable, Addressable {}

extension Date {
    static func create(day: Int, month: Int, year: Int) -> Date {
        var dateComponents = DateComponents()
        dateComponents.day = day
        dateComponents.month = month
        dateComponents.year = year
        
        return Calendar.current.date(from: dateComponents)!
    }
}

extension Entrant {
    func birthday() -> Date { return birthday.birthday }
    
    func isBirthday() -> Bool { return birthday.isBirthday() }
}
