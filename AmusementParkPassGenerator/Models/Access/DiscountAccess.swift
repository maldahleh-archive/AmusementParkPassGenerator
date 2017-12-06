//
//  DiscountAccess.swift
//  AmusementParkPassGenerator
//
//  Created by Mohammed Al-Dahleh on 2017-12-05.
//  Copyright © 2017 Mohammed Al-Dahleh. All rights reserved.
//

typealias Percent = Int

enum DiscountAccess: GenericAccess {
    case foodDiscount(discount: Percent)
    case merchandiseDiscount(discount: Percent)
}
