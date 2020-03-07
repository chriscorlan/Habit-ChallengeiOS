//
//  Alert.swift
//  Habit Challenge
//
//  Created by Chad Wiedemann on 2/19/18.
//  Copyright © 2018 Chad Wiedemann LLC. All rights reserved.
//

import Foundation
import UIKit

class Alert {
    static func show(title: String, message: String, on viewController: UIViewController, completion: @escaping ()->()){
        DispatchQueue.main.async {
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            let cancel = UIAlertAction(title: "Cancel", style: .destructive, handler: { (action) -> Void in })
            alert.addAction(cancel)
            alert.addAction(UIAlertAction.init(title: "Okay", style: .cancel, handler: { (action) in
                completion()
            }))
            viewController.present(alert, animated: true, completion: nil)
        }
    }
}
