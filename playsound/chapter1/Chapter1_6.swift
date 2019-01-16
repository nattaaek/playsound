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


    @IBOutlet weak var answer3: UIImageView!
    @IBOutlet weak var answer2: UIImageView!
    @IBOutlet weak var answer1: UIImageView!
    
    
    func nextPage(){
        let storyboard = self.storyboard?.instantiateViewController(withIdentifier: "1_7")
        self.present(storyboard!, animated: true, completion: nil)
    }
    
    func retryMusic(){
        if answer3.image == UIImage(named: "retry.png")  {
            audioPlay()
        } else if answer2.image == UIImage(named: "retry.png") {
            audioPlay()
        } else {
            audioPlay()
        }
    }
    
    
    @IBOutlet weak var leg3: UIButton!
    @IBAction func leg3Answer(_ sender: Any) {
        answer = "low"
        if answer == currentAnswer {
            answer3.image = UIImage(named: "correct.png")
            nextPage()
        } else {
            answer3.image = UIImage(named: "retry.png")
            retryMusic()
        }
    }
    
    
    @IBOutlet weak var head3: UIButton!
    @IBAction func head3Answer(_ sender: Any) {
        answer = "high"
        if answer == currentAnswer {
            answer3.image = UIImage(named: "correect.png")
            nextPage()
        } else {
            answer3.image = UIImage(named: "retry.png")
            retryMusic()
        }
    }
    
    
    @IBOutlet weak var leg2: UIButton!
    @IBAction func leg2(_ sender: Any) {
        answer = "low"
        if answer == currentAnswer {
            answer2.image = UIImage(named: "correct.png")
            leg3.isHidden = false
            head3.isHidden = false
        } else {
            answer2.image = UIImage(named: "retry.png")
            retryMusic()
        }
    }
    
    @IBOutlet weak var head2: UIButton!
    @IBAction func head2(_ sender: Any) {
        answer = "high"
        if answer == currentAnswer {
            answer2.image = UIImage(named: "correct.png")
            leg3.isHidden = false
            head3.isHidden = false
        } else {
            answer2.image = UIImage(named: "retry.png")
            retryMusic()
        }
    }
    
    @IBOutlet weak var leg1: UIButton!
    @IBAction func leg1Answer(_ sender: Any) {
        answer = "low"
        if answer == currentAnswer {
            answer1.image = UIImage(named: "correct.png")
            leg2.isHidden = false
            head2.isHidden = false
        } else {
            answer1.image = UIImage(named: "retry.png")
            retryMusic()
        }
    }
    
    
    @IBOutlet weak var head1: UIButton!
    @IBAction func head1Answer(_ sender: Any) {
        answer  = "high"
        if answer == currentAnswer {
            answer1.image = UIImage(named: "correct.png")
            leg2.isHidden = false
            head2.isHidden = false
        } else {
            answer1.image = UIImage(named: "retry.png")
            retryMusic()
        }
    }
    
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
    }

}
