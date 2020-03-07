//
//  DateTools.swift
//  Habit Challenge
//
//  Created by Chad Wiedemann on 11/23/17.
//  Copyright © 2017 Chad Wiedemann LLC. All rights reserved.
//

import Foundation

class DateTools {
    
    static func dateToInteger(date: Date) -> Int {
        // convert Date to TimeInterval (typealias for Double)
        let timeInterval = date.timeIntervalSince1970
        
        // convert to Integer
        return Int(timeInterval)
    }
    
    static func integerToDate(integer: Int) -> Date {
        // convert Int to Double
        let timeInterval = Double(integer)
        
        // create NSDate from Double (NSTimeInterval)
        return Date(timeIntervalSince1970: timeInterval)
    }
    
}
