//
//  Chapter1_49.swift
//  playsound
//
//  Created by user150172 on 1/27/19.
//  Copyright © 2019 harvestidea. All rights reserved.
//

import UIKit

class Chapter1_49: UIViewController {

    
    @IBOutlet weak var choice1: UIButton!
    @IBOutlet weak var choice2: UIButton!
    @IBOutlet weak var choice3: UIButton!
    @IBOutlet weak var choice4: UIButton!
    @IBOutlet weak var choice5: UIButton!
    @IBOutlet weak var answer1: UIButton!
    @IBOutlet weak var answer2: UIButton!
    @IBOutlet weak var answer3: UIButton!
    @IBOutlet weak var answer4: UIButton!
    @IBOutlet weak var answer5: UIButton!
    
    @IBOutlet weak var nextBtn: UIButton!
    var currentAnswer: String!
    var answered: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nextBtn.isHidden = true
    }
    
    func showAlert() {
        let alert = UIAlertController(title: "failed", message: "your answer is incorrect", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "try again", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func choice1(_ sender: Any) {
        currentAnswer = "1"
    }
    
    @IBAction func choice2(_ sender: Any) {
        currentAnswer = "2"
    }
    
    @IBAction func choice3(_ sender: Any) {
        currentAnswer = "3"
    }
    
    
    @IBAction func choice4(_ sender: Any) {
        currentAnswer = "4"
    }
    
    
    @IBAction func choicee5(_ sender: Any) {
        currentAnswer = "5"
    }
    
    
    @IBAction func answer1(_ sender: Any) {
        if currentAnswer == "1" {
            answered += 1
            choice1.isHidden = true
            if answered == 5 {
                nextBtn.isHidden = false
            }
        } else {
            showAlert()
        }
    }
    
    
    @IBAction func answer2(_ sender: Any) {
        if currentAnswer == "2" {
            answered += 1
            choice2.isHidden = true
            if answered == 5 {
                nextBtn.isHidden = false
            }
        } else {
            showAlert()
        }
    }
    
    
    @IBAction func answer3(_ sender: Any) {
        if currentAnswer == "3" {
            answered += 1
            choice3.isHidden = true
            if answered == 5 {
                nextBtn.isHidden = false
            }
        } else {
            showAlert()
        }
    }

    @IBAction func answer4(_ sender: Any) {
        if currentAnswer == "4" {
            answered += 1
            choice4.isHidden = true
            if answered == 5 {
                nextBtn.isHidden = false
            }
        } else {
            showAlert()
        }
    }
    
    
    @IBAction func answer5(_ sender: Any) {
        if currentAnswer == "5" {
            answered += 1
            choice5.isHidden = true
            if answered == 5 {
                nextBtn.isHidden = false
            }
        } else {
            showAlert()
        }
    }
    
    @IBAction func nextPage(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "chapter1_50")
        self.present(vc!, animated: true, completion: nil)
    }
}
