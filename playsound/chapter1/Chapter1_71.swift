//
//  Chapter1_71.swift
//  playsound
//
//  Created by user150172 on 1/27/19.
//  Copyright © 2019 harvestidea. All rights reserved.
//

import UIKit
import AVFoundation
import AudioKit

class Chapter1_71: UIViewController, AVAudioPlayerDelegate, AVAudioRecorderDelegate {
    
    //declare variable
    var audioPlayer = AVAudioPlayer()
    var songPlayer = AVAudioPlayer()
    var accompPlayer = AVAudioPlayer()
    var performPlayer = AVAudioPlayer()
    var recordPlayer : AVAudioRecorder!
    var recordSession : AVAudioSession!
    var tracker: AKFrequencyTracker!
    var silence: AKBooster!
    var microphone: AKMicrophone!
    
    var currentNote: String = ""
    var countNoteC: Int = 0
    var countNoteD: Int = 0
    var countNoteE: Int = 0

    
    //var songs : [String]!
    let songsWithMetronome = ["StrongBeat","SubBeat","SubBeat","SubBeat","StrongBeat","SubBeat","SubBeat","SubBeat","C","D","C","SubBeat","D","E","D","SubBeat","E","E","D","D","C","SubBeat","C","SubBeat"]
    var praceticeBool = false
    
    @IBOutlet weak var c1: UILabel!
    @IBOutlet weak var d1: UILabel!
    @IBOutlet weak var c2: UILabel!
    @IBOutlet weak var e1: UILabel!
    @IBOutlet weak var e2: UILabel!
    @IBOutlet weak var d2: UILabel!
    @IBOutlet weak var d3: UILabel!
    @IBOutlet weak var d4: UILabel!
    @IBOutlet weak var e3: UILabel!
    @IBOutlet weak var d5: UILabel!
    @IBOutlet weak var c3: UILabel!
    @IBOutlet weak var c4: UILabel!
    @IBOutlet weak var stop1: UILabel!
    @IBOutlet weak var stop2: UILabel!
    @IBOutlet weak var stop3: UILabel!
    @IBOutlet weak var stop4: UILabel!
    @IBOutlet weak var bgc1: UIView!
    @IBOutlet weak var bgd1: UIView!
    @IBOutlet weak var bgc2: UIView!
    @IBOutlet weak var bge1: UIView!
    @IBOutlet weak var bge2: UIView!
    @IBOutlet weak var bgd2: UIView!
    @IBOutlet weak var bgd3: UIView!
    @IBOutlet weak var bgd4: UIView!
    @IBOutlet weak var bge3: UIView!
    @IBOutlet weak var bgd5: UIView!
    @IBOutlet weak var bgc3: UIView!
    @IBOutlet weak var bgc4: UIView!
    @IBOutlet weak var bgstop1: UIView!
    @IBOutlet weak var bgstop2: UIView!
    @IBOutlet weak var bgstop3: UIView!
    @IBOutlet weak var bgstop4: UIView!
    
    
    //menu View
    @IBOutlet weak var menuView: UIView!
    
    //show menu Button
    @IBAction func showMenu(_ sender: Any) {
        if(countNoteC>=1&&countNoteD>=1&&countNoteE>=1){
        menuView.isHidden = false
        }
    }
    
    @IBAction func hideMenu(_ sender: Any) {
        menuView.isHidden = true
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
        audioPlayer.stop()
        accompPlayer.stop()
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
        performSong()
    }
    
    //Record Sound Section
    @IBOutlet weak var recordSwitch: UISwitch!
    @IBAction func recordController(_ sender: Any) {
        recordOption()
    }
    
    //Metronome Control Section
    @IBOutlet weak var metronomeSwitch: UISwitch!
    @IBAction func metronomeSwitchController(_ sender: Any) {
        //metronomeOption()
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
    
    
    @IBOutlet weak var noteE: UIButton!
    @IBAction func noteE(_ sender: Any){
        if currentNote == "E"{
            countNoteE += 1
        } else {
            let alert = UIAlertController(title: "Wrong note", message: "You choose wrong note", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "try again", style: .cancel, handler: nil))
            present(alert, animated: true, completion: nil)
        }
    }
    @IBOutlet weak var noteD: UIButton!
    @IBAction func noteD(_ sender: Any){
        if currentNote == "D"{
            countNoteD += 1
        } else {
            let alert = UIAlertController(title: "Wrong note", message: "You choose wrong note", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "try again", style: .cancel, handler: nil))
            present(alert, animated: true, completion: nil)
        }
    }
    @IBOutlet weak var noteC: UIButton!
    @IBAction func noteC(_ sender: Any){
        if currentNote == "C"{
            countNoteC += 1
    } else {
            let alert = UIAlertController(title: "Wrong note", message: "You choose wrong note", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "try again", style: .cancel, handler: nil))
            present(alert, animated: true, completion: nil)
        }
    }
    @IBAction func selectNoteC(_ sender: Any) {
        currentNote = "C"
    }
    @IBAction func selectNoteD(_ sender: Any) {
        currentNote = "D"
    }
    @IBAction func selectNoteE(_ sender: Any) {
        currentNote = "E"
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        hideGuideTab()
        menuView.isHidden = true
        menuPracticeMenu.isHidden = true
        conversationPlay()
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
            melodyPlay()
        } else {
            AudioKit.output = silence
            try! AudioKit.start()
            var index = 0
            if accompSwitch.isOn && metronomeSwitch.isOn{
                backgroundPlay()
                timer = Timer.scheduledTimer(withTimeInterval: 2.0, repeats: false) { (timer) in
                    if self.tracker.frequency <= 277 && self.tracker.frequency >= 246 && (index == 0 && index == 2 && index == 12 && index == 14){
                        self.changeLabelGuide(index: index, isCorrect: true)
                        index += 1
                        self.guideTabChangeController(index: index)
                    } else if self.tracker.frequency <= 311 && self.tracker.frequency >= 276 && (index == 1 && index == 4 && index == 6 && index == 10 && index == 11) {
                        self.changeLabelGuide(index: index, isCorrect: true)
                        index += 1
                        self.guideTabChangeController(index: index)
                    } else if self.tracker.frequency <= 329 && self.tracker.frequency >= 310 && (index == 5 && index == 8 && index == 9) {
                        self.changeLabelGuide(index: index, isCorrect: true)
                        index += 1
                        self.guideTabChangeController(index: index)
                    } else if index == 3 || index == 7 || index == 13 || index == 15{
                        self.changeLabelGuide(index: index, isCorrect: true)
                        index += 1
                        self.guideTabChangeController(index: index)
                    } else if index == self.songsWithMetronome.count{
                        timer.invalidate()
                    } else {
                        self.changeLabelGuide(index: index, isCorrect: false)
                    }
                }
            } else {
                timer = Timer.scheduledTimer(withTimeInterval: 2.0, repeats: true) { (timer) in
                    self.playSelectedSong()
                    if self.tracker.frequency <= 277 && self.tracker.frequency >= 246 && (index == 0 && index == 2 && index == 12 && index == 14){
                        self.changeLabelGuide(index: index, isCorrect: true)
                        index += 1
                        self.guideTabChangeController(index: index)
                    } else if self.tracker.frequency <= 311 && self.tracker.frequency >= 276 && (index == 1 && index == 4 && index == 6 && index == 10 && index == 11) {
                        self.changeLabelGuide(index: index, isCorrect: true)
                        index += 1
                        self.guideTabChangeController(index: index)
                    } else if self.tracker.frequency <= 329 && self.tracker.frequency >= 310 && (index == 5 && index == 8 && index == 9) {
                        self.changeLabelGuide(index: index, isCorrect: true)
                        index += 1
                        self.guideTabChangeController(index: index)
                    } else if index == 3 || index == 7 || index == 13 || index == 15{
                        self.changeLabelGuide(index: index, isCorrect: true)
                        index += 1
                        self.guideTabChangeController(index: index)
                    } else if index == self.songsWithMetronome.count{
                        timer.invalidate()
                    } else {
                        self.changeLabelGuide(index: index, isCorrect: false)
                    }
                }
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
            d1.isHidden = false
            if isCorrect {
                d1.text = "Perfect"
            } else {
                d1.text = "Missed"
            }
            break
        case 2:
            c2.isHidden = false
            if isCorrect {
                c2.text = "Perfect"
            } else {
                c2.text = "Missed"
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
            d4.isHidden = false
            if isCorrect {
                d4.text = "Perfect"
            } else {
                d4.text = "Missed"
            }
            break
        case 5:
            e3.isHidden = false
            if isCorrect {
                e3.text = "Perfect"
            } else {
                e3.text = "Missed"
            }
            break
        case 6:
            d5.isHidden = false
            if isCorrect {
                d5.text = "Perfect"
            } else {
                d5.text = "Missed"
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
            e1.isHidden = false
            if isCorrect {
                e1.text = "Perfect"
            } else {
                e1.text = "Missed"
            }
            break
        case 9:
            e2.isHidden = false
            if isCorrect {
                e2.text = "Perfect"
            } else {
                e2.text = "Missed"
            }
            break
        case 10:
            d2.isHidden = false
            if isCorrect {
                d2.text = "Perfect"
            } else {
                d2.text = "Missed"
            }
            break
        case 11:
            d3.isHidden = false
            if isCorrect {
                d3.text = "Perfect"
            } else {
                d3.text = "Missed"
            }
            break
        case 12:
            c3.isHidden = false
            if isCorrect {
                c3.text = "Perfect"
            } else {
                c3.text = "Missed"
            }
            break
        case 13:
            stop3.isHidden = false
            if isCorrect {
                stop3.text = "Perfect"
            } else {
                stop3.text = "Missed"
            }
            break
        case 14:
            c4.isHidden = false
            if isCorrect {
                c4.text = "Perfect"
            } else {
                c4.text = "Missed"
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
    
    
    func audioPlayerDidFinishPlaying( _ performPlayer : AVAudioPlayer , successfully flag: Bool) {
        
        print("test")
        
    }
    
    //Perform get score
    func performSong() {
        var index = 0
        self.performPlay()
        Timer.scheduledTimer(withTimeInterval: 2.0, repeats: true) { (timer) in
            if self.tracker.frequency <= 277 && self.tracker.frequency >= 246 && (index == 0 && index == 2 && index == 12 && index == 14){
                self.changeLabelGuide(index: index, isCorrect: true)
                index += 1
                self.guideTabChangeController(index: index)
            } else if self.tracker.frequency <= 311 && self.tracker.frequency >= 276 && (index == 1 && index == 4 && index == 6 && index == 10 && index == 11) {
                self.changeLabelGuide(index: index, isCorrect: true)
                index += 1
                self.guideTabChangeController(index: index)
            } else if self.tracker.frequency <= 329 && self.tracker.frequency >= 310 && (index == 5 && index == 8 && index == 9) {
                self.changeLabelGuide(index: index, isCorrect: true)
                index += 1
                self.guideTabChangeController(index: index)
            } else if index == 3 || index == 7 || index == 13 || index == 15{
                self.changeLabelGuide(index: index, isCorrect: true)
                index += 1
                self.guideTabChangeController(index: index)
            } else if index == self.songsWithMetronome.count{
                timer.invalidate()
            } else {
                self.changeLabelGuide(index: index, isCorrect: false)
                index += 1
            }
        }
    }
    
    func playSelectedSong() {
        let songURL = Bundle.main.url(forResource: "StrongBeat", withExtension: "wav")
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
        guard let conversationSound = Bundle.main.url(forResource: "conversation", withExtension: "mp3") else { return }
        do {
            try audioPlayer = AVAudioPlayer(contentsOf: conversationSound)
        } catch let error {
            print(error.localizedDescription)
        }
        
        audioPlayer.play()
    }
    
    //play background sound
    func backgroundPlay()  {
        guard let backgroundSound = Bundle.main.url(forResource: "p50melody", withExtension: "mp3")
            else { return }
        do {
            try accompPlayer = AVAudioPlayer(contentsOf: backgroundSound)
        } catch let error {
            print(error.localizedDescription)
        }
        
        accompPlayer.prepareToPlay()
        accompPlayer.play()
    }
    
    func melodyPlay() {
        guard let melodySound = Bundle.main.url(forResource: "p50bt", withExtension: "mp3")
            else { return }
        do {
            try accompPlayer = AVAudioPlayer(contentsOf: melodySound)
            accompPlayer.delegate = self
            
        } catch let error {
            print(error.localizedDescription)
        }
        accompPlayer.prepareToPlay()
        accompPlayer.play()
    }
    
    func performPlay() {
        guard let melodySound = Bundle.main.url(forResource: "p50bt", withExtension: "mp3")
            else { return }
        do {
            try performPlayer = AVAudioPlayer(contentsOf: melodySound)
            performPlayer.delegate = self
            
        } catch let error {
            print(error.localizedDescription)
        }
        performPlayer.prepareToPlay()
        performPlayer.play()
    }
    
    func hideGuideTab() {
        c1.isHidden = true
        c2.isHidden = true
        c3.isHidden = true
        c4.isHidden = true
        e1.isHidden = true
        e2.isHidden = true
        d1.isHidden = true
        d2.isHidden = true
        d3.isHidden = true
        d4.isHidden = true
        d5.isHidden = true
        e3.isHidden = true
        stop1.isHidden = true
        stop2.isHidden = true
        stop3.isHidden = true
        stop4.isHidden = true
        bgc1.isHidden = true
        bgc2.isHidden = true
        bgc3.isHidden = true
        bgc4.isHidden = true
        bge1.isHidden = true
        bge2.isHidden = true
        bgd1.isHidden = true
        bgd2.isHidden = true
        bgd3.isHidden = true
        bgd4.isHidden = true
        bgd5.isHidden = true
        bge3.isHidden = true
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
            bgd1.isHidden = false
            bgc1.isHidden = true
            break
        case let index where index == 2 :
            bgc2.isHidden = false
            bgd1.isHidden = true
            break
        case let index where index == 3 :
            bgstop1.isHidden = false
            bgc2.isHidden = true
            break
        case let index where index == 4 :
            bgd4.isHidden = false
            bgstop1.isHidden = true
            break
        case let index where index == 5 :
            bge3.isHidden = false
            bgd4.isHidden = true
            break
        case let index where index == 6 :
            bgd5.isHidden = false
            bge3.isHidden = true
            break
        case let index where index == 7 :
            bgstop2.isHidden = false
            bgd5.isHidden = true
            break
        case let index where index == 8 :
            bge1.isHidden = false
            bgstop2.isHidden = true
            break
        case let index where index == 9 :
            bge2.isHidden = false
            bge1.isHidden = true
            break
        case let index where index == 10 :
            bgd2.isHidden = false
            bge2.isHidden = true
            break
        case let index where index == 11 :
            bgd3.isHidden = false
            bgd2.isHidden = true
            break
        case let index where index == 12 :
            bgc3.isHidden = false
            bgd3.isHidden = true
            break
        case let index where index == 13 :
            bgstop3.isHidden = false
            bgc3.isHidden = true
            break
        case let index where index == 14 :
            bgc4.isHidden = false
            bgstop3.isHidden = true
            break
        case let index where index == 15 :
            bgstop4.isHidden = false
            bgc4.isHidden = true
            break
        default:
            break
        }
    }
        
    

}
