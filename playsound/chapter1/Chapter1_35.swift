//
//  Chapter1_35.swift
//  playsound
//
//  Created by student on 8/9/18.
//  Copyright © 2018 harvestidea. All rights reserved.
//

import UIKit
import AVFoundation

class Chapter1_35: UIViewController, AVAudioPlayerDelegate {


    var totalCorrect: Int = 0

    @IBOutlet weak var secondImage: UIImageView!
    @IBOutlet weak var forthImage: UIImageView!
    @IBOutlet weak var sixthImage: UIImageView!
    @IBOutlet weak var secondbtn: UIButton!
    @IBOutlet weak var thirdbtn: UIButton!
    @IBOutlet weak var sixthbtn: UIButton!
    
    @IBAction func second(_ sender: Any) {
        correctKey()
        secondImage.image = UIImage(named: "correct.png")
        secondbtn.isHidden = true
    }
    
    @IBAction func third(_ sender: Any) {
        wrongKey()
    }
    
   
    @IBAction func forth(_ sender: Any) {
        correctKey()
        forthImage.image = UIImage(named: "correct.png")
        thirdbtn.isHidden = true
    }
    
    @IBAction func fifth(_ sender: Any) {
        wrongKey()
    }
    
    @IBAction func sixth(_ sender: Any) {
        correctKey()
        sixthImage.image = UIImage(named: "correct.png")
        sixthbtn.isHidden = true
    }
    
    func correctKey() {
        totalCorrect += 1
        if totalCorrect == 3 {
            nextPage()
        }
    }
    
    func wrongKey() {
        let alert = UIAlertController(title: "Wrong answer", message: "it's have 3 keys", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "try again", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    
    func nextPage() {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "chapter1_36")
        self.present(vc!, animated: true, completion: nil)
    }
    
    var conversationSound: AVAudioPlayer = AVAudioPlayer()
    
    func audioPlay() {
        
        let path = Bundle.main.path(forResource: "p4highnote.mp3", ofType: nil)!
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
