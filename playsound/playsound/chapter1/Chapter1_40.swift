//
//  Chapter1_46.swift
//  playsound
//
//  Created by student on 9/4/18.
//  Copyright © 2018 harvestidea. All rights reserved.
//

import UIKit

class Chapter1_40: UIViewController {

    var dogAnswer = 0
    var catAnswer = 0
    var totalAnswer = 0
    var currentAnswer = ""
    
    @IBOutlet weak var nextBtn: UIButton!
    @IBAction func nextPage(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "chapter1_41")
        self.present(vc!, animated: true, completion: nil)
    }
    
    @IBAction func finalDogAnswer(_ sender: Any) {
        if currentAnswer == "dog" {
            dogAnswer += 1
            if dogAnswer == 3 {
                totalAnswer += 1
            }
            if totalAnswer == 2 {
                nextBtn.isHidden = false
            }
        }
    }
    
    @IBAction func finalCatAnswer(_ sender: Any) {
        if currentAnswer == "cat" {
            catAnswer += 1
            if catAnswer == 3 {
                totalAnswer += 1
            }
            if totalAnswer == 2 {
                nextBtn.isHidden = false
            }
        }
    }
    
    @IBAction func dogAnswer(_ sender: Any) {
        currentAnswer = "dog"
        dogAnswer += 1
        catAnswer = 0
    }
    
    @IBAction func catAnswer(_ sender: Any) {
        currentAnswer = "cat"
        catAnswer += 1
        dogAnswer = 0
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nextBtn.isHidden = true
        // Do any additional setup after loading the view.
    }
}
