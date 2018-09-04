//
//  Chapter1_40_2.swift
//  playsound
//
//  Created by student on 9/4/18.
//  Copyright © 2018 harvestidea. All rights reserved.
//

import UIKit
import AVFoundation

class Chapter1_40_2: UIViewController, AVAudioPlayerDelegate {
    
    var conversationSound: AVAudioPlayer = AVAudioPlayer()
    var answer = ""
    
    @IBAction func birdAnswer(_ sender: Any) {
        if answer == "high" {
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "chapter1_40_3")
            self.present(vc!, animated: false, completion: nil)
        }else{
            let alert = UIAlertController(title: "Error", message: "wrong choice", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "try again", style: .cancel, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    
    @IBAction func lionAnswer(_ sender: Any) {
        if answer == "low" {
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "chapter1_40_3")
            self.present(vc!, animated: false, completion: nil)
        }else{
            let alert = UIAlertController(title: "Error", message: "wrong choice", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "try again", style: .cancel, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        audioPlay()
        // Do any additional setup after loading the view.
    }
    
    func audioPlay() {
        var path: String
        
        let num = arc4random_uniform(10) + 1
        
        if num >= 5 {
            path = Bundle.main.path(forResource: "p5lownote.mp3", ofType: nil)!
            answer = "low"
        }else {
            path = Bundle.main.path(forResource: "p4highnote.mp3", ofType: nil)!
            answer = "high"
        }
        
        let url = URL(fileURLWithPath: path)
        do {
            conversationSound = try AVAudioPlayer(contentsOf: url)
            conversationSound.delegate = self
            conversationSound.play()
        } catch {
            print(error)
        }
    }

}
