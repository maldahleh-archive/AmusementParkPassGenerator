//
//  ViewController.swift
//  AmusementParkPassGenerator
//
//  Created by Mohammed Al-Dahleh on 2017-12-05.
//  Copyright © 2017 Mohammed Al-Dahleh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Test Case #1 - Demonstrate birthday if testing Dec 6, double swiping and access
        
//        do {
//            let entrant = try ClassicGuest(day: 06, month: 12, year: 2017)
//            Swiper.processSwipeFor(entrant: entrant, withSwipeType: RideAccess.allRides)
//            Swiper.processSwipeFor(entrant: entrant, withSwipeType: RideAccess.skipLines)
//        } catch let error as DataError {
//            print(error.localizedDescription)
//        } catch {
//            fatalError()
//        }
        
        // Test Case #2 - Working child account
        
//        do {
//            let entrant = try ChildGuest(day: 06, month: 12, year: 2013)
//            Swiper.processSwipeFor(entrant: entrant, withSwipeType: RideAccess.allRides)
//        } catch DataError.overAgeOfFive {
//            print("You are too old for this account.")
//        } catch {
//            fatalError()
//        }
        
        // Test Case #3 - Too old for child account
        
//        do {
//            let entrant = try ChildGuest(day: 06, month: 12, year: 2005)
//            Swiper.processSwipeFor(entrant: entrant, withSwipeType: RideAccess.allRides)
//        } catch DataError.overAgeOfFive {
//            print("You are too old for this account.")
//        } catch {
//            fatalError()
//        }
        
        // Test Case #4 - Testing all rides for VIP vs non-VIP
        
//        do {
//            let entrant = try ClassicGuest(day: 06, month: 05, year: 2005)
//            Swiper.processSwipeFor(entrant: entrant, withSwipeType: RideAccess.skipLines)
//        } catch DataError.overAgeOfFive {
//            print("You are too old for this account.")
//        } catch {
//            fatalError()
//        }
//
//        do {
//            let entrant = try VIPGuest(day: 06, month: 05, year: 2005)
//            Swiper.processSwipeFor(entrant: entrant, withSwipeType: RideAccess.skipLines)
//        } catch DataError.overAgeOfFive {
//            print("You are too old for this account.")
//        } catch {
//            fatalError()
//        }

        // Test Case #5 - Missing name and skip lines test
        
//        do {
//            let address = try Address(streetAddress: "Test Road", city: "Mississippi", state: "AL", zipCode: "13056")
//            let name = try Name(firstName: "Test", lastName: "Smith")
//            let entrant = HourlyEmployeeFood(name: name, birthday: Date(), address: address)
//            Swiper.processSwipeFor(entrant: entrant, withSwipeType: RideAccess.skipLines)
//        } catch DataError.missingInformation(let missing) {
//            print("You are missing \(missing).")
//        } catch {
//            fatalError()
//        }
        
        // Test Case #6 - Test food access
        
//        do {
//            let address = try Address(streetAddress: "Test Road", city: "Mississippi", state: "AL", zipCode: "13056")
//            let name = try Name(firstName: "Test", lastName: "Smith")
//            let entrant = HourlyEmployeeFood(name: name, birthday: Date(), address: address)
//            Swiper.processSwipeFor(entrant: entrant, withSwipeType: AreaAccess.kitchen)
//        } catch DataError.missingInformation(let missing) {
//            print("You are missing \(missing).")
//        } catch {
//            fatalError()
//        }
        
        // Test Case #7 - Test manager with missing city
        
//        do {
//            let address = try Address(streetAddress: "Test Road", city: "", state: "AL", zipCode: "13056")
//            let name = try Name(firstName: "Test", lastName: "Smith")
//            let entrant = Manager(name: name, birthday: Date(), address: address)
//            Swiper.processSwipeFor(entrant: entrant, withSwipeType: RideAccess.skipLines)
//        } catch DataError.missingInformation(let missing) {
//            print("You are missing \(missing).")
//        } catch {
//            fatalError()
//        }
        
        // Test Case #8 - Test manager access
        
//        do {
//            let address = try Address(streetAddress: "Test Road", city: "Mississippi", state: "AL", zipCode: "13056")
//            let name = try Name(firstName: "Test", lastName: "Smith")
//            let entrant = Manager(name: name, birthday: Date(), address: address)
//            Swiper.processSwipeFor(entrant: entrant, withSwipeType: AreaAccess.office)
//        } catch DataError.missingInformation(let missing) {
//            print("You are missing \(missing).")
//        } catch {
//            fatalError()
//        }
        
        
        // Test Case #9 - Test discounts
        
//        do {
//            let address = try Address(streetAddress: "Test Road", city: "Mississippi", state: "AL", zipCode: "13056")
//            let name = try Name(firstName: "Test", lastName: "Smith")
//            let entrant = HourlyEmployeeFood(name: name, birthday: Date(), address: address)
//            Swiper.processSwipeFor(entrant: entrant, withSwipeType: DiscountAccess.foodDiscount(discount: -1))
//        } catch DataError.missingInformation(let missing) {
//            print("You are missing \(missing).")
//        } catch {
//            fatalError()
//        }

//        do {
//            let entrant = try ClassicGuest(day: 5, month: 5, year: 1990)
//            Swiper.processSwipeFor(entrant: entrant, withSwipeType: DiscountAccess.foodDiscount(discount: -1))
//        } catch DataError.missingInformation(let missing) {
//            print("You are missing \(missing).")
//        } catch {
//            fatalError()
//        }

    }
}

