//
//  Chapter1_41.swift
//  playsound
//
//  Created by student on 9/4/18.
//  Copyright © 2018 harvestidea. All rights reserved.
//

import UIKit

class Chapter1_35: UIViewController {

    var choice = ""
    var cnt = 0
    
    @IBOutlet weak var btnNext: UIButton!
    
    @IBAction func nextPage(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "chapter1_36")
        self.present(vc!, animated: true, completion: nil)
    }
    
    @IBAction func lionAnswer(_ sender: Any) {
        if choice == "lion" {
            cnt += 1
            if cnt == 2 {
                btnNext.isHidden = false
            }
        } else {
            let alert = UIAlertController(title: "error", message: "you choose wrong answer", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "try again", style: .cancel, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    @IBAction func birdAnswer(_ sender: Any) {
        if choice == "bird" {
            cnt += 1
            if cnt == 2 {
                btnNext.isHidden = false
            }
        } else {
            let alert = UIAlertController(title: "error", message: "you choose wrong answer", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "try again", style: .cancel, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    @IBAction func birdButton(_ sender: Any) {
        choice = "bird"
    }
    
    @IBAction func lionButton(_ sender: Any) {
        choice = "lion"
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        btnNext.isHidden = true
        // Do any additional setup after loading the view.
    }
}
