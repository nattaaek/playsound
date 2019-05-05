//
//  Chapter1_27.swift
//  playsound
//
//  Created by student on 8/8/18.
//  Copyright © 2018 harvestidea. All rights reserved.
//

import UIKit
import AVFoundation

class Chapter1_21: UIViewController, AVAudioPlayerDelegate {

    var conversationSound: AVAudioPlayer = AVAudioPlayer()
    var songPlayer: AVAudioPlayer = AVAudioPlayer()
    
    @IBAction func nextPage(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "chapter1_22")
        self.present(vc!, animated: true, completion: nil)
    }
    @IBOutlet weak var btnNext: UIButton!
    
    func songPlay(){
        
        let path = Bundle.main.path(forResource: "p4", ofType: "mp3")!
        let url = URL(fileURLWithPath: path)
        do {
            conversationSound = try AVAudioPlayer(contentsOf: url)
            conversationSound.delegate = self
            conversationSound.play()
        } catch {
            print(error)
        }
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
        songPlay()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        btnNext.isHidden = true
        
        audioPlay()
        
    }

}
