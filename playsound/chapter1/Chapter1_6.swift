//
//  Chapter1_6.swift
//  playsound
//
//  Created by student on 8/6/18.
//  Copyright © 2018 harvestidea. All rights reserved.
//

import UIKit
import AVFoundation
import Darwin

class Chapter1_6: UIViewController, AVAudioPlayerDelegate {

    var conversationSound : AVAudioPlayer = AVAudioPlayer()
    
    
    @IBAction func nextPage(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "chapter1_7")
        self.present(vc!, animated: true, completion: nil)
    }
    
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
        btnNext.isHidden = false
    }
    
    @IBOutlet weak var btnNext: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        btnNext.isHidden = true
        
        audioPlay()
    }
}
