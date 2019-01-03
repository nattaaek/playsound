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
    var recordSession : AVAudioSession!
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
        metronomeOption()
        guideTabOptions()
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
        metronomeOption()
        AudioKit.output = silence
        try! AudioKit.start()
        for index in 0..<songs.count {
            Timer.scheduledTimer(withTimeInterval: index * (60 / tempoSlider.value), repeats: false) { (timer) in
                if !self.metronomeSwitch.isOn {
                    if self.tracker.frequency <= 277 && self.tracker.frequency >= 246 && index >= 9 && index <= 11{
                        self.changeLabelGuide(index: index)
                        print("C")
                    } else if self.tracker.frequency >= 276 && self.tracker.frequency <= 311 && index >= 13 && index <= 15 {
                        self.changeLabelGuide(index: index)
                        print("D")
                    } else if self.tracker.frequency <= 277 && self.tracker.frequency >= 246 && index >= 17 && index <= 19 {
                        self.changeLabelGuide(index: index)
                        print("C")
                    } else if self.tracker.frequency >= 276 && self.tracker.frequency <= 311 && index >= 21 && index <= 23 {
                        self.changeLabelGuide(index: index)
                        print("D")
                    }
                } else {
                    if self.tracker.frequency <= 277 && self.tracker.frequency >= 246 && index >= 0 && index <= 2{
                        self.changeLabelGuide(index: index)
                        print("C")
                    } else if self.tracker.frequency >= 276 && self.tracker.frequency <= 311 && index >= 4 && index <= 6 {
                        self.changeLabelGuide(index: index)
                        print("D")
                    } else if self.tracker.frequency <= 277 && self.tracker.frequency >= 246 && index >= 8 && index <= 10 {
                        self.changeLabelGuide(index: index)
                        print("C")
                    } else if self.tracker.frequency >= 276 && self.tracker.frequency <= 311 && index >= 12 && index <= 14 {
                        self.changeLabelGuide(index: index)
                        print("D")
                    }
                }
                self.playSelectedSong(selectedSong: self.songs[index])
            }
        }
    }
    
    func changeLabelGuide(index: Int) {
        if !metronomeSwitch.isOn {
            switch index {
            case 9:
                c1.text = "perfect"
                break
            case 10:
                c2.text = "perfect"
                break
            case 11:
                c3.text = "perfect"
                break
            case 13:
                d1.text = "perfect"
                break
            case 14:
                d2.text = "perfect"
            case 15:
                d3.text = "perfect"
            case 17:
                c4.text = "perfect"
            case 18:
                c5.text = "perfect"
            case 19:
                c6.text = "perfect"
            case 21:
                d4.text = "perfect"
            case 22:
                d5.text = "perfect"
            case 23:
                d6.text = "perfect"
            default:
                break
            }
        } else {
            switch index {
            case 0:
                c1.text = "perfect"
                break
            case 1:
                c2.text = "perfect"
                break
            case 2:
                c3.text = "perfect"
                break
            case 4:
                d1.text = "perfect"
                break
            case 5:
                d2.text = "perfect"
            case 6:
                d3.text = "perfect"
            case 8:
                c4.text = "perfect"
            case 9:
                c5.text = "perfect"
            case 10:
                c6.text = "perfect"
            case 12:
                d4.text = "perfect"
            case 13:
                d5.text = "perfect"
            case 14:
                d6.text = "perfect"
            default:
                break
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

