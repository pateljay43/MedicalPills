//
//  StatePicker.swift
//  MiraclePill
//
//  Created by JAY PATEL on 5/20/17.
//  Copyright © 2017 Jay. All rights reserved.
//

import UIKit

class StatePicker : NSObject, UIPickerViewDelegate, UIPickerViewDataSource {
    private var pickerData: PickerData
    private var picker: UIPickerView
    private var states: [String]
    var selectedState: String
    var delegate: StatePickerDelegate?
    
    init(picker: UIPickerView, pickerData: PickerData) {
        self.picker = picker
        self.pickerData = pickerData
        states = [String]()
        selectedState = String()
    }
    
    func setDelegates(delegate: StatePickerDelegate){
        self.picker.delegate = self
        self.picker.dataSource = self
        self.delegate = delegate
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return states[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        states = pickerData.getStates()
        return states.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedState = states[row]
        if let d = delegate {
            d.selectedState(state: selectedState)
        }
        pickerView.isHidden = true
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
}

protocol StatePickerDelegate {
    func selectedState(state: String)
}
