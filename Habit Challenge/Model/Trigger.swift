//
//  Trigger.swift
//  Habit Challenge
//
//  Created by Chad Wiedemann on 5/5/18.
//  Copyright © 2018 Chad Wiedemann LLC. All rights reserved.
//

import Foundation

class Trigger {
    
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    static func add(trigger: Trigger ){
        
        var arr = UserDefaults.standard.array(forKey: "triggers") ?? [String]()
        arr.append(trigger.name)
        UserDefaults.standard.set(arr, forKey: "triggers")
    
    }
    
    static func getAllTriggers() -> [Trigger]{
        let arr = UserDefaults.standard.array(forKey: "triggers") as? [String] ?? [String]()
        
        var triggers = [Trigger]()
        for trigger in arr {
            triggers.append(Trigger(name: trigger))
        }
        return triggers
    }
}
