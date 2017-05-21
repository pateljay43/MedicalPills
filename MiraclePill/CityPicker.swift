//
//  CityPicker.swift
//  MiraclePill
//
//  Created by JAY PATEL on 5/20/17.
//  Copyright © 2017 Jay. All rights reserved.
//

import UIKit

class CityPicker: NSObject, UIPickerViewDataSource, UIPickerViewDelegate {
    private var pickerData: PickerData
    private var picker: UIPickerView
    private var cities: [String]
    var selectedCity: String
    var delegate: CityPickerDelegate?
    
    init(picker: UIPickerView, pickerData: PickerData) {
        self.picker = picker
        self.pickerData = pickerData
        cities = [String]()
        selectedCity = String()
    }
    
    func setDelegates(delegate: CityPickerDelegate){
        self.picker.delegate = self
        self.picker.dataSource = self
        self.delegate = delegate
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return cities[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        cities = pickerData.getCities()
        return cities.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedCity = cities[row]
        if let d = delegate {
            d.selectedCity(city: selectedCity)
        }
        pickerView.isHidden = true
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
}

protocol CityPickerDelegate {
    func selectedCity(city: String)
}
