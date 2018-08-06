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

    var conversionSound : AVAudioPlayer? = AVAudioPlayer()
    @IBAction func nextPage(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "chapter1_2")
        self.present(vc!, animated: true, completion: nil)
    }
    
    @IBOutlet weak var btnNext: UIButton!
    
    func audioPlay() {
        
    let path = Bundle.main.path(forResource: "p4highnote.mp3", ofType: nil)!
    let url = URL(fileURLWithPath: path)
        do {
            conversionSound = try AVAudioPlayer(contentsOf: url)
            conversionSound?.delegate = self
            conversionSound?.play()
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
