//
//  Habit.swift
//  Habit Challenge
//
//  Created by Chad Wiedemann on 11/15/17.
//  Copyright © 2017 Chad Wiedemann LLC. All rights reserved.
//

import Foundation

class Habit {
    
    var habitName: String
    var startDate: Int64
    var id: Int64
    var days = [HabitResult]()
    
    init(id: Int, habitName: String, startDate: Int) {
        self.habitName = habitName
        self.startDate = Int64(startDate)
        self.id = Int64(id)
        
    }
}
