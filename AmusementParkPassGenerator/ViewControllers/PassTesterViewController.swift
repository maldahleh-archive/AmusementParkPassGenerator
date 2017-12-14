//
//  PassTesterViewController.swift
//  AmusementParkPassGenerator
//
//  Created by Mohammed Al-Dahleh on 2017-12-10.
//  Copyright © 2017 Mohammed Al-Dahleh. All rights reserved.
//

import UIKit

class PassTesterViewController: UIViewController {
    var soundProvider = SoundProvider()
    var entrant: Entrant!

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    
    @IBOutlet weak var resultsView: UIView!
    @IBOutlet weak var resultsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let entrant = entrant {
            if let seasonGuest = entrant as? SeasonGuest {
                nameLabel.text = seasonGuest.name.fullName
                typeLabel.text = "Season Pass Guest Pass"
                return
            }
            
            if let seniorGuest = entrant as? SeniorGuest {
                nameLabel.text = seniorGuest.name.fullName
                typeLabel.text = "Senior Guest Pass"
                return
            }
            
            if entrant is ClassicGuest {
                nameLabel.text = "Unnamed"
                typeLabel.text = "Guest Pass"
            }
            
            if let hourlyEmployee = entrant as? HourlyEmployee {
                nameLabel.text = hourlyEmployee.name.fullName
                typeLabel.text = "Hourly Employee Pass"
            }
            
            if let contractEmployee = entrant as? ContractEmployee {
                nameLabel.text = contractEmployee.name.fullName
                typeLabel.text = "Contract Employee Pass"
            }
            
            if let manager = entrant as? Manager {
                nameLabel.text = manager.name.fullName
                typeLabel.text = "Manager Pass"
            }
            
            if let vendor = entrant as? Vendor {
                nameLabel.text = vendor.name.fullName
                typeLabel.text = "Vendor Pass"
            }
        }
    }
    
    @IBAction func accessTestButtonTapped(_ sender: UIButton) {
        if !Swiper.allowTimeSwipeFor(entrant) {
            let swipedQuicklyAlert = AlertCreator.createAlertWith(title: "Swiped Too Soon", message: "You have to wait \(Swiper.secondsBetweenSwipes) between swipes.")
            present(swipedQuicklyAlert, animated: true, completion: nil)
            return
        }
        
        if entrant.isBirthday() {
            let birthdayAlert = AlertCreator.createAlertWith(title: "Happy Birthday", message: "It's the entrant's birthday!")
            present(birthdayAlert, animated: true, completion: nil)
        }
        
        var resultString = ""
        switch sender.tag {
        case 0:
            let areaAccess = entrant.swipe(withSwipeType: AreaAccess.amusement)
            for area in areaAccess {
                resultString += "\(area.rawValue), "
            }
        case 1:
            let rideAccess = entrant.swipe(withSwipeType: RideAccess.allRides)
            for ride in rideAccess {
                resultString += "\(ride.rawValue), "
            }
        case 2:
            let discountAccess = entrant.swipe(withSwipeType: DiscountAccess.merchandiseDiscount(discount: 0))
            for discount in discountAccess {
                resultString += "\(discount.name()), "
            }
        default: break
        }
        
        updateResultsWith(resultString: resultString)
        entrant.swiped()
    }
    
    func updateResultsWith(resultString result: String) {
        if result.isEmpty || result == "" {
            soundProvider.playDeniedSound()
            resultsLabel.text = "Denied"
            resultsView.backgroundColor = .red
            return
        }
        
        var cleanedResultText = result
        cleanedResultText.removeLast(2)
        
        soundProvider.playGrantedSound()
        resultsLabel.text = cleanedResultText
        resultsView.backgroundColor = .green
    }
}
