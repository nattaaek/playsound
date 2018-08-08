//
//  Chapter1_28.swift
//  playsound
//
//  Created by student on 8/8/18.
//  Copyright © 2018 harvestidea. All rights reserved.
//

import UIKit
import AVFoundation

class Chapter1_28: UIViewController, AVAudioPlayerDelegate {

    var conversationSound: AVAudioPlayer = AVAudioPlayer()
    
    @IBAction func nextPage(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "chapter1_29")
        self.present(vc!, animated: true, completion: nil)
    }
    @IBOutlet weak var btnNext: UIButton!
    func audioPlay() {
        
        let path = Bundle.main.path(forResource: "p23.mp3", ofType: nil)!
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
