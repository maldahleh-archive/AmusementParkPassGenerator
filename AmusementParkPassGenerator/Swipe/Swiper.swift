//
//  Swiper.swift
//  AmusementParkPassGenerator
//
//  Created by Mohammed Al-Dahleh on 2017-12-06.
//  Copyright © 2017 Mohammed Al-Dahleh. All rights reserved.
//

import Foundation

class Swiper {
    static func processSwipeFor(entrant: Entrant, withSwipeType accessType: GenericAccess) -> (Bool, Int) {
        if entrant.isBirthday() {
            let month = entrant.birthday.dateComponents().month!
            let day = entrant.birthday.dateComponents().day!
            
            print("Today is \(month) \(day), Happy Birthday!")
        }
        
        if let areaAccess = accessType as? AreaAccess {
            let checkResult = checkAreaAccessFor(entrant: entrant, forArea: areaAccess)
            
            return (result: checkResult, secondaryValue: 0)
        }
        
        if let rideAccess = accessType as? RideAccess {
            let checkResult = checkRideAccessFor(entrant: entrant, forLevel: rideAccess)
            
            return (result: checkResult, secondaryValue: 0)
        }
        
        if let discountAccess = accessType as? DiscountAccess {
            let checkResult = checkDiscountsFor(entrant: entrant, forType: discountAccess)
            
            return (result: checkResult.0, secondaryValue: checkResult.1)
        }
        
        fatalError("Unhandled input, this will never occur.")
    }
    
    static func checkAreaAccessFor(entrant: Entrant, forArea accessArea: AreaAccess) -> Bool {
        return entrant.areaAccess.contains(accessArea)
    }
    
    static func checkRideAccessFor(entrant: Entrant, forLevel rideAccess: RideAccess) -> Bool {
        return entrant.rideAccess.contains(rideAccess)
    }
    
    static func checkDiscountsFor(entrant: Entrant, forType discountAccess: DiscountAccess) -> (Bool, Percent) {
        
        
        return (result: false, discount: 0)
    }
}
