//
//  HabitChallengeDB.swift
//  Habit Challenge
//
//  Created by Chad Wiedemann on 11/23/17.
//  Copyright © 2017 Chad Wiedemann LLC. All rights reserved.
//

import Foundation
import SQLite

class HabitChallengeDB {
    static let instance = HabitChallengeDB()
    private let db: Connection?
    
    private let habits = Table("habits")
    private let id = Expression<Int64>("id")
    private let name = Expression<String?>("name")
    private let start_date = Expression<Int64>("start_date")
    
    private let habits_result = Table("habit_result")
    private let habit_id = Expression<Int64>("habit_id")
    private let is_success = Expression<Int64>("is_success")
    private let result_date = Expression<Int64>("result_date")
    
    private init() {
        let path = NSSearchPathForDirectoriesInDomains(
            .documentDirectory, .userDomainMask, true
            ).first!
        
        do {
            db = try Connection("\(path)/HabitChallenge.sqlite3")
        } catch {
            db = nil
            print ("Unable to open database")
        }
        
        createTables()
    }
    
    func createTables() {
        do {
            try db!.run(habits.create(ifNotExists: true) { table in
                table.column(id, primaryKey: .autoincrement)
                table.column(name)
                table.column(start_date)
            })
        } catch {
            print("Unable to create table")
        }
        
        do {
            try db!.run(habits_result.create(ifNotExists: true) { table in
                table.column(id, primaryKey: true)
                table.column(habit_id)
                table.column(is_success)
                table.column(result_date)
            })
        } catch {
            print("Unable to create table")
        }
    }
    
    func addHabit(hname: String, hstart_date: Int64) -> Int64? {
        do {
            let insert = habits.insert(self.name <- hname, self.start_date <- hstart_date)
            let id = try db!.run(insert)
            print(insert.asSQL())
            return id
        } catch {
            print("Insert failed")
            return -1
        }
    }
    
    func addHabitResult(habitID: Int64, his_success: Int64, hstart_date: Int64) -> Int64? {
        do {
            let insert = habits_result.insert(self.habit_id <- habitID, self.result_date <- hstart_date, self.is_success <- his_success)
            let id = try db!.run(insert)
            print(insert.asSQL())
            return id
        } catch {
            print("Insert failed")
            return -1
        }
    }
    
    func getHabits() -> [Habit] {
        var contacts = [Habit]()
        
        do {
            for contact in try db!.prepare(self.habits) {
                contacts.append(Habit(
                    id: Int(contact[id]),
                    habitName: contact[name]!,
                    startDate: Int(contact[start_date])))
            }
        } catch {
            print("Select failed")
        }
        
        return contacts
    }
    
    func getHabitResultsForHabit(_ id: Int) -> [HabitResult] {
        var days = [HabitResult]()
        
        for row in try! db!.prepare("SELECT id, habit_id, is_success, result_date FROM habit_result WHERE habit_id = \(id)"){
            let result = HabitResult(habit_id: Int(row[1] as! Int64), id: row[0]! as! Int64, result_date: Int(row[3]! as! Int64))
            result.is_success = Int(row[2] as! Int64)
            days.append(result)
            
        }
        
        return days
    }
    
    
    func deleteHabit(hid: Int64) -> Bool {
        do {
            let habit = habits.filter(id == hid)
            try db!.run(habit.delete())
            return true
        } catch {
            print("Delete failed")
        }
        return false
    }
    
    func updateHabitResult(habitRid: Int64, successNumber: Int64) {
        let habitR = habits_result.filter(id == habitRid)
        do {
            
            if try db!.run(habitR.update(is_success <- successNumber)) > 0{
                print("updated row")
            }else{
                print("row not found")
            }
        }catch{
            print("update failed: \(error)")
        }
        
        
    }
    
    
}
