//
//  DataError.swift
//  AmusementParkPassGenerator
//
//  Created by Mohammed Al-Dahleh on 2017-12-06.
//  Copyright © 2017 Mohammed Al-Dahleh. All rights reserved.
//

enum DataError: Error {
    case missingInformation(missing: String)
    case invalidDate
    case zipIncorrectLength
    case zipNotNumber
    case stateLengthError
    case overAgeOfFive
}

extension DataError {
    var title: String {
        switch self {
        case .missingInformation(let description): return "\(description) Error"
        case .invalidDate: return "Invalid Date"
        case .zipIncorrectLength: return "Zip Incorrect Length"
        case .zipNotNumber: return "Invaliz Zip"
        case .stateLengthError: return "Invalid State"
        case .overAgeOfFive: return "Too Old"
        }
    }
    
    var description: String {
        switch self {
        case .missingInformation(let description): return "Please fill out the \(description) field."
        case .invalidDate: return "Date entered is incorrect."
        case .zipNotNumber: return "A Zip Code has to be a number."
        case .zipIncorrectLength: return "A Zip Code must be five numbers."
        case .stateLengthError: return "A state must be two characters."
        case .overAgeOfFive: return "A child must be under the age of five."
        }
    }
}
