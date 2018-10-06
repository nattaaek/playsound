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
    var frequencyCnt = 0
    var mic = AKMicrophone()
    var tracker = AKFrequencyTracker()

    

    func audioPlayerDidFinishPlaying( _ player: AVAudioPlayer, successfully flag: Bool) {
        songPlay()
        tracker = AKFrequencyTracker(mic)
        let silence = AKBooster(tracker, gain: 0)
        AudioKit.output = silence
        try! AudioKit.start()
        Timer.scheduledTimer( timeInterval: 0.9, target: self, selector: #selector(Chapter1_53.outputFrequency), userInfo: nil, repeats: true)


    }
    var cCount = 0
    var dCount = 0
    @objc func outputFrequency() {
        frequencyCnt += 1
        if frequencyCnt >= 8 {
            if tracker.frequency == 261.6256 {
                print("pass")
            }
            else {
                print(tracker.frequency)
            }
        }
 
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        btnNext.isHidden = true
        
        audioPlay()
    }
}
