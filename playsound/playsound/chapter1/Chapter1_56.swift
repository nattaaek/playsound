//
//  Chapter1_56.swift
//  playsound
//
//  Created by user150172 on 1/27/19.
//  Copyright © 2019 harvestidea. All rights reserved.
//

import UIKit
import AVFoundation

class Chapter1_56: UIViewController, AVAudioPlayerDelegate {

    var conversationPlayer = AVAudioPlayer()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        playConversationSound()
    }
    
    func playConversationSound()  {
        let path = Bundle.main.path(forResource: "conversation", ofType: "mp3")!
        let url = URL(fileURLWithPath: path)
        do {
            conversationPlayer = try AVAudioPlayer(contentsOf: url)
            conversationPlayer.delegate = self
            conversationPlayer.play()
        } catch {
            print(error)
        }
    }
    
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "chapter1_57")
        self.present(vc!, animated: true, completion: nil)
    }
}
