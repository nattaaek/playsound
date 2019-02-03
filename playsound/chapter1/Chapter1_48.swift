//
//  Chapter1_48.swift
//  playsound
//
//  Created by user150172 on 1/27/19.
//  Copyright © 2019 harvestidea. All rights reserved.
//

import UIKit
import AVFoundation

class Chapter1_48: UIViewController, AVAudioPlayerDelegate {

    var conversationSound: AVAudioPlayer = AVAudioPlayer()
    var answer : String = ""
    var currentAnswer : String = ""
    var currentQuestion : Int = 1
    var isFinished = false
    
    
    @IBOutlet weak var answer3: UIButton!
    @IBOutlet weak var answer2: UIButton!
    @IBOutlet weak var answer1: UIButton!
    
    
    @IBAction func retryMusic(_ sender: Any) {
        audioPlay()
    }
    
    @IBOutlet weak var btnNext: UIButton!
    @IBAction func nextPage(_ sender: Any) {
        let storyboard = self.storyboard?.instantiateViewController(withIdentifier: "chapter1_49")
        self.present(storyboard!, animated: true, completion: nil)
    }
    
    @IBOutlet weak var leg3: UIButton!
    @IBAction func leg3Answer(_ sender: Any) {
        answer = "low"
        if answer == currentAnswer {
            answer3.setImage(UIImage(named: "correct.png"), for: .normal)
            btnNext.isHidden = false
            answer3.isUserInteractionEnabled = false
            leg3.isHidden = true
            head3.isHidden = true
            audioPlay()
        } else {
            answer3.setImage(UIImage(named: "retry.png"), for: .normal)
        }
    }
    
    
    @IBOutlet weak var head3: UIButton!
    @IBAction func head3Answer(_ sender: Any) {
        answer = "high"
        if answer == currentAnswer {
            answer3.setImage(UIImage(named: "correct.png"), for: .normal)
            btnNext.isHidden = false
            answer3.isUserInteractionEnabled = false
            leg3.isHidden = true
            head3.isHidden = true
            audioPlay()
            
        } else {
            answer3.setImage(UIImage(named: "retry.png"), for: .normal)
        }
    }
    
    
    @IBOutlet weak var leg2: UIButton!
    @IBAction func leg2(_ sender: Any) {
        answer = "low"
        if answer == currentAnswer {
            answer2.setImage(UIImage(named: "correct.png"), for: .normal)
            leg3.isHidden = false
            head3.isHidden = false
            answer2.isUserInteractionEnabled = false
            leg2.isHidden = true
            head2.isHidden = true
            answer3.isHidden = false
            audioPlay()
            
        } else {
            answer2.setImage(UIImage(named: "retry.png"), for: .normal)
        }
    }
    
    @IBOutlet weak var head2: UIButton!
    @IBAction func head2(_ sender: Any) {
        answer = "high"
        if answer == currentAnswer {
            answer2.setImage(UIImage(named: "correct.png"), for: .normal)
            leg3.isHidden = false
            head3.isHidden = false
            answer2.isUserInteractionEnabled = false
            leg2.isHidden = true
            head2.isHidden = true
            answer3.isHidden = false
            audioPlay()
            
        } else {
            answer2.setImage(UIImage(named: "retry.png"), for: .normal)
        }
    }
    
    @IBOutlet weak var leg1: UIButton!
    @IBAction func leg1Answer(_ sender: Any) {
        answer = "low"
        if answer == currentAnswer {
            answer1.setImage(UIImage(named: "correct.png"), for: .normal)
            leg2.isHidden = false
            head2.isHidden = false
            leg1.isHidden = true
            head1.isHidden = true
            answer1.isUserInteractionEnabled = false
            answer2.isHidden = false
            audioPlay()
            
            
        } else {
            answer1.setImage(UIImage(named: "retry.png"), for: .normal)
        }
    }
    
    
    @IBOutlet weak var head1: UIButton!
    @IBAction func head1Answer(_ sender: Any) {
        answer  = "high"
        if answer == currentAnswer {
            answer1.setImage(UIImage(named: "correct.png"), for: .normal)
            leg2.isHidden = false
            head2.isHidden = false
            leg1.isHidden = true
            head1.isHidden = true
            answer1.isUserInteractionEnabled = false
            answer2.isHidden = false
            audioPlay()
            
            
        } else {
            answer1.setImage(UIImage(named: "retry.png"), for: .normal)
        }
    }
    
    func audioPlay() {
        var path: String
        
        let num = arc4random_uniform(10) + 1
        print(num)
        if currentQuestion == 1 {
            if num >= 5 {
                path = Bundle.main.path(forResource: "p52.mp3", ofType: nil)!
                currentAnswer = "low"
            }else {
                path = Bundle.main.path(forResource: "p5212.mp3", ofType: nil)!
                currentAnswer = "high"
            }
        } else if currentQuestion == 2{
            if num >= 5 {
                path = Bundle.main.path(forResource: "p5221.mp3", ofType: nil)!
                currentAnswer = "low"
            }else {
                path = Bundle.main.path(forResource: "p5222.mp3", ofType: nil)!
                currentAnswer = "high"
            }
        } else {
            if num >= 5 {
                path = Bundle.main.path(forResource: "p5231.mp3", ofType: nil)!
                currentAnswer = "low"
            }else {
                path = Bundle.main.path(forResource: "p5232.mp3", ofType: nil)!
                currentAnswer = "high"
            }
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
        btnNext.isHidden = true
        answer2.isHidden = true
        answer3.isHidden = true
    }

    
}
