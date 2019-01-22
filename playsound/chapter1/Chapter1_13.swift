//
//  Chapter1_17.swift
//  playsound
//
//  Created by student on 8/7/18.
//  Copyright © 2018 harvestidea. All rights reserved.
//

import UIKit
import AVFoundation

class Chapter1_13: UIViewController, AVAudioPlayerDelegate {

    var conversationSound: AVAudioPlayer = AVAudioPlayer()
    var currentColor: String = ""
    var countFinger: Int = 0
    
    
    @IBAction func nextPage(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "chapter1_14")
        self.present(vc!, animated: true, completion: nil)
    }
    
    
    @IBOutlet weak var finger1Style: UIButton!
    @IBAction func finger1(_ sender: Any) {
        if currentColor == "yellow" {
            countFinger += 1
            if countFinger == 2 {
                btnNext.isHidden = false
            }
            finger1Style.isHidden = true
        } else {
            let alert = UIAlertController(title: "Wrong choice", message: "You choose wrong color", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "try again", style: .cancel, handler: nil))
            present(alert, animated: true, completion: nil)
        }
    }
    
    @IBOutlet weak var finger2Style: UIButton!
    @IBAction func finger2(_ sender: Any) {
        if currentColor == "green" {
            countFinger += 1
            if countFinger == 2 {
                btnNext.isHidden = false
            }
        finger2Style.isHidden = true
        } else {
            let alert = UIAlertController(title: "Wrong choice", message: "You choose wrong color", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "try again", style: .cancel, handler: nil))
            present(alert, animated: true, completion: nil)
        }
    }
    
    @IBAction func finger3(_ sender: Any) {
        wrongFingure()
    }
    
    @IBAction func finger4(_ sender: Any) {
        wrongFingure()
    }
    
    @IBAction func finger5(_ sender: Any) {
        wrongFingure()
    }
    
    func wrongFingure() {
        let alert = UIAlertController(title: "Wrong choice", message: "You choose wrong finger", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "try again", style: .cancel, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    @IBOutlet weak var btnNext: UIButton!
    
    @IBAction func yellowColor(_ sender: Any) {
        currentColor = "yellow"
    }
    
    @IBAction func greenColor(_ sender: Any) {
        currentColor = "green"
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
