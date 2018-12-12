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
    

    
    func stopTimer() {
        if timer != nil {
            timer.invalidate()
            timer = nil
        }
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
    var playCount = 0
    var mic = AKMicrophone()
    var tracker = AKFrequencyTracker()
    

    func audioPlayerDidFinishPlaying( _ player: AVAudioPlayer, successfully flag: Bool) {
        tracker = AKFrequencyTracker(mic)
        let silence = AKBooster(tracker, gain: 0)
        AudioKit.output = silence
        try! AudioKit.start()
        if playCount == 0 {
            songPlay()
            timer = Timer.scheduledTimer( timeInterval: 0.95, target: self, selector: #selector(Chapter1_53.outputFrequency), userInfo: nil, repeats: true)
                playCount = 1
        }
        else {
            stopTimer()
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "chapter1_54")
            self.present(vc!, animated: true, completion: nil)
        }
    }
    @IBOutlet weak var menuView: UIView!
    
    var isShow = 0
    @IBAction func showMenu(_ sender: Any) {
        
        if isShow == 0 {
            menuView.isHidden = true
            isShow = 1
        }
        else {
            menuView.isHidden = false
            isShow = 0
        }
    }
    
    @IBAction func showPractice(_ sender: Any) {
        if isShow == 0 {
            menuPracticeMenu.isHidden = true
            isShow = 1
        } else {
            menuPracticeMenu.isHidden = false
            isShow = 0
        }
    }
    var count = 0
    @objc func outputFrequency() {
        frequencyCnt += 1
        if frequencyCnt >= 8 {
            if count % 6 == 0 && tracker.frequency <= 302.3959 && tracker.frequency >= 285.4236 {
                print("d")
            }
            else if count % 3 == 0 && tracker.frequency >= 254.2836 && tracker.frequency <=  269.4041{
                print("c")
            }
            else {
                print(tracker.frequency)
            }
        }
    }
    
    @IBOutlet weak var menuPracticeMenu: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        menuView.isHidden = true
        menuPracticeMenu.isHidden = true
        audioPlay()
    }
    
    @IBOutlet weak var background: UIImageView!
    
    //change background notation to black
    func notationOption() {
        background.image = UIImage(named: "")
    }
    
    //enable to show practice menu
    func practiceMode()  {
        menuPracticeMenu.isHidden = false
    }
    
    //enable or disable sound of song
    func hearItOption()  {
        
    }
    
    //enable or disable guide tab
    func guideTabOptions() {
        
    }
    
    //enable or disable metronome
    func metronomeOption()  {
        
    }
    
    //enable or disable accomp.
    func accompOption()  {
        
    }
}
