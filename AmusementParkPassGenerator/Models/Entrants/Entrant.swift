//
//  Entrant.swift
//  AmusementParkPassGenerator
//
//  Created by Mohammed Al-Dahleh on 2017-12-06.
//  Copyright © 2017 Mohammed Al-Dahleh. All rights reserved.
//

protocol Entrant {
    var areaAccess: [AreaAccess] { get }
    var rideAccess: [RideAccess] { get }
    var discountAccess: [DiscountAccess] { get set }
}
