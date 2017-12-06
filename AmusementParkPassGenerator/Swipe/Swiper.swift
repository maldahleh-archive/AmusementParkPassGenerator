//
//  Swiper.swift
//  AmusementParkPassGenerator
//
//  Created by Mohammed Al-Dahleh on 2017-12-06.
//  Copyright © 2017 Mohammed Al-Dahleh. All rights reserved.
//

import Foundation

class Swiper {
    static func processSwipeFor(entrant: Entrant, withSwipeType accessType: GenericAccess) {
        if !Swiper.allowTimeSwipeFor(entrant) {
            print("Sorry, you swiped too soon! You have to wait \(Swiper.secondsBetweenSwipes) between swipes.")
            return
        }
        
        if entrant.isBirthday() {
            let month = entrant.birthday.dateComponents().month!
            let day = entrant.birthday.dateComponents().day!
            
            print("Today is \(month) \(day), Happy Birthday!")
        }
        
        var result: Bool
        if let areaAccess = accessType as? AreaAccess {
            result = checkAreaAccessFor(entrant: entrant, forArea: areaAccess)
        }
        
        if let rideAccess = accessType as? RideAccess {
            result = checkRideAccessFor(entrant: entrant, forLevel: rideAccess)
        }
        
        if let discountAccess = accessType as? DiscountAccess {
            result = checkDiscountsFor(entrant: entrant, forType: discountAccess)
        }
        
        entrant.swiped()
        if result {
            print("You have been granted access!")
        } else {
            print("You were not granted access!")
        }
    }
    
    static func checkAreaAccessFor(entrant: Entrant, forArea accessArea: AreaAccess) -> Bool {
        return entrant.areaAccess.contains(accessArea)
    }
    
    static func checkRideAccessFor(entrant: Entrant, forLevel rideAccess: RideAccess) -> Bool {
        return entrant.rideAccess.contains(rideAccess)
    }
    
    static func checkDiscountsFor(entrant: Entrant, forType discountAccess: DiscountAccess) -> (result: Bool, discount: Percent) {
        
        
        return (result: false, discount: 0)
    }
}

extension Swiper {
    static let secondsBetweenSwipes = 5
    
    static func allowTimeSwipeFor(_ entrant: Entrant) -> Bool {
        guard let lastSwipe = entrant.lastSwipe else {
            return true
        }
        
        let currentDate = Date()
        let elapsedSeconds = Int(currentDate.timeIntervalSince(lastSwipe))
        
        return elapsedSeconds > Swiper.secondsBetweenSwipes
    }
}
