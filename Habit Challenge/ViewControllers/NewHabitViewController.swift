//
//  NewHabitViewController.swift
//  Habit Challenge
//
//  Created by Chad Wiedemann on 11/13/17.
//  Copyright © 2017 Chad Wiedemann LLC. All rights reserved.
//

import UIKit
import SQLite

class NewHabitViewController: UIViewController {

    @IBOutlet weak var habitNameTextView: UITextField!
    @IBOutlet weak var habitDaysPickerView: UIPickerView!
    var pickerData = ["Choose Habit Length","10 Day Habit", "21 Day Habit", "28 Day Habit", "60 Day Habit"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        habitDaysPickerView.hideKeyboardWhenTappedAround()
        habitDaysPickerView.delegate = self
        habitDaysPickerView.dataSource = self
        
    }

   
    
    @IBAction func cancelButtonPressed(_ sender: Any) {
        
        
        
        
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func saveButtonPressed(_ sender: Any) {
        var daysInHabit = 0
        switch self.habitDaysPickerView.selectedRow(inComponent: 0) {
        case 0:
            let alert = UIAlertController.init(title: "", message: "Please select desired length before saving Habit", preferredStyle: UIAlertControllerStyle.alert)
            let yesButton = UIAlertAction.init(title: "okay", style: UIAlertActionStyle.default) { alert in
            }
            alert.addAction(yesButton)
            self.present(alert, animated: true, completion: nil)
            return
        case 1:
            daysInHabit = 10
        case 2:
            daysInHabit = 21
        case 3:
            daysInHabit = 28
        default:
            daysInHabit = 60
        }
        
        
        let newHabitID = HabitChallengeDB.instance.addHabit(hname: self.habitNameTextView.text ?? "", hstart_date: Int64(DateTools.dateToInteger(date: Date())))
        if let newHabitID = newHabitID{
            createHabitResults(daysInHabit, id: Int(newHabitID))
        }
        
        
        
        self.navigationController?.popViewController(animated: true)
    }
    
    func createHabitResults(_ length: Int, id: Int) {
        
        for (i) in 1...length {
            let dateToAdd = Calendar.current.date(byAdding: .day, value: (i-1), to: Date())
            _ = HabitChallengeDB.instance.addHabitResult(habitID: Int64(id), his_success: 0, hstart_date: Int64(DateTools.dateToInteger(date: dateToAdd!)))
        }
    }

}

extension NewHabitViewController: UIPickerViewDelegate, UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return self.pickerData[row]
    }
    
}
