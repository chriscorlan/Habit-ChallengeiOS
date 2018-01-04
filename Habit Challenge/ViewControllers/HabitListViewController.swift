//
//  HabitListViewController.swift
//  Habit Challenge
//
//  Created by Chad Wiedemann on 11/13/17.
//  Copyright © 2017 Chad Wiedemann LLC. All rights reserved.
//

import UIKit

class HabitListViewController: UIViewController{
    

    @IBOutlet weak var habitTableView: UITableView!
    var yourHabits = HabitChallengeDB.instance.getHabits()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        let habit1 = Habit(id: 1, habitName: "eating vegies", startDate: 1234)
//        let habit2 = Habit(id: 2, habitName: "running", startDate: 12345)
//        let habit3 = Habit(id: 3, habitName: "no smoking", startDate: 1234)
//        yourHabits.append(habit1)
//        yourHabits.append(habit2)
//        yourHabits.append(habit3)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        yourHabits = HabitChallengeDB.instance.getHabits()
        self.habitTableView.reloadData()
    }

    @IBAction func goToCreateNewHabit(_ sender: Any) {
        
        let newController = NewHabitViewController()
        
        self.navigationController?.pushViewController(newController, animated: true)
        
    }
    
    
    
}

extension HabitListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.yourHabits.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: UITableViewCell! = tableView.dequeueReusableCell(withIdentifier: "identifier")
        if cell == nil{
            cell = UITableViewCell.init(style: UITableViewCellStyle.subtitle, reuseIdentifier: "identifier")
        }
        let habit = yourHabits[indexPath.row]
        cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        cell.textLabel?.text = habit.habitName
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let newDisplayHabitController = DisplayHabitViewController()
        newDisplayHabitController.currentHabit = yourHabits[indexPath.row]
       newDisplayHabitController.habitResults = HabitChallengeDB.instance.getHabitResultsForHabit(Int(yourHabits[indexPath.row].id))
    navigationController?.pushViewController(newDisplayHabitController, animated: true)
    }
    
    
}
