//
//  HabitResultTableViewCell.swift
//  Habit Challenge
//
//  Created by Chad Wiedemann on 11/25/17.
//  Copyright © 2017 Chad Wiedemann LLC. All rights reserved.
//

import UIKit
import DLRadioButton
import AVFoundation
import Toast_Swift

class HabitResultTableViewCell: UITableViewCell {

    @IBOutlet weak var successButtonOutlet: DLRadioButton!
    @IBOutlet weak var failButtonOutlet: DLRadioButton!
    @IBOutlet weak var resultDateLabel: UILabel!
    var currentHabitResult: HabitResult!
    var player: AVAudioPlayer!
    var fileName = ""
    var audioType = ""
    var toastText = ""
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func faileButtonPressed(_ sender: Any) {
        HabitChallengeDB.instance.updateHabitResult(habitRid: currentHabitResult.id, successNumber: 1)
        self.currentHabitResult.is_success = 1
    }
    
    @IBAction func successButtonPressed(_ sender: Any) {
        HabitChallengeDB.instance.updateHabitResult(habitRid: currentHabitResult.id, successNumber: 2)
        self.currentHabitResult.is_success = 2
        
        DispatchQueue.main.async {
            
            AudioHelper.sharedInstance.playSound(fileName: self.fileName, audioType: self.audioType)
            (UIApplication.shared.delegate?.window??.rootViewController as! UINavigationController).popViewController(animated: true)
            if self.toastText.count > 0{
                (UIApplication.shared.delegate?.window??.rootViewController as! UINavigationController).topViewController?.view.makeToast(self.toastText, duration: 10.0, point: CGPoint(x: UIScreen.main.bounds.size.width*0.5,y: UIScreen.main.bounds.size.height*0.5), title: nil, image: nil, style: ToastStyle.init(), completion: nil)
                
                
                
//                makeToast(self.toastText, point: CGPoint(x: UIScreen.main.bounds.size.width*0.5,y: UIScreen.main.bounds.size.height*0.5), title: nil, image: nil, completion: nil)
                
            }
        }
        
    }
    
    
    
}
