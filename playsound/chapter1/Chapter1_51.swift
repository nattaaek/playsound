//
//  Chapter1_51.swift
//  playsound
//
//  Created by user150172 on 1/27/19.
//  Copyright © 2019 harvestidea. All rights reserved.
//

import UIKit
import AVFoundation

class Chapter1_51: UIViewController, AVAudioPlayerDelegate {

    var conversationSound: AVAudioPlayer = AVAudioPlayer()
    var musicPlayer: AVAudioPlayer = AVAudioPlayer()
    
    @IBAction func nextPage(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "chapter1_52")
        self.present(vc!, animated: true, completion: nil)
    }
    
    @IBOutlet weak var btnNext: UIButton!
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
    
    func musicPlay(){
        let path = Bundle.main.path(forResource: "p55", ofType: "mp3")!
        let url = URL(fileURLWithPath: path)
        do{
            musicPlayer = try AVAudioPlayer(contentsOf: url)
            musicPlayer.delegate = self
            musicPlayer.play()
        } catch {
            print(error)
        }
    }
    
    
    func audioPlayerDidFinishPlaying( musicPlayer: AVAudioPlayer, successfully flag: Bool) {
        audioPlay()
    }
    
    func audioPlayerDidFinishPlaying(connversationSound: AVAudioPlayer, successfully flag: Bool) {
        btnNext.isHidden = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        btnNext.isHidden = true
        
        musicPlay()
        
    }
}
