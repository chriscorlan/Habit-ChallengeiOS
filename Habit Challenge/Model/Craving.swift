//
//  Craving.swift
//  Habit Challenge
//
//  Created by Chad Wiedemann on 4/28/18.
//  Copyright © 2018 Chad Wiedemann LLC. All rights reserved.
//

import Foundation

class Craving {
    
    var name: String
    var intensity: Int
    
    init(name: String, intensity: Int ) {
        self.name = name
        self.intensity = intensity
    }
    
    static func add(craving: Craving ){
        
        var arr = UserDefaults.standard.array(forKey: "cravings") ?? [String]()
        arr.append(craving.name + String(craving.intensity))
        UserDefaults.standard.set(arr, forKey: "cravings")
        
        
    }
    
    static func getAllCravings() -> [Craving]{
        let arr = UserDefaults.standard.array(forKey: "cravings") as? [String] ?? [String]()
    
        var cravings = [Craving]()
        for craving in arr {
            cravings.append(Craving.init(name: String(craving.prefix(craving.count - 1)), intensity: Int((craving.last?.description)!)!))
        }
        return cravings
    }
}
