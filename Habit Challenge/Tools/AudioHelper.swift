//
//  AudioHelper.swift
//  Habit Challenge
//
//  Created by Chad Wiedemann on 11/29/17.
//  Copyright © 2017 Chad Wiedemann LLC. All rights reserved.
//

import Foundation
import AVFoundation

class AudioHelper {
    static let sharedInstance = AudioHelper()
    var player: AVAudioPlayer!
    
    
    
    func playSound(fileName: String, audioType: String) {
        
        
        guard let url = Bundle.main.url(forResource: fileName, withExtension: audioType) ?? Bundle.main.url(forResource: "clapping", withExtension: "wav") else { return }
        
        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
            try AVAudioSession.sharedInstance().setActive(true)
            
            
            player = try AVAudioPlayer(contentsOf: url)
            guard let player = player else { return }
            
            player.play()
            
        } catch let error {
            print(error.localizedDescription)
        }
    }
}
