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
    var accompPlayer = AVAudioPlayer()
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
    @IBOutlet weak var stop1: UILabel!
    @IBOutlet weak var stop2: UILabel!
    @IBOutlet weak var stop3: UILabel!
    @IBOutlet weak var stop4: UILabel!
    @IBOutlet weak var bgc1: UIView!
    @IBOutlet weak var bgc2: UIView!
    @IBOutlet weak var bgc3: UIView!
    @IBOutlet weak var bgd1: UIView!
    @IBOutlet weak var bgd2: UIView!
    @IBOutlet weak var bgd3: UIView!
    @IBOutlet weak var bgc4: UIView!
    @IBOutlet weak var bgc5: UIView!
    @IBOutlet weak var bgc6: UIView!
    @IBOutlet weak var bgd4: UIView!
    @IBOutlet weak var bgd5: UIView!
    @IBOutlet weak var bgd6: UIView!
    @IBOutlet weak var bgstop1: UIView!
    @IBOutlet weak var bgstop2: UIView!
    @IBOutlet weak var bgstop3: UIView!
    @IBOutlet weak var bgstop4: UIView!
    
    
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
    
    // Accomp Control Section
    @IBOutlet weak var accompSwitch: UISwitch!
    @IBAction func accompSwitchController(_ sender: Any) {
    }
    
    // Guide Tab control Section
    @IBOutlet weak var guideTabSwitch: UISwitch!
    @IBAction func guideTabSwitchController(_ sender: Any) {
        guideTabOptions()
        guideTabChangeController(index: 0)

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
        
        hideGuideTab()
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
        guideTabSwitch.setOn(false, animated: true)
        metronomeSwitch.setOn(false, animated: true)
        recordSwitch.setOn(false, animated: true)
        accompSwitch.setOn(false, animated: true)
        metronomeSwitch.isEnabled = false
        recordSwitch.isEnabled = false
        accompSwitch.isEnabled = false
    }
    
    //enable or disable guide tab
    func guideTabOptions() {
        metronomeSwitch.isEnabled = true
        recordSwitch.isEnabled = true
        accompSwitch.isEnabled = true
        hearItSwitch.setOn(false, animated: true)
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
    var timer = Timer()
    func songPlay(){
        if hearItSwitch.isOn {
            backgroundPlay()
        } else if guideTabSwitch.isOn{
            AudioKit.output = silence
            try! AudioKit.start()
            var index = 0
            timer = Timer.scheduledTimer(withTimeInterval: 2.0, repeats: true) { (timer) in
                if self.tracker.frequency <= 277 && self.tracker.frequency >= 246 && (index >= 0 && index <= 2) || (index >= 8 && index <= 10){
                    self.changeLabelGuide(index: index, isCorrect: true)
                    index += 1
                    self.guideTabChangeController(index: index)
                } else if self.tracker.frequency <= 311 && self.tracker.frequency >= 276 && (index >= 4 && index <= 6) || (index >= 12 && index <= 14) {
                    self.changeLabelGuide(index: index, isCorrect: true)
                    index += 1
                    self.guideTabChangeController(index: index)
                } else if index == 3 || index == 7 || index == 11 || index == 15{
                    self.changeLabelGuide(index: index, isCorrect: true)
                    index += 1
                    self.guideTabChangeController(index: index)
                } else if index == self.songs.count{
                    timer.invalidate()
                } else {
                    self.changeLabelGuide(index: index, isCorrect: false)
                }
            }
        }else {
            //metronomeOption()
            AudioKit.output = silence
            try! AudioKit.start()
            for index in 0..<songs.count {
           /*     Timer.scheduledTimer(withTimeInterval: index * (60 / tempoSlider.value), repeats: false) { (timer) in
                    
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
                }*/
            }
        }
        
       
    }
    
    func changeLabelGuide(index: Int, isCorrect:  Bool) {

        print(index)
            switch index {
            case 0:
                c1.isHidden = false
                if isCorrect {
                    c1.text = "Perfect"
                } else {
                    c1.text = "Missed"
                }
                break
            case 1:
                c2.isHidden = false
                if isCorrect {
                    c2.text = "Perfect"
                } else {
                    c2.text = "Missed"
                }
                break
            case 2:
                c3.isHidden = false
                if isCorrect {
                    c3.text = "Perfect"
                } else {
                    c3.text = "Missed"
                }
                break
            case 3:
                stop1.isHidden = false
                if isCorrect {
                    stop1.text = "Perfect"
                } else {
                    stop1.text = "Missed"
                }
                break
            case 4:
                d1.isHidden = false
                if isCorrect {
                    d1.text = "Perfect"
                } else {
                    d1.text = "Missed"
                }
                break
            case 5:
                d2.isHidden = false
                if isCorrect {
                    d2.text = "Perfect"
                } else {
                    d2.text = "Missed"
                }
                break
            case 6:
                d3.isHidden = false
                if isCorrect {
                    d3.text = "Perfect"
                } else {
                    d3.text = "Missed"
                }
                break
            case 7:
                stop2.isHidden = false
                if isCorrect {
                    stop2.text = "Perfect"
                } else {
                    stop2.text = "Missed"
                }
                break
            case 8:
                c4.isHidden = false
                if isCorrect {
                    c4.text = "Perfect"
                } else {
                    c4.text = "Missed"
                }
                break
            case 9:
                c5.isHidden = false
                if isCorrect {
                    c5.text = "Perfect"
                } else {
                    c5.text = "Missed"
                }
                break
            case 10:
                c6.isHidden = false
                if isCorrect {
                    c6.text = "Perfect"
                } else {
                    c6.text = "Missed"
                }
                break
            case 11:
                stop3.isHidden = false
                if isCorrect {
                    stop3.text = "Perfect"
                } else {
                    stop3.text = "Missed"
                }
                break
            case 12:
                d4.isHidden = false
                if isCorrect {
                    d4.text = "Perfect"
                } else {
                    d4.text = "Missed"
                }
                break
            case 13:
                d5.isHidden = false
                if isCorrect {
                    d5.text = "Perfect"
                } else {
                    d5.text = "Missed"
                }
                break
            case 14:
                d6.isHidden = false
                if isCorrect {
                    d6.text = "Perfect"
                } else {
                    d6.text = "Missed"
                }
                break
            case 15:
                stop4.isHidden = false
                if isCorrect {
                    stop4.text = "Perfect"
                    bgstop4.isHidden = true
                } else {
                    stop4.text = "Missed"
                }
                break
            default:
                timer.invalidate()
                print("done")
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
    
    //play background sound
    func backgroundPlay()  {
        guard let backgroundSound = Bundle.main.url(forResource: "bg", withExtension: "wav")
            else { return }
        do {
            try accompPlayer = AVAudioPlayer(contentsOf: backgroundSound)
        } catch let error {
            print(error.localizedDescription)
        }
        
        accompPlayer.play()
    }
    
    func hideGuideTab() {
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
        stop1.isHidden = true
        stop2.isHidden = true
        stop3.isHidden = true
        stop4.isHidden = true
        bgc1.isHidden = true
        bgc2.isHidden = true
        bgc3.isHidden = true
        bgc4.isHidden = true
        bgc5.isHidden = true
        bgc6.isHidden = true
        bgd1.isHidden = true
        bgd2.isHidden = true
        bgd3.isHidden = true
        bgd4.isHidden = true
        bgd5.isHidden = true
        bgd6.isHidden = true
        bgstop1.isHidden = true
        bgstop2.isHidden = true
        bgstop3.isHidden = true
        bgstop4.isHidden = true
    }
    
    func guideTabChangeController(index: Int) {
        
        switch index {
        case let index where index == 0 :
            bgc1.isHidden = false
            break
        case let index where index == 1 :
            bgc2.isHidden = false
            bgc1.isHidden = true
            break
        case let index where index == 2 :
            bgc3.isHidden = false
            bgc2.isHidden = true
            break
        case let index where index == 3 :
            bgstop1.isHidden = false
            bgc3.isHidden = true
            break
        case let index where index == 4 :
            bgd1.isHidden = false
            bgstop1.isHidden = true
            break
        case let index where index == 5 :
            bgd2.isHidden = false
            bgd1.isHidden = true
            break
        case let index where index == 6 :
            bgd3.isHidden = false
            bgd2.isHidden = true
            break
        case let index where index == 7 :
            bgstop2.isHidden = false
            bgd3.isHidden = true
            break
        case let index where index == 8 :
            bgc4.isHidden = false
            bgstop2.isHidden = true
            break
        case let index where index == 9 :
            bgc5.isHidden = false
            bgc4.isHidden = true
            break
        case let index where index == 10 :
            bgc6.isHidden = false
            bgc5.isHidden = true
            break
        case let index where index == 11 :
            bgstop3.isHidden = false
            bgc6.isHidden = true
            break
        case let index where index == 12 :
            bgd4.isHidden = false
            bgstop3.isHidden = true
            break
        case let index where index == 13 :
            bgd5.isHidden = false
            bgd4.isHidden = true
            break
        case let index where index == 14 :
            bgd6.isHidden = false
            bgd5.isHidden = true
            break
        case let index where index == 15 :
            bgstop4.isHidden = false
            bgd6.isHidden = true
            break
        default:
            break
        }
    }
}

