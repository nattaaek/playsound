//
//  Chapter1_81.swift
//  playsound
//
//  Created by user150172 on 1/27/19.
//  Copyright © 2019 harvestidea. All rights reserved.
//

import UIKit
import  AVFoundation

class Chapter1_81: UIViewController, AVAudioPlayerDelegate {

    @IBOutlet weak var btnNext: UIButton!
    var conversaionPlayer: AVAudioPlayer = AVAudioPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func conversationPlay() {
        let path = Bundle.main.path(forResource: "conversation", ofType: "mp3")!
        let url = URL(fileURLWithPath: path)
        do {
            conversaionPlayer = try AVAudioPlayer(contentsOf: url)
            conversaionPlayer.delegate = self
            conversaionPlayer.play()
        } catch {
            print(error)
        }
    }

    func audioPlayerDidFinishPlaying(_  : AVAudioPlayer, successfully flag: Bool) {
        btnNext.isHidden = false
    }
    
    @IBAction func nextPage(_ sender: Any) {
    }
}
