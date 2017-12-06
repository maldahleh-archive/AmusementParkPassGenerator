//
//  Birthdayable.swift
//  AmusementParkPassGenerator
//
//  Created by Mohammed Al-Dahleh on 2017-12-06.
//  Copyright © 2017 Mohammed Al-Dahleh. All rights reserved.
//

import Foundation

extension Date {
    func ageComponents() -> DateComponents {
        let currentDate = Date()
        let calendar = Calendar.current
        
        let ageComponents = calendar.dateComponents([.day, .month, .year], from: self, to: currentDate)
        return ageComponents
    }
    
    func dateComponents() -> DateComponents {
        let calendar = Calendar.current
        let dateComponents = calendar.dateComponents([.day, .month, .year], from: self)
        
        return dateComponents
    }
}

protocol Dateable {
    var birthday: Date { get set }
    
    func isBirthday() -> Bool
    func isUnderFive() -> Bool
}

extension Dateable {
    func isBirthday() -> Bool {
        let currentDate = Date()
        let currentDateComponents = currentDate.dateComponents()
        let birthdayComponents = birthday.dateComponents()
        
        guard let currentDay = currentDateComponents.day, let currentMonth = currentDateComponents.month, let birthdayDay = birthdayComponents.day, let birthdayMonth = birthdayComponents.month else {
            fatalError("Unexpected date error")
        }
        
        return currentDay == birthdayDay && currentMonth == birthdayMonth
    }
    
    func isUnderFive() -> Bool {
        let ageComponents = birthday.ageComponents()
        
        guard let age = ageComponents.year else {
            fatalError("Unexpected date error")
        }
        
        return age < 5
    }
}
