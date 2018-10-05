//
//  Chapter1_53.swift
//  playsound
//
//  Created by student on 10/2/18.
//  Copyright © 2018 harvestidea. All rights reserved.
//

import UIKit
import AVFoundation
import AudioKit

class Chapter1_53: UIViewController, AVAudioPlayerDelegate {
    var conversationSound: AVAudioPlayer = AVAudioPlayer()
    var cntSong = 0
    
    let mic = AKMicrophone()
    
    var tracker: AKFrequencyTracker = AKFrequencyTracker()
    
    @IBAction func nextPage(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "chapter1_52")
        self.present(vc!, animated: true, completion: nil)
    }
    
    @IBOutlet weak var btnNext: UIButton!
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
    
    func songPlay() {
        
        let path = Bundle.main.path(forResource: "p42.mp3", ofType: nil)!
        let url = URL(fileURLWithPath: path)
        do {
            conversationSound = try AVAudioPlayer(contentsOf: url)
            conversationSound.delegate = self
            conversationSound.play()
        } catch {
            print(error)
        }
    }
    
    var timer: Timer!
    var silence = AKBooster()
    var frequencyCnt = 0;
    func audioPlayerDidFinishPlaying( _ player: AVAudioPlayer, successfully flag: Bool) {
        
        

        cntSong += 1;
        if cntSong == 1 {
            songPlay()
            timer = Timer.scheduledTimer(withTimeInterval: 0.9, repeats: true, block: { _ in
                if self.frequencyCnt >= 8{
                    let mic = AKMicrophoneTracker()
                    mic.start()
                    print(mic.frequency)
                }
                self.frequencyCnt += 1
            })
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        btnNext.isHidden = true

    }
}
