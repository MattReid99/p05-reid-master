//
//  Globals.swift
//  p05-reid-master
//
//  Created by Matthew Reid on 7/13/19.
//  Copyright © 2019 Matthew Reid. All rights reserved.
//

import Foundation

class Globals {
    
    static var data = [Int]()
    
    static func getData() {
        guard UserDefaults.standard.array(forKey: "data") as? [Int] != nil else {
            return
        }
        self.data = UserDefaults.standard.array(forKey: "data") as! [Int]
    }
    
    static func setData(values: [Int]) {
        self.data = values
    }
    
    static func saveData() {
        UserDefaults.standard.set(data, forKey: "data")
    }
    
}
