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

class Chapter1_53: UIViewController, AVAudioPlayerDelegate, AVAudioRecorderDelegate {
    
    // declare variable
    var audioPlayer = AVAudioPlayer()
    var songPlayer = AVAudioPlayer()
    var recordPlayer : AVAudioRecorder!
    var tracker: AKFrequencyTracker!
    var silence: AKBooster!
    var microphone: AKMicrophone!
    
    
    
    var songs : [String]!
    let songsWithMetronome = ["StrongBeat","SubBeat","SubBeat","SubBeat","StrongBeat","SubBeat","SubBeat","SubBeat","C","C","C","SubBeat","D","D","D","SubBeat","C","C","C","SubBeat","D","D","D","SubBeat"]
    let songsWithoutMetronome = ["C","C","C","SubBeat","D","D","D","SubBeat","C","C","C","SubBeat","D","D","D","SubBeat"]
    
    var praceticeBool = false
    
    //declare guidetab label
    @IBOutlet weak var c1: UILabel!
    @IBOutlet weak var c2: UILabel!
    @IBOutlet weak var c3: UILabel!
    @IBOutlet weak var d1: UILabel!
    @IBOutlet weak var d2: UILabel!
    @IBOutlet weak var d3: UILabel!
    @IBOutlet weak var c4: UILabel!
    @IBOutlet weak var c5: UILabel!
    @IBOutlet weak var c6: UILabel!
    @IBOutlet weak var d4: UILabel!
    @IBOutlet weak var d5: UILabel!
    @IBOutlet weak var d6: UILabel!
    
    
    //menu View
    @IBOutlet weak var menuView: UIView!
    
    //show menu Button
    @IBAction func showMenu(_ sender: Any) {
        menuView.isHidden = false
    }
    
    //show practice menu Button
    @IBAction func showPractice(_ sender: Any) {
        if praceticeBool {
            menuPracticeMenu.isHidden = false
        }
    }
    
    @IBAction func hidePracticeMenu(_ sender: Any) {
        menuPracticeMenu.isHidden = true
    }
    
    //start practice song
    @IBAction func practiceStartButton(_ sender: Any) {
        songPlay()
    }
    //stop practice song
    @IBAction func practiceStopButton(_ sender: Any) {
        songPlayer.stop()
    }
    
    //menu Practice View
    @IBOutlet weak var menuPracticeMenu: UIView!
    
    //practice Button
    @IBAction func practiceButton(_ sender: Any) {
        practiceMode()
    }
    //notation Button
    @IBAction func notationButton(_ sender: Any) {
        notationOption()
    }
    //perform Button
    @IBAction func performButton(_ sender: Any) {
        praceticeBool = false
        songPlay()
    }
    
    //Record Sound Section
    @IBOutlet weak var recordSwitch: UISwitch!
    @IBAction func recordController(_ sender: Any) {
        recordOption()
    }
    
    //Metronome Control Section
    @IBOutlet weak var metronomeSwitch: UISwitch!
    @IBAction func metronomeSwitchController(_ sender: Any) {
        metronomeOption()
    }
    
    
    @IBOutlet weak var guideTabSwitch: UISwitch!
    @IBAction func guideTabSwitchController(_ sender: Any) {
        guideTabOptions()
    }
    
    // HEAR IT Controller Section
    @IBOutlet weak var hearItSwitch: UISwitch!
    
    @IBAction func hearItChangeController(_ sender: Any) {
        hearItOption()
    }
    
    // Tempo Controller Section
    @IBOutlet weak var tempoSlider: UISlider!
    @IBAction func tempoSliderController(_ sender: Any) {
        print(String(format: "This value is :%i", Int(tempoSlider.value)))
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        menuView.isHidden = true
        menuPracticeMenu.isHidden = true
        conversationPlay()
        guideTabOptions()
        metronomeOption()
        setupRecorder()
        
        microphone = AKMicrophone()
        let filter = AKHighPassFilter(microphone, cutoffFrequency: 200.0, resonance: 0)
        tracker = AKFrequencyTracker(filter)
        silence = AKBooster(tracker, gain: 0)
        
        AKSettings.audioInputEnabled = true
        
    }
    
    
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    let fileName : String = "record.m4a"
    
    func setupRecorder() {
        let audioFileName = getDocumentsDirectory().appendingPathComponent(fileName)
        let recordSetting = [AVFormatIDKey: kAudioFormatAppleLossless ,
                             AVEncoderAudioQualityKey: AVAudioQuality.max.rawValue,
                             AVEncoderBitRateKey : 320000,
                             AVNumberOfChannelsKey: 2 ,
                             AVSampleRateKey: 44100.2 ] as [String : Any]
        do {
            recordPlayer = try AVAudioRecorder(url: audioFileName, settings: recordSetting)
            recordPlayer.delegate = self
            recordPlayer.prepareToRecord()
            
        } catch {
            print(error)
        }
    }
    
    //change background notation to black
    func notationOption() {
        let alert = UIAlertController(title: "alert", message: "background changed", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "okay", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    //enable to show practice menu
    func practiceMode()  {
        menuPracticeMenu.isHidden = false
        praceticeBool = true
    }
    
    //enable or disable sound of song
    func hearItOption()  {
        if hearItSwitch.isOn {
            songPlayer.volume = 1.0
        } else {
            songPlayer.volume = 0.0
        }
    }
    
    //enable or disable guide tab
    func guideTabOptions() {
        if guideTabSwitch.isOn {
            c1.isHidden = false
            c2.isHidden = false
            c3.isHidden = false
            c4.isHidden = false
            c5.isHidden = false
            c6.isHidden = false
            d1.isHidden = false
            d2.isHidden = false
            d3.isHidden = false
            d4.isHidden = false
            d5.isHidden = false
            d6.isHidden = false
        } else {
            c1.isHidden = true
            c2.isHidden = true
            c3.isHidden = true
            c4.isHidden = true
            c5.isHidden = true
            c6.isHidden = true
            d1.isHidden = true
            d2.isHidden = true
            d3.isHidden = true
            d4.isHidden = true
            d5.isHidden = true
            d6.isHidden = true
        }
    }
    
    //enable or disable metronome
    func metronomeOption()  {
        if metronomeSwitch.isOn {
            songs = songsWithoutMetronome
        } else {
            songs = songsWithMetronome
        }
    }
    
    //enable or disable accomp.
    func accompOption()  {
        
    }
    
    //enable or disable record session
    func recordOption() {
        if recordSwitch.isOn {
            recordPlayer.record()
        } else {
            recordPlayer.stop()
            print(recordPlayer.url)
        }
    }
    
    
    //enable song to play
    func songPlay(){
        AudioKit.output = silence
        try! AudioKit.start()
        for index in 0..<songs.count {
            Timer.scheduledTimer(withTimeInterval: index * (60 / tempoSlider.value), repeats: false) { (timer) in
                if !self.metronomeSwitch.isOn {
                    if self.tracker.frequency <= 277 && self.tracker.frequency >= 246 && index >= 9 && index <= 11{
                        print("C")
                    } else if self.tracker.frequency >= 276 && self.tracker.frequency <= 311 && index >= 13 && index <= 15 {
                        print("D")
                    } else if self.tracker.frequency <= 277 && self.tracker.frequency >= 246 && index >= 17 && index <= 19 {
                        print("C")
                    } else if self.tracker.frequency >= 276 && self.tracker.frequency <= 311 && index >= 21 && index <= 23 {
                        print("D")
                    }
                } else {
                    if self.tracker.frequency <= 277 && self.tracker.frequency >= 246 && index >= 0 && index <= 2{
                        print("C")
                    } else if self.tracker.frequency >= 276 && self.tracker.frequency <= 311 && index >= 4 && index <= 6 {
                        print("D")
                    } else if self.tracker.frequency <= 277 && self.tracker.frequency >= 246 && index >= 8 && index <= 10 {
                        print("C")
                    } else if self.tracker.frequency >= 276 && self.tracker.frequency <= 311 && index >= 12 && index <= 14 {
                        print("D")
                    }
                }
                self.playSelectedSong(selectedSong: self.songs[index])
            }
        }
    }
    
    func playSelectedSong(selectedSong: String) {
        let songURL = Bundle.main.url(forResource: selectedSong, withExtension: "wav")
        do{
            songPlayer = try AVAudioPlayer(contentsOf: songURL!)
        } catch let error {
            print(error.localizedDescription)
        }
        songPlayer.prepareToPlay()
        songPlayer.play()
    }
    
    //play conversation sound
    func conversationPlay()  {
        guard let conversationSound = Bundle.main.url(forResource: "p4highnote", withExtension: "mp3") else { return }
        do {
            try audioPlayer = AVAudioPlayer(contentsOf: conversationSound)
        } catch let error {
            print(error.localizedDescription)
        }
        
        audioPlayer.play()
    }
}

