//
//  Chapter1_25.swift
//  playsound
//
//  Created by student on 8/7/18.
//  Copyright © 2018 harvestidea. All rights reserved.
//

import UIKit
import AVFoundation
import RLBAlertsPickers

class Chapter1_25: UIViewController, AVAudioPlayerDelegate {

    var conversationSound: AVAudioPlayer = AVAudioPlayer()
    var currentColor = UIColor.black
    
    var color = UIColor.black
    
    func audioPlay() {
        
        let path = Bundle.main.path(forResource: "p4highnote.mp3", ofType: nil)!
        let url = URL(fileURLWithPath: path)
        do {
            conversationSound = try AVAudioPlayer(contentsOf: url)
            conversationSound.delegate = self
            conversationSound.play()
        } catch {
            print(error)
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        audioPlay()
        
        let alert = UIAlertController(style: .actionSheet, message: "Select Country")
        alert.addLocalePicker(type: .country) { info in
            // action with selected object
        }
        alert.addAction(title: "OK", style: .cancel)
        alert.show()
        
    }
}
