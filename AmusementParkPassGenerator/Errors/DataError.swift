//
//  DataError.swift
//  AmusementParkPassGenerator
//
//  Created by Mohammed Al-Dahleh on 2017-12-06.
//  Copyright © 2017 Mohammed Al-Dahleh. All rights reserved.
//

enum DataError: Error {
    case missingInformation(missing: String)
    case overAgeOfFive
}
