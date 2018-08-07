//
//  Chapter1_10.swift
//  playsound
//
//  Created by student on 8/6/18.
//  Copyright © 2018 harvestidea. All rights reserved.
//

import UIKit
import AVFoundation

class Chapter1_10: UIViewController, AVAudioPlayerDelegate {
    
    var conversationSound: AVAudioPlayer = AVAudioPlayer()
    var answer : String = ""
    var currentAnswer : String = ""
    var currentQuestion : Int = 1
    var isFinished = false

    @IBOutlet weak var answer1: UIImageView!
    @IBOutlet weak var head1: UIButton!
    @IBOutlet weak var leg1: UIButton!
    
    @IBAction func nextPage(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "chapter1_11")
        self.present(vc!, animated: false, completion: nil)
    }
    @IBAction func head1Answer(_ sender: Any) {
        answer = "high"
        if answer == currentAnswer {
            answer1.image = UIImage(named: "correct.png")
            nextBtn.isHidden = false
        }
        else {
            let alert = UIAlertController(title: "wrong answer", message: "please listen again", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "back", style: .cancel, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    @IBAction func leg1Answer(_ sender: Any) {
        answer = "low"
        if answer == currentAnswer {
            answer1.image = UIImage(named: "correct.png")
            nextBtn.isHidden = false
        }
        else {
            let alert = UIAlertController(title: "wrong answer", message: "please listen again", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "back", style: .cancel, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    @IBOutlet weak var nextBtn: UIButton!
    
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
        nextBtn.isHidden = true
        
        audioPlay()

        
        // Do any additional setup after loading the view.
    }

}
