//
//  Chapter1_26.swift
//  playsound
//
//  Created by student on 8/8/18.
//  Copyright © 2018 harvestidea. All rights reserved.
//

import UIKit
import AVFoundation

class Chapter1_22: UIViewController, AVAudioPlayerDelegate {

    var pictureColor: String = ""
    var conversationSound: AVAudioPlayer = AVAudioPlayer()
    
    @IBOutlet weak var btnNext: UIButton!
    @IBAction func nextPage(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "chapter1_23")
        self.present(vc!, animated: true, completion: nil)
    }
    
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
    
    func audioPlayerDidFinishPlaying( _ player: AVAudioPlayer, successfully flag: Bool) {
        btnNext.isHidden = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        btnNext.isHidden = true
        
        audioPlay()
        
    }

}
