//
//  Chapter1_10.swift
//  playsound
//
//  Created by student on 8/6/18.
//  Copyright © 2018 harvestidea. All rights reserved.
//

import UIKit
import AVFoundation

class Chapter1_10: UIViewController, AVAudioPlayerDelegate {
    
    var conversationSound: AVAudioPlayer = AVAudioPlayer()

    @IBAction func nextPage(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "chapter1_11")
        self.present(vc!, animated: true, completion: nil)
    }
    @IBOutlet weak var nextBtn: UIButton!
    
    func audioPlay() {
        let path: String
        let num = arc4random_uniform(10) + 1
        
        if num >= 5 {
            path = Bundle.main.path(forResource: "p5lownote.mp3", ofType: nil)!
        }else {
            path = Bundle.main.path(forResource: "p4highnote.mp3", ofType: nil)!
        }
        
        
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
        nextBtn.isHidden = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nextBtn.isHidden = true
        audioPlay()
        // Do any additional setup after loading the view.
    }

}
