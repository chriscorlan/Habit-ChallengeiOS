//
//  MenuViewController.swift
//  Habit Challenge
//
//  Created by Chad Wiedemann on 12/28/17.
//  Copyright © 2017 Chad Wiedemann LLC. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {
    var cells = [UITableViewCell]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.tintColor = UIColor.white
        self.navigationController?.navigationBar.barTintColor = UIColor(red: (63/255), green: (81/255), blue: (181/255), alpha: 1.0)
        let cell1 = UITableViewCell.init(style: .default, reuseIdentifier: "cell")
        cell1.textLabel?.text = "Daily Reminder"
        let cell2 = UITableViewCell.init(style: .default, reuseIdentifier: "cell")
        cell2.textLabel?.text = "About us"
        let cell3 = UITableViewCell.init(style: .default, reuseIdentifier: "cell")
        cell3.textLabel?.text = "Settings"
        let cell4 = UITableViewCell.init(style: .default, reuseIdentifier: "cell")
        cell4.textLabel?.text = "Products"
        let cell5 = UITableViewCell.init(style: .default, reuseIdentifier: "cell")
        cell5.textLabel?.text = "Support our mission"
        let cell6 = UITableViewCell.init(style: .default, reuseIdentifier: "cell")
        cell6.textLabel?.text = "Contact us"
        cells.append(cell1)
        cells.append(cell2)
        cells.append(cell3)
        cells.append(cell4)
        cells.append(cell5)
        cells.append(cell6)
        
        
        
        
    }


}

extension MenuViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return cells[indexPath.row]
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        switch cells[indexPath.row].textLabel?.text {
        case "Daily Reminder"?:
            let controller = DailyReminderVC()
            self.navigationController?.pushViewController(controller, animated: true)
            return
        case "About us"?:
            let controller = AboutUsVC()
            self.navigationController?.pushViewController(controller, animated: true)
            return
        case "Settings"?:
            let controller = SettingsVC()
            self.navigationController?.pushViewController(controller, animated: true)
            return
        case "Products"?:
            let controller = ProductsVC()
            self.navigationController?.pushViewController(controller, animated: true)
            return
        case "Support our mission"?:
            let controller = SupportOurMissionVC()
            self.navigationController?.pushViewController(controller, animated: true)
            return
        default:
            let controller = ContactUsVC()
            self.navigationController?.pushViewController(controller, animated: true)
            return
            
        }
    }

    
}
