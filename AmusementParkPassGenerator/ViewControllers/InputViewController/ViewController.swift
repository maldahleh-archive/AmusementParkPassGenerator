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
                performSegue(withIdentifier: "toPassTester", sender: entrant)
            }
        } catch let error {
            print(error)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if !(segue.identifier == "toPassTester") { return }
        
        guard let targetViewController = segue.destination as? PassTesterViewController else { return }
        
        guard let entrant = sender as? Entrant else { return }
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

extension Collection {
    subscript (safe index: Index) -> Iterator.Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
