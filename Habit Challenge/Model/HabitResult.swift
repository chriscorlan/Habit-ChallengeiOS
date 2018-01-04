//
//  HabitResult.swift
//  Habit Challenge
//
//  Created by Chad Wiedemann on 11/15/17.
//  Copyright © 2017 Chad Wiedemann LLC. All rights reserved.
//

import Foundation

class HabitResult {
    
    var habit_id: Int
    var id: Int64
    var is_success: Int?
    var result_date: Int
    
    init(habit_id: Int, id: Int64, result_date: Int) {
        self.habit_id = habit_id
        self.id = id
        self.result_date = result_date
    }

}
