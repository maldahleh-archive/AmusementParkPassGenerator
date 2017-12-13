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
            let month = entrant.birthday().dateComponents().month!
            let day = entrant.birthday().dateComponents().day!
            
            print("Today is \(month)/\(day), Happy Birthday!")
        }
        
        var result: (result: Bool, discount: Percent) = (false, 0)
        if let areaAccess = accessType as? AreaAccess {
            result = (checkAreaAccessFor(entrant: entrant, forArea: areaAccess), 0)
        }
        
        if let rideAccess = accessType as? RideAccess {
            result = (checkRideAccessFor(entrant: entrant, forLevel: rideAccess), 0)
        }
        
        if let discountAccess = accessType as? DiscountAccess {
            result = checkDiscountsFor(entrant: entrant, forType: discountAccess)
        }
        
        entrant.swiped()
        if result.result {
            if result.discount == 0 {
                print("You have been granted access!")
            } else {
                print("You have been access to the discount with a percentage of \(result.discount)!")
            }
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
        let discountString = discountAccess.stringName()
        
        for discount in entrant.discountAccess {
            let checkedDiscount = discount.stringName()
            
            if checkedDiscount == discountString {
                switch discount {
                case .foodDiscount(let discount): return (result: true, discount: discount)
                case .merchandiseDiscount(let discount): return (result: true, discount: discount)
                }
            }
        }
        
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
