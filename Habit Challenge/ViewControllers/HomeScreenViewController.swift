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
    
    @IBAction func otherButtonPressed(_ sender: UIButton) {
        let newController = WebViewViewController()
        
        self.navigationController?.pushViewController(newController, animated: true)
        
        
    }
    

}
