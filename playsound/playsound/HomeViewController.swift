//
//  HomeViewController.swift
//  playsound
//
//  Created by SiRiPonG! on 7/11/18.
//  Copyright © 2018 harvestidea. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func continueButton(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "chapter1_1")
        self.present(vc!, animated: true, completion: nil)
    }
}
