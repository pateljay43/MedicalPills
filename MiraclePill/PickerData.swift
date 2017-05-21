//
//  PickerData.swift
//  MiraclePill
//
//  Created by JAY PATEL on 5/20/17.
//  Copyright © 2017 Jay. All rights reserved.
//

import Foundation

class PickerData : NSObject, NSURLConnectionDataDelegate {
    private var urlConnection: NSURLConnection?
    private var states: [String]?
    private var dic: Dictionary<String, Array<String>>?
    var selectedState: String?
    var delegate: PickerDataDelegate?
    
    override init() {
        super.init()
        if let u = URL.init(string: "https://raw.githubusercontent.com/pateljay43/US-states-and-cities-json/c6ecb783c14b329918d9b1cd2f31634b1a76ecc1/data.json") {
            urlConnection = NSURLConnection(request: URLRequest.init(url: u), delegate: self, startImmediately: true)
        }
        states = [String]()
        dic = Dictionary()
    }
    
    func connection(_ connection: NSURLConnection, didReceive data: Data) {
        do{
            let json = try (JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers) as! Dictionary<String, Array<String>>)
            
            for (key, values) in json {
                dic?[key] = values
            }
            states = dic?.keys.sorted()
        } catch {
            print("Error parsing data")
        }
        if let d = delegate{
            d.dataLoadingCompleted()
        }
    }
    
    func getCities() -> [String] {
        if let s = selectedState, let c = dic?[s]?.sorted(){
            return c
        }
        return []
    }
    
    func getStates() -> [String] {
        if let s = states {
            return s
        }
        return []
    }
}


protocol PickerDataDelegate {
    
    func dataLoadingCompleted()
}
