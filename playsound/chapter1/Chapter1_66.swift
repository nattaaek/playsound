//
//  Chapter1_62.swift
//  playsound
//
//  Created by SiRiPonG! on 25/12/18.
//  Copyright © 2018 harvestidea. All rights reserved.
//

import UIKit

class Chapter1_66: UIViewController{

    
    @IBOutlet weak var choiceMiddle: UIButton!
    @IBOutlet weak var choiceSecond: UIButton!
    @IBOutlet weak var choiceFirst: UIButton!
    @IBOutlet weak var choiceCat: UIButton!
    @IBOutlet weak var choiceDog: UIButton!
    @IBOutlet weak var choiceElephant: UIButton!
    @IBOutlet weak var answerSecond: UIButton!
    @IBOutlet weak var answerMiddle: UIButton!
    @IBOutlet weak var answerFirst: UIButton!
    
    var currentAnswer: String!
    var cntAnswer = 0
    @IBOutlet weak var btnNext: UIButton!
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        btnNext.isHidden = true
    }
    
    func showAlert() {
        let alert = UIAlertController(title: "failed", message: "your choice is incorrect", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "try again", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    
    @IBAction func choiceMiddle(_ sender: Any) {
        currentAnswer = "middle"
    }
    
    @IBAction func choiceSecond(_ sender: Any) {
        currentAnswer = "second"
    }
    
    @IBAction func choiceFirst(_ sender: Any) {
        currentAnswer = "first"
    }
    
    
    @IBAction func catChoice(_ sender: Any) {
        if currentAnswer == "first" {
            currentAnswer = "cat"
        } else {
            showAlert()
        }
    }
    
    
    @IBAction func dogChoice(_ sender: Any) {
        if currentAnswer == "second" {
            currentAnswer = "dog"
        } else {
            showAlert()
        }
    }
    
    
    @IBAction func elephantChoice(_ sender: Any) {
        if currentAnswer == "middle" {
            currentAnswer = "elephant"
        } else {
            showAlert()
        }
    }
    
    @IBAction func answerSecond(_ sender: Any) {
        if currentAnswer == "dog" {
            cntAnswer += 1
            currentAnswer = ""
            choiceSecond.isHidden = true
            choiceDog.isHidden = true
            if cntAnswer == 3 {
                btnNext.isHidden = false
            }
        } else {
            showAlert()
        }
    }
    
    
    @IBAction func answerMiddle(_ sender: Any) {
        if currentAnswer == "elephant" {
            cntAnswer += 1
            currentAnswer = ""
            choiceMiddle.isHidden = true
            choiceElephant.isHidden = true
            if cntAnswer == 3 {
                btnNext.isHidden = false
            }
        } else {
            showAlert()
        }
    }
    
    
    @IBAction func answerFirst(_ sender: Any) {
        if currentAnswer == "cat" {
            cntAnswer += 1
            currentAnswer = ""
            choiceFirst.isHidden = true
            choiceCat.isHidden = true
            if cntAnswer == 3 {
                btnNext.isHidden = false
            }
        } else {
            showAlert()
        }
    }
    
    
    @IBAction func nextPage(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "chapter1_67")
        self.present(vc!, animated: true, completion: nil)
    }
    
}
