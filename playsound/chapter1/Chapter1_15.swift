//
//  Chapter1_15.swift
//  playsound
//
//  Created by student on 8/7/18.
//  Copyright © 2018 harvestidea. All rights reserved.
//

import UIKit
import AVFoundation

class Chapter1_15: UIViewController, AVAudioPlayerDelegate {
    
    var conversationSound: AVAudioPlayer = AVAudioPlayer()
    var currentColor: String = ""
    var countHands: Int = 0
    @IBOutlet weak var hand1Style: UIButton!
    @IBOutlet weak var hand2Style: UIButton!
    @IBOutlet weak var hand3Style: UIButton!
    @IBOutlet weak var hand4Style: UIButton!
    @IBOutlet weak var hand5Style: UIButton!
    
    @IBAction func nextPage(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "chapter1_16")
        self.present(vc!, animated: true, completion: nil)
    }
    
    @IBAction func hand2(_ sender: Any) {
        if currentColor == "red" {
            countHands += 1
            if countHands == 5 {
                btnNext.isHidden = false
            }
        hand2Style.isHidden = true
        }
        else {
            let alert = UIAlertController(title: "Wrong choice", message: "You choose wrong color", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "try again", style: .cancel, handler: nil))
            present(alert, animated: true, completion: nil)
        }
    }
    
    @IBAction func hand1(_ sender: Any) {
        if currentColor == "blue" {
            countHands += 1
            if countHands == 5 {
                btnNext.isHidden = false
            }
        hand1Style.isHidden = true
        }
        else {
            let alert = UIAlertController(title: "Wrong choice", message: "You choose wrong color", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "try again", style: .cancel, handler: nil))
            present(alert, animated: true, completion: nil)
        }
    }
    
    @IBAction func hand3(_ sender: Any) {
        if currentColor == "red" {
            countHands += 1
            if countHands == 5 {
                btnNext.isHidden = false
            }
        hand3Style.isHidden = true
        }
        else {
            let alert = UIAlertController(title: "Wrong choice", message: "You choose wrong color", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "try again", style: .cancel, handler: nil))
            present(alert, animated: true, completion: nil)
        }
    }
    
    @IBAction func hand4(_ sender: Any) {
        if currentColor == "blue" {
            countHands += 1
            if countHands == 5 {
                btnNext.isHidden = false
            }
        hand4Style.isHidden = true
        }
        else {
            let alert = UIAlertController(title: "Wrong choice", message: "You choose wrong color", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "try again", style: .cancel, handler: nil))
            present(alert, animated: true, completion: nil)
        }
    }
    
    
    @IBAction func hand5(_ sender: Any) {
        if currentColor == "blue" {
            countHands += 1
            if countHands == 5 {
                btnNext.isHidden = false
            }
        hand5Style.isHidden = true
        }
        else {
            let alert = UIAlertController(title: "Wrong choice", message: "You choose wrong color", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "try again", style: .cancel, handler: nil))
            present(alert, animated: true, completion: nil)
        }
    }
    
    @IBOutlet weak var btnNext: UIButton!
    
    @IBAction func colorRed(_ sender: Any) {
        currentColor = "red"
    }
    
    @IBAction func colorBlue(_ sender: Any) {
        currentColor = "blue"
    }
    
    func audioPlay() {
        let path = Bundle.main.path(forResource: "p5lownote.mp3", ofType: nil)!
        let url = URL(fileURLWithPath: path)
        
        do {
            conversationSound = try AVAudioPlayer(contentsOf: url)
            conversationSound.delegate = self
            conversationSound.play()
        } catch {
            print(error)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        btnNext.isHidden = true
        audioPlay()
        // Do any additional setup after loading the view.
    }
}
