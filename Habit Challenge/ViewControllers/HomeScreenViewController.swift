//
//  HomeScreenViewController.swift
//  Habit Challenge
//
//  Created by Chad Wiedemann on 12/26/17.
//  Copyright © 2017 Chad Wiedemann LLC. All rights reserved.
//

import UIKit
import SideMenu

class HomeScreenViewController: UIViewController {

    
    @objc func showMenu()  {
        present(SideMenuManager.default.menuLeftNavigationController!, animated: true, completion: nil)

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isTranslucent = false
        self.title = "Habit Challenge"
        self.navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedStringKey.foregroundColor : UIColor.white
        ]
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "hambuger"), style: .plain, target: self, action: #selector(HomeScreenViewController.showMenu))
        // Define the menus
        let menuLeftNavigationController = UISideMenuNavigationController(rootViewController: MenuViewController())
        // UISideMenuNavigationController is a subclass of UINavigationController, so do any additional configuration
        // of it here like setting its viewControllers. If you're using storyboards, you'll want to do something like:
        // let menuLeftNavigationController = storyboard!.instantiateViewController(withIdentifier: "LeftMenuNavigationController") as! UISideMenuNavigationController
        SideMenuManager.default.menuLeftNavigationController = menuLeftNavigationController
        
        let menuRightNavigationController = UISideMenuNavigationController(rootViewController: MenuViewController())
        // UISideMenuNavigationController is a subclass of UINavigationController, so do any additional configuration
        // of it here like setting its viewControllers. If you're using storyboards, you'll want to do something like:
        // let menuRightNavigationController = storyboard!.instantiateViewController(withIdentifier: "RightMenuNavigationController") as! UISideMenuNavigationController
        SideMenuManager.default.menuRightNavigationController = menuRightNavigationController
        
        SideMenuManager.default.menuPresentMode = .menuSlideIn
        
    }

    @IBAction func recordTodaysProgressButtonPressed(_ sender: Any) {
        let newController = HabitListViewController()
        self.navigationController?.pushViewController(newController, animated: true)
    }
    
    @IBAction func cravingsIntensityMeterButtonPressed(_ sender: Any) {
        let newController = CravingsIntensityVC()
        self.navigationController?.pushViewController(newController, animated: true)
    }
    
    @IBAction func manageYourTriggersButtonPressed(_ sender: Any) {
        let newController = ManageYourTriggersVC()
        self.navigationController?.pushViewController(newController, animated: true)
    }
    
    @IBAction func otherButtonPressed(_ sender: UIButton) {
        var myUrl = ""
        switch sender.tag {
        case 1:
            myUrl = "http://www.empowerministry.org/"
        case 3:
            myUrl = "http://www.empowerministry.org/app/handbook/"
        case 4:
            myUrl = "https://www.empowerministry.org/"
        case 5:
            myUrl = "https://www.empowerministry.org/app/craving-toolbox/craving-warning-signs/"
        case 6:
            myUrl = "https://www.empowerministry.org/app/craving-toolbox/"
        case 7:
            myUrl = "https://www.empowerministry.org/app/spiritual-help-tool-box/"
        case 8:
            myUrl = "https://www.empowerministry.org/app/craving-toolbox/5-steps-to-stop-a-craving/"
        case 9:
            myUrl = "https://www.empowerministry.org/app/craving-toolbox/managing-triggers-checklist/"
        default:
            myUrl = "https://www.empowerministry.org/"
        }
        
        let newController = WebViewViewController()
        newController.webURL = myUrl
        self.navigationController?.pushViewController(newController, animated: true)
    }
}
