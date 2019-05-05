//
//  Chapter1_4.swift
//  playsound
//
//  Created by student on 8/6/18.
//  Copyright © 2018 harvestidea. All rights reserved.
//

import UIKit
import AVFoundation

class Chapter1_4: UIViewController, AVAudioPlayerDelegate {

    //declare section
    var conversationSound : AVAudioPlayer = AVAudioPlayer()
    var musicSound: AVAudioPlayer = AVAudioPlayer()
    var countSound: Int = 0
    @IBOutlet weak var btnNext: UIButton!
    
    
    //main function
    override func viewDidLoad() {
        super.viewDidLoad()
        btnNext.isHidden = true
        audioPlay()
    }

    
    //Action
    @IBAction func nextPage(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "chapter1_5")
        self.present(vc!, animated: true, completion: nil)
    }
    
    func audioPlay() {
        
        let path = Bundle.main.path(forResource: "p4.mp3", ofType: nil)!
        let url = URL(fileURLWithPath: path)
        do {
            conversationSound = try AVAudioPlayer(contentsOf: url)
            conversationSound.delegate = self
            conversationSound.play()
        } catch {
            print(error)
        }
    }
    
    func musicPlay()  {
        let path = Bundle.main.path(forResource: "p4.mp3", ofType: nil)!
        let url = URL(fileURLWithPath: path)
        do {
            musicSound = try AVAudioPlayer(contentsOf: url)
            musicSound.delegate = self
            musicSound.play()
        } catch {
            print(error)
        }
    }
    
    func audioPlayerDidFinishPlaying( _ player: AVAudioPlayer, successfully flag: Bool) {
        if countSound == 1 {
            btnNext.isHidden = false
            musicSound.stop()
            conversationSound.stop()
        } else {
            countSound += 1
            musicPlay()
        }
    }

}
