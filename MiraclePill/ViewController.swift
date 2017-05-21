//
//  ViewController.swift
//  MiraclePill
//
//  Created by JAY PATEL on 5/20/17.
//  Copyright © 2017 Jay. All rights reserved.
//

import UIKit

class ViewController: UIViewController, PickerDataDelegate, StatePickerDelegate, CityPickerDelegate {
    
    @IBOutlet var lblCity: UILabel!
    @IBOutlet var btnChooseCity: UIButton!
    @IBOutlet var btnChooseState: UIButton!
    @IBOutlet var statePicker: UIPickerView!
    @IBOutlet var cityPicker: UIPickerView!
    
    var pickerData: PickerData?
    var statePickerData: StatePicker?
    var cityPickerData: CityPicker?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerData = PickerData.init()
        pickerData?.delegate = self
        
        statePickerData = StatePicker.init(picker: statePicker, pickerData: pickerData!)
        statePickerData?.setDelegates(delegate: self)
        
        cityPickerData = CityPicker.init(picker: cityPicker, pickerData: pickerData!)
        cityPickerData?.setDelegates(delegate: self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func stateButtonPressed(_ sender: UIButton) {
        self.lowerViewsHidden(hidden: true)
        statePicker.isHidden = false
    }
    
    @IBAction func cityButtonPressed(_ sender: UIButton) {
        self.lowerViewsHidden(hidden: true)
        cityPicker.isHidden = false
    }
    
    func dataLoadingCompleted() {
        btnChooseState.isEnabled = true
        statePicker.reloadAllComponents()
    }
    
    func selectedState(state: String) {
        if let p = pickerData {
            if (p.selectedState != state) {     // state is changed
                p.selectedState = state
                btnChooseState.setTitle(state, for: UIControlState.normal)
                btnChooseCity.setTitle("Choose your city ...", for: UIControlState.normal)
                cityPicker.reloadAllComponents()
            }
        }
        self.lowerViewsHidden(hidden: false)
    }
    
    func selectedCity(city: String) {
        btnChooseCity.setTitle(city, for: UIControlState.normal)
        self.lowerViewsHidden(hidden: false)
    }
    
    func lowerViewsHidden(hidden: Bool) {
        lblCity.isHidden = hidden
        btnChooseCity.isHidden = hidden
    }
}
