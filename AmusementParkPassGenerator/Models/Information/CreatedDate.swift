//
//  CreatedDate.swift
//  AmusementParkPassGenerator
//
//  Created by Mohammed Al-Dahleh on 2017-12-13.
//  Copyright © 2017 Mohammed Al-Dahleh. All rights reserved.
//

import Foundation

class CreatedDate {
    let date: Date
    
    init(day: Int, month: Int, year: Int) throws {
        date = Date.create(day: day, month: month, year: year)
    }
}
