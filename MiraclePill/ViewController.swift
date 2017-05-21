//
//  ViewController.swift
//  MiraclePill
//
//  Created by JAY PATEL on 5/20/17.
//  Copyright © 2017 Jay. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    var states: [String]?
    
    @IBOutlet var btnChooseState: UIButton!
    @IBOutlet var statePicker: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        states = ["Atlanta","California","New York"]
        statePicker.delegate = self
        statePicker.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func stateButtonPressed(_ sender: UIButton) {
        statePicker.isHidden = false
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if let _ = states , let c = states?.count{
            return c
        }
        return 0
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return states?[row]
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        btnChooseState.setTitle(states?[row], for: UIControlState.normal)
        pickerView.isHidden = true
    }
}

