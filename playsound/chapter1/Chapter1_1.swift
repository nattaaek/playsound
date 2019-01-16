//
//  Chapter1-2.swift
//  playsound
//
//  Created by student on 8/6/18.
//  Copyright © 2018 harvestidea. All rights reserved.
//

import UIKit
import AVFoundation

class Chapter1_1: UIViewController, AVAudioPlayerDelegate {

    //Declare variable section
    var conversationSound : AVAudioPlayer? = AVAudioPlayer()
    var musicPlayer: AVAudioPlayer?  = AVAudioPlayer()
    var countSongPlay: Int = 0
    @IBOutlet weak var btnNext: UIButton!

    
    // Main function
    override func viewDidLoad() {
        super.viewDidLoad()
        btnNext.isHidden = true
        audioPlay()
        musicPlay()
    }
    
    
    // action section
    @IBAction func nextPage(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "chapter1_2")
        self.present(vc!, animated: true, completion: nil)
    }
    
    func audioPlay() {
    let path = Bundle.main.path(forResource: "p1.mp3", ofType: nil)!
    let url = URL(fileURLWithPath: path)
        do {
            conversationSound = try AVAudioPlayer(contentsOf: url)
            conversationSound?.delegate = self
            conversationSound?.play()
        } catch {
            print(error)
        }
    }
    
    func musicPlay() {
        let path = Bundle.main.path(forResource: "conversation.mp3", ofType: nil)!
        let url = URL(fileURLWithPath: path)
        do {
            musicPlayer = try AVAudioPlayer(contentsOf: url)
            musicPlayer?.delegate = self
            musicPlayer?.play()
        }  catch {
            print(error)
        }
    }
    
    func audioPlayerDidFinishPlaying( _ :AVAudioPlayer , successfully flag: Bool) {
        print("test")
        btnNext.isHidden = false
        
        musicPlayer?.stop()

    }

}
