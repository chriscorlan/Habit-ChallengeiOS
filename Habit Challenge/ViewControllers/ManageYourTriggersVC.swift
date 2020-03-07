//
//  ManageYourTriggersVC.swift
//  Habit Challenge
//
//  Created by Chad Wiedemann on 4/28/18.
//  Copyright © 2018 Chad Wiedemann LLC. All rights reserved.
//

import UIKit

class ManageYourTriggersVC: UIViewController {

    var triggers = [Trigger]()
    var selectedTriggerIndex = 0
    @IBOutlet weak var triggersTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        triggers = Trigger.getAllTriggers()
        
    }

    @IBAction func addATriggerButtonPressed(_ sender: Any) {
        let alert = UIAlertController(title: "Input Trigger Name", message: "", preferredStyle: .alert)
        let cancel = UIAlertAction(title: "Cancel", style: .destructive, handler: { (action) -> Void in
            
            
        })
        alert.addTextField(configurationHandler: nil)
        alert.addAction(cancel)
        alert.addAction(UIAlertAction.init(title: "Okay", style: .cancel, handler: { (action) in
            if let textField = alert.textFields?.first{
                Trigger.add(trigger: Trigger(name: textField.text ?? ""))
                self.triggers = Trigger.getAllTriggers()
                self.triggersTableView.reloadData()
            }
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func deleteButtonPressed(_ sender: Any) {
        if !triggers.isEmpty {
            triggers.remove(at: selectedTriggerIndex)
            (selectedTriggerIndex == 0) ? (selectedTriggerIndex = 0) : (selectedTriggerIndex = selectedTriggerIndex - 1)
            var arr = [String]()
            for trigger in triggers {
                arr.append(trigger.name)
            }
            UserDefaults.standard.set(arr, forKey: "triggers")
            self.triggersTableView.reloadData()
        }
    }
}

extension ManageYourTriggersVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return triggers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: UITableViewCell! = tableView.dequeueReusableCell(withIdentifier: "identifier")
        if cell == nil{
            cell = UITableViewCell.init(style: UITableViewCellStyle.subtitle, reuseIdentifier: "identifier")
        }
        cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        cell.textLabel?.text = triggers[indexPath.row].name
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedTriggerIndex = indexPath.row
    }
}
