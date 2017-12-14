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

extension DiscountAccess {
    func name() -> String {
        switch self {
        case .foodDiscount(let discount): return "\(discount)% Food Discount"
        case .merchandiseDiscount(let discount): return "\(discount)% Merchandise Discount"
        }
    }
    
    func stringName() -> String {
        switch self {
        case .foodDiscount(_): return "FoodDiscount"
        case .merchandiseDiscount(_): return "MerchandiseDiscount"
        }
    }
}
