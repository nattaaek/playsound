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
    
    var audioPlayer = AVAudioPlayer()
    
    let songs = ["StrongBeat","SubBeat","SubBeat","SubBeat","StrongBeat","SubBeat","SubBeat","SubBeat"]
    let song = Bundle.main.url(forResource: "p272key", withExtension: "mp3")
    
    var praceticeBool = false
    
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
        audioPlayer.stop()
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
    
    
    // HEAR IT Controller Section
    @IBOutlet weak var hearItSwitch: UISwitch!

    @IBAction func hearItChangeController(_ sender: Any) {
        hearItOption()
    }
    
    // Tempo Controller Section
    @IBOutlet weak var tempoSlider: UISlider!
    @IBAction func tempoSliderController(_ sender: Any) {
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        menuView.isHidden = true
        menuPracticeMenu.isHidden = true
        conversationPlay()
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
            audioPlayer.volume = 1.0
        } else {
            audioPlayer.volume = 0.0
        }
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
    
    //enable song to play
    var selectedSong: String = ""
    func songPlay(){
        for index in 0..<songs.count {
            print(Double(tempoSlider.value))
            let when = DispatchTime.now() + Double(index) + 0.5

            DispatchQueue.main.asyncAfter(deadline: when, execute: {
             self.selectedSong = self.songs[index]
             self.playSelectedSong()
            })
        }
    }
    
    func playSelectedSong() {
        let songURL = Bundle.main.url(forResource: selectedSong, withExtension: "wav")
        do{
            audioPlayer = try AVAudioPlayer(contentsOf: songURL!)
        } catch let error {
            print(error.localizedDescription)
        }
        audioPlayer.play()
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

