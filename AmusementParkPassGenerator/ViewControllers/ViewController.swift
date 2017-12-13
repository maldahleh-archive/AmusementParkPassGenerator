//
//  ViewController.swift
//  AmusementParkPassGenerator
//
//  Created by Mohammed Al-Dahleh on 2017-12-05.
//  Copyright © 2017 Mohammed Al-Dahleh. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    let selectionHandler = SelectionHandler()
    var moveViewForKeyboard = false
    
    @IBOutlet var mainBarButtons: [UIButton]!
    @IBOutlet var secondaryBarButtons: [UIButton]!
    @IBOutlet weak var secondaryRoleBar: UIView!
    
    @IBOutlet weak var dobLabel: UILabel!
    @IBOutlet weak var dobTextField: UITextField!
    @IBOutlet weak var ssnLabel: UILabel!
    @IBOutlet weak var ssnTextField: UITextField!
    
    @IBOutlet weak var projectNoLabel: UILabel!
    @IBOutlet weak var projectNoTextField: UITextField!
    @IBOutlet weak var companyLabel: UILabel!
    @IBOutlet weak var companyTextField: UITextField!
    
    @IBOutlet var nameLabels: [UILabel]!
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    
    @IBOutlet var addressLabels: [UILabel]!
    @IBOutlet weak var streetAddressTextField: UITextField!
    @IBOutlet weak var cityTextField: UITextField!
    @IBOutlet weak var stateTextField: UITextField!
    @IBOutlet weak var zipTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setSelfAsDelegateFor([streetAddressTextField, cityTextField, stateTextField, zipTextField])
        
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.keyboardWillShow(_:)), name: Notification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.keyboardWillHide(_:)), name: Notification.Name.UIKeyboardWillHide, object: nil)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        NotificationCenter.default.removeObserver(self)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    @IBAction func populateDataButtonTaped(_ sender: Any) {
        populateData()
    }
    
    // MARK: Role bars
    @IBAction func entrantGroupButtonTapped(_ sender: UIButton) {
        if let mainBarSelection = MainBarSelection(rawValue: sender.tag) {
            reset()
            
            selectionHandler.mainBarSelection = mainBarSelection
            selectionHandler.secondarySelection = 0
            
            updateSecodaryBarWith(mainBarSelection)
            updateFieldInteractivityFor(selectionHandler.mainBarSelection, withSecondarySelection: selectionHandler.secondarySelection)
        }
    }
    
    @IBAction func secondaryBarButtonTapped(_ sender: UIButton) {
        reset()
        
        selectionHandler.secondarySelection = sender.tag
        setButtonSelectedWithTag(sender.tag)
        
        updateFieldInteractivityFor(selectionHandler.mainBarSelection, withSecondarySelection: selectionHandler.secondarySelection)
    }
    
    func setButtonSelectedWithTag(_ tag: Int) {
        for button in secondaryBarButtons {
            let selected = (button.tag == tag)
            
            setSelectedTo(selected, for: button, withType: .secondary)
        }
    }
    
    func updateSecodaryBarWith(_ role: MainBarSelection) {
        secondaryRoleBar.isHidden = false
        updateMainButtonsFor(role)
        
        if role == .manager {
            secondaryRoleBar.isHidden = true
            return
        }
        
        var secondaryRoleBarValues = role.secondaryValues
        var isInitial: Bool? = nil
        
        for button in secondaryBarButtons {
            if !secondaryRoleBarValues.isEmpty {
                button.isHidden = false
                button.setTitle(secondaryRoleBarValues[0], for: .normal)
                
                if isInitial == nil {
                    setSelectedTo(true, for: button, withType: .secondary)
                    isInitial = false
                } else {
                    setSelectedTo(false, for: button, withType: .secondary)
                }
                
                secondaryRoleBarValues.remove(at: 0)
            } else {
                button.isHidden = true
            }
        }
    }
    
    // MARK: UI enabling/disabling
    func updateFieldInteractivityFor(_ entrant: MainBarSelection, withSecondarySelection selection: Int) {
        var labelsToActivate: [UILabel] = []
        var fieldsToActivate: [UITextField] = []
        
        func addNameInformation() {
            labelsToActivate += nameLabels
            fieldsToActivate += [firstNameTextField, lastNameTextField]
        }
        
        func addAddressInformation() {
            labelsToActivate += addressLabels
            fieldsToActivate += [streetAddressTextField, cityTextField, stateTextField, zipTextField]
        }
        
        switch entrant {
        case .guest where selection == 3, .vendor:
            addNameInformation()
        case .guest where selection == 4, .employee, .manager, .contract:
            addNameInformation()
            addAddressInformation()
        default: return
        }
        
        if entrant == .vendor {
            setEnabledTo(true, for: [companyLabel, companyTextField])
            
            companyTextField.text = entrant.secondaryValues[selection]
            companyTextField.isEnabled = false
        } else if entrant == .contract {
            setEnabledTo(true, for: [projectNoLabel, projectNoTextField])
            
            projectNoTextField.text = entrant.secondaryValues[selection]
            projectNoTextField.isEnabled = false
        }
        
        setEnabledTo(true, for: labelsToActivate)
        setEnabledTo(true, for: fieldsToActivate)
    }
    
    func updateMainButtonsFor(_ selection: MainBarSelection) {
        for button in mainBarButtons {
            let selected = (button.tag == selection.rawValue)
            
            setSelectedTo(selected, for: button, withType: .main)
        }
    }
    
    func reset() {
        let resetFields: [UITextField] = [dobTextField, ssnTextField, projectNoTextField, companyTextField, firstNameTextField, lastNameTextField, streetAddressTextField, cityTextField, stateTextField, zipTextField]
        let resetLabels = [dobLabel, ssnLabel, companyLabel, projectNoLabel] + nameLabels + addressLabels
        
        clearTextFor(resetFields)
        setEnabledTo(false, for: resetFields)
        setEnabledTo(false, for: resetLabels)
        
        let keepEnabled: [AnyObject] = [dobTextField, dobLabel, ssnTextField, ssnLabel]
        setEnabledTo(true, for: keepEnabled)
    }
    
    // MARK: Keyboard
    func textFieldDidBeginEditing(_ textField: UITextField) {
        moveViewForKeyboard = true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextFieldDidEndEditingReason) {
        moveViewForKeyboard = false
    }
    
    @objc func keyboardWillShow(_ notification: Notification) {
        if let info = notification.userInfo, let keyboardFrame = info[UIKeyboardFrameEndUserInfoKey] as? NSValue {
            let frame = keyboardFrame.cgRectValue
            
            if moveViewForKeyboard {
                self.view.frame.origin.y = 0
                
                let newConstant = self.view.frame.origin.y + self.view.frame.height - frame.size.height
                self.view.frame.origin.y -= self.view.frame.height - newConstant
            
                UIView.animate(withDuration: 0.8) {
                    self.view.layoutIfNeeded()
                }
            }
        }
    }
    
    @objc func keyboardWillHide(_ notification: NSNotification) {
        if moveViewForKeyboard {
            self.view.frame.origin.y = 0
                
            UIView.animate(withDuration: 0.8) {
                self.view.layoutIfNeeded()
            }
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    // MARK: Entrant creation
    @IBAction func createEntrantButtonTapped(_ sender: Any) {
        do {
            if let entrant = try createEntrant() {
                print(entrant)
            }
        } catch let error {
            print(error)
        }
    }
    
    func createEntrant() throws -> Entrant? {
        var name: Name?
        var birthday: CreatedDate?
        var address: Address?
        
        let contractType = ContractType(rawValue: selectionHandler.secondarySelection)
        let vendorType = VendorType(rawValue: selectionHandler.secondarySelection)
        
        let splitDate = dobTextField.text?.split(separator: "/")
        
        do {
            if let splitDate = splitDate, let dayObj = splitDate[safe: 1], let day = Int(dayObj), let monthObj = splitDate[safe: 0], let month = Int(monthObj), let yearObj = splitDate[safe: 2], let year = Int(yearObj) {
                birthday = try CreatedDate(day: day, month: month, year: year)
            } else {
                throw DataError.invalidDate
            }
        } catch let error {
            throw error
        }
        
        if firstNameTextField.isEnabled {
            if let firstName = firstNameTextField.text, let lastName = lastNameTextField.text {
                do {
                    name = try Name(firstName: firstName, lastName: lastName)
                } catch let error {
                    throw error
                }
            } else {
                throw DataError.missingInformation(missing: "Name")
            }
        }
        
        if streetAddressTextField.isEnabled {
            if let streetAddress = streetAddressTextField.text, let city = cityTextField.text, let state = stateTextField.text, let zipCode = zipTextField.text {
                do {
                    address = try Address(streetAddress: streetAddress, city: city, state: state, zipCode: zipCode)
                } catch let error {
                    throw error
                }
            } else {
                throw DataError.missingInformation(missing: "Address")
            }
        }
        
        switch selectionHandler.mainBarSelection {
        case .guest:
            switch selectionHandler.secondarySelection {
            case 0:
                let guest = ChildGuest(birthday: birthday!)
                if !guest.isUnderFive() { throw DataError.overAgeOfFive }
                
                return guest
            case 1: return ClassicGuest(birthday: birthday!)
            case 2: return VIPGuest(birthday: birthday!)
            case 3: return SeniorGuest(name: name!, birthday: birthday!)
            case 4: return SeasonGuest(name: name!, address: address!, birthday: birthday!)
            default: return nil
            }
        case .employee:
            switch selectionHandler.secondarySelection {
            case 0: return HourlyEmployeeFood(name: name!, birthday: birthday!, address: address!)
            case 1: return HourlyEmployeeRideServices(name: name!, birthday: birthday!, address: address!)
            case 2: return HourlyEmployeeMaintenance(name: name!, birthday: birthday!, address: address!)
            default: return nil
            }
        case .manager: return Manager(name: name!, birthday: birthday!, address: address!)
        case .contract: return ContractEmployee(name: name!, birthday: birthday!, address: address!, type: contractType!)
        case .vendor: return Vendor(name: name!, birthday: birthday!, type: vendorType!)
        }
    }
}

extension ViewController {
    enum ButtonType {
        case main
        case secondary
    }
    
    func setSelfAsDelegateFor(_ fields: [UITextField]) {
        for field in fields {
            field.delegate = self
        }
    }
    
    func clearTextFor(_ fields: [UITextField]) {
        for field in fields {
            field.text = ""
        }
    }
    
    func setEnabledTo(_ enabled: Bool, for objects: [AnyObject]) {
        for object in objects {
            if let textField = object as? UITextField {
                setEnabledTo(enabled, for: textField)
            }
            
            if let label = object as? UILabel {
                setEnabledTo(enabled, for: label)
            }
        }
    }
    
    func setSelectedTo(_ selected: Bool, for button: UIButton, withType type: ButtonType) {
        switch type {
        case .main:
            if selected {
                button.setTitleColor(Colours.mainBarEnabledColour, for: .normal)
            } else {
                button.setTitleColor(Colours.mainBarDisabledColour, for: .normal)
            }
        case .secondary:
            if selected {
                button.setTitleColor(Colours.secondaryBarEnabledColour, for: .normal)
            } else {
                button.setTitleColor(Colours.secondaryBarDisabledColour, for: .normal)
            }
        }
    }
    
    func setEnabledTo(_ enabled: Bool, for field: UITextField) {
        field.isEnabled = enabled
        
        if enabled {
            field.backgroundColor = .white
        } else {
            field.backgroundColor = Colours.mainBackgroundColour
        }
    }
    
    func setEnabledTo(_ enabled: Bool, for label: UILabel) {
        if enabled {
            label.textColor = Colours.enabledLabelColour
        } else {
            label.textColor = Colours.disabledLabelColour
        }
    }
}

extension ViewController {
    // Populated with random data retrieved from random address generator
    func populateData() {
        var dobYear = "1990"
        
        if selectionHandler.mainBarSelection == .guest {
            switch selectionHandler.secondarySelection {
            case 0: dobYear = "2016"
            case 3: dobYear = "1942"
            default: break
            }
        }
        
        dobTextField.text = "10/05/\(dobYear)"
        ssnTextField.text = "613-42-9837"
        
        if firstNameTextField.isEnabled {
            firstNameTextField.text = "Eric"
            lastNameTextField.text = "Morse"
        }
        
        if streetAddressTextField.isEnabled {
            streetAddressTextField.text = "70 Bowman St"
            cityTextField.text = "South Windsor"
            stateTextField.text = "CT"
            zipTextField.text = "06074"
        }
    }
}

extension Collection where Indices.Iterator.Element == Index {
    subscript (safe index: Index) -> Iterator.Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
