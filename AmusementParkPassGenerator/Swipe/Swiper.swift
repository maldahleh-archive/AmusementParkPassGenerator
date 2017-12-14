//
//  Swiper.swift
//  AmusementParkPassGenerator
//
//  Created by Mohammed Al-Dahleh on 2017-12-06.
//  Copyright © 2017 Mohammed Al-Dahleh. All rights reserved.
//

import Foundation

class Swiper {
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
