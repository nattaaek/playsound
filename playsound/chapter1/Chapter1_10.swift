//
//  Chapter1_10.swift
//  playsound
//
//  Created by user150172 on 1/19/19.
//  Copyright © 2019 harvestidea. All rights reserved.
//

import UIKit
import AVFoundation

class Chapter1_10: UIViewController,  AVAudioPlayerDelegate{

    var conversationSound: AVAudioPlayer = AVAudioPlayer()
    
    @IBOutlet weak var btnNext: UIButton!
    
    @IBAction func nextPage(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "chapter1_11")
        self.present(vc!, animated: true, completion: nil)
    }
    
    func audioPlay() {
        
        let path = Bundle.main.path(forResource: "conversation.mp3", ofType: nil)!
        let url = URL(fileURLWithPath: path)
        do {
            conversationSound = try AVAudioPlayer(contentsOf: url)
            conversationSound.delegate = self
            conversationSound.play()
        } catch {
            print(error)
        }
    }
    
    func audioPlayerDidFinishPlaying( _ player: AVAudioPlayer, successfully flag: Bool) {
        btnNext.isHidden = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        btnNext.isHidden = true
        
        audioPlay()
        
    }

}
