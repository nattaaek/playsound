//
//  Chapter1_42.swift
//  playsound
//
//  Created by student on 9/4/18.
//  Copyright © 2018 harvestidea. All rights reserved.
//

import UIKit
import AVFoundation

class Chapter1_36: UIViewController, AVAudioPlayerDelegate {

    var conversationSound: AVAudioPlayer = AVAudioPlayer()
    
    
    @IBOutlet weak var btnNext: UIButton!
    
    @IBAction func nextPage(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "chapter1_37")
        self.present(vc!, animated: true, completion: nil)
    }
    
    func audioPlay() {
        let path = Bundle.main.path(forResource: "conversation", ofType: "mp3")!
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
