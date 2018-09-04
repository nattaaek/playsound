//
//  Chapter1_40.swift
//  playsound
//
//  Created by student on 8/9/18.
//  Copyright © 2018 harvestidea. All rights reserved.
//

import UIKit
import AVFoundation

class Chapter1_40: UIViewController, AVAudioPlayerDelegate {

    var conversationSound: AVAudioPlayer = AVAudioPlayer()
    var answer = ""

    @IBOutlet weak var choiceAnswer: UIImageView!
    @IBAction func lionAnswer(_ sender: Any) {
        if answer == "low"{
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "chapter1_40_2")
            self.present(vc!, animated: false, completion: nil)
            choiceAnswer.image = UIImage(named: "correct.png")
        }else {
            let alert = UIAlertController(title: "Error", message: "wrong choice", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "try again", style: .cancel, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    @IBAction func birdAnswer(_ sender: Any) {
        if answer == "high" {
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "chapter1_40_2")
            self.present(vc!, animated: false, completion: nil)
        }else{
            let alert = UIAlertController(title: "Error", message: "wrong choice", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "try again", style: .cancel, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        audioPlay()
        
    }

}
