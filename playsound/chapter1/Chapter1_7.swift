//
//  Chapter1_11.swift
//  playsound
//
//  Created by student on 8/7/18.
//  Copyright © 2018 harvestidea. All rights reserved.
//

import UIKit
import AVFoundation

class Chapter1_7: UIViewController, AVAudioPlayerDelegate {
    
    func nextPage() {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "chapter1_8")
        self.present(vc!, animated: false, completion: nil)
    }
    

    
    
    var conversationSound: AVAudioPlayer = AVAudioPlayer()
    
    var currentAnswer: String = ""
    var answer : String = ""
    
    @IBAction func head2Answer(_ sender: Any) {
        answer = "high"
        if answer == currentAnswer {
            answer2.image = UIImage(named: "correct.png")
           nextPage()
        }
        else {
            let alert = UIAlertController(title: "wrong answer", message: "please listen again", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "back", style: .cancel, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    @IBAction func leg2Answer(_ sender: Any) {
        answer = "low"
        if answer == currentAnswer {
            answer2.image = UIImage(named: "correct.png")
            nextPage()
        }
        else {
            let alert = UIAlertController(title: "wrong answer", message: "please listen again", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "back", style: .cancel, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    @IBOutlet weak var answer2: UIImageView!
    func audioPlay() {
        var path: String
        
        let num = arc4random_uniform(10) + 1
        
        if num >= 5 {
            path = Bundle.main.path(forResource: "p5lownote.mp3", ofType: nil)!
            currentAnswer = "low"
        }else {
            path = Bundle.main.path(forResource: "p4highnote.mp3", ofType: nil)!
            currentAnswer = "high"
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
        
        // Do any additional setup after loading the view.
    }
}
