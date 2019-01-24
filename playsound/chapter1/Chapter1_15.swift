//
//  Chapter1_21.swift
//  playsound
//
//  Created by student on 8/7/18.
//  Copyright © 2018 harvestidea. All rights reserved.
//

import UIKit
import AVFoundation

class Chapter1_15: UIViewController, AVAudioPlayerDelegate {
    
    var conversationSound: AVAudioPlayer = AVAudioPlayer()

    @IBAction func nextPage(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "chapter1_16")
        self.present(vc!, animated: true, completion: nil)
    }
    @IBOutlet weak var retryButton: UIButton!
    
    @IBOutlet weak var btnNext: UIButton!
    func audioPlay() {
        retryButton.isHidden = true
        let path = Bundle.main.path(forResource: "p17", ofType: "mp3")!
        let url = URL(fileURLWithPath: path)
        do {
            conversationSound = try AVAudioPlayer(contentsOf: url)
            conversationSound.delegate = self
            conversationSound.play()
        } catch {
            print(error)
        }
    }
    
    @IBAction func retryMusic(_ sender: Any) {
        audioPlay()
    }
    
    func audioPlayerDidFinishPlaying( _ player: AVAudioPlayer, successfully flag: Bool) {
        btnNext.isHidden = false
        retryButton.isHidden = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        btnNext.isHidden = true
        retryButton.isHidden = true
        audioPlay()
        
    }
}
