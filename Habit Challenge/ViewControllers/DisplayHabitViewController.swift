//
//  DisplayHabitViewController.swift
//  Habit Challenge
//
//  Created by Chad Wiedemann on 11/13/17.
//  Copyright © 2017 Chad Wiedemann LLC. All rights reserved.
//

import UIKit

class DisplayHabitViewController: UIViewController {

    var currentHabit: Habit!
    var habitResults = [HabitResult]()
    let toastDictionary = [1:"Congratulations! Making your first day is the hardest. Go ahead and shoot for day 3.",3:"Great job! You are creating a new habit and breaking an old one. Don’t give up. You can make it to day 7.",7:"Way to go! One week is a wonderful accomplishment. You are creating new neural pathways for your new behavior. Set your sights on day 10.",10:"10 Days is a significant milestone. You are doing great! Don’t get discouraged or weary 2 weeks is right around the corner.",14:"Sensational! The fact that you are checking this day off shows how serious you are. Don’t be discouraged by any set-backs. You are creating new habits and breaking old ones. Let’s go for 21 days!",21:"Excellent! Studies have shown that many new habits are formed in 21 days. Your brain is being rewired and your behavior is being changed. One week left to 28 days!",28:"Tremendous! Congratulations! You have made it to 28 days. Celebrate this!!! Tell someone. This has been proven to be a significant milestone in creating new habits. To really make this stick and not to let your guard down you need to move into relapse prevention mode. Manage your triggers, keep accountable to someone, use your support group. Your next target is day 35.",35:"You are doing fantastic. You new way of life is becoming your new normal. Next goal is day 42.",42:"Marvelous! Keep it up. If you are struggling at all get some help. Don’t give up.",50:"You are doing great! Celebrate. Let someone know how you are doing. Also, don’t let down your guard. Keep doing the things that got you this far. The next target is Day 55.",55:"Outstanding! You are almost at 60 days. You have done a great job. Keep it up. The next goal is day 60.",60:"Congratulations you have completed the 60 day Habit Challenge! Your habit changes are deeply planted in your brain. Continue to do so well. If you begin to get lax, if stress is causing you to become tempted, or a slip gets you down, come back and do another 28-day challenge. The discipline of monitoring will help you reestablish your habit."]
    
    @IBOutlet weak var habitResultsTableView: UITableView!
    @IBOutlet weak var habitNameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib.init(nibName: "HabitResultTableViewCell", bundle: nil)
        habitResultsTableView.register(nib, forCellReuseIdentifier: "resultCell")
        self.habitResultsTableView.delegate = self
        self.habitResultsTableView.dataSource = self
        self.habitResultsTableView.allowsSelection = false
        self.habitNameLabel.text = currentHabit.habitName
       
    }

    @IBAction func deleteHabitButtonPressed(_ sender: Any) {
        navigationController?.popViewController(animated: true)
        if HabitChallengeDB.instance.deleteHabit(hid: self.currentHabit.id){
            print(self.currentHabit.habitName + " deleted!")
        }
    
    }
    

}

extension DisplayHabitViewController: UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.habitResults.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: HabitResultTableViewCell = self.habitResultsTableView.dequeueReusableCell(withIdentifier: "resultCell", for: indexPath) as! HabitResultTableViewCell
        if cell == nil{
            cell = HabitResultTableViewCell.init(style: UITableViewCellStyle.subtitle, reuseIdentifier: "resultCell")
        }
        cell.fileName = "Day" + String(indexPath.row + 1)
        cell.audioType = "mp3"
        if toastDictionary[indexPath.row + 1] != nil{
            cell.toastText = toastDictionary[indexPath.row + 1]!
        }
        cell.currentHabitResult = habitResults[indexPath.row]
        let resultStatus = habitResults[indexPath.row].is_success
        
        switch resultStatus {
        case 0?:
            cell.failButtonOutlet.isSelected = false
            cell.successButtonOutlet.isSelected = false
        case 1?:
            cell.failButtonOutlet.isSelected = true
            cell.successButtonOutlet.isSelected = false
        case 2?:
            cell.failButtonOutlet.isSelected = false
            cell.successButtonOutlet.isSelected = true
        default:
            print("code shouldn't run check cellForRowAt indexPath for bug")
        }
        
        
        
        cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 30)
        cell.resultDateLabel.text =  DateTools.integerToDate(integer: habitResults[indexPath.row].result_date).toString(dateFormat: "MM-dd-yyyy")
        
        
        return cell
    }
    
    
}
