//
//  Chapter1_58.swift
//  playsound
//
//  Created by SiRiPonG! on 25/12/18.
//  Copyright © 2018 harvestidea. All rights reserved.
//

import UIKit
import AVFoundation

class Chapter1_62: UIViewController, AVAudioPlayerDelegate, UICollectionViewDelegate, UICollectionViewDataSource {

  
    var currentColor: String = ""
    let colors = ["pink","blue","brown","cyan","green","magenta","orange","black","red","yellow","salmon","lavender"]
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return colors.count
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        currentColor = colors[indexPath.row]
        
        removeColor()
    }
    @IBOutlet weak var blueOneButton: UIButton!
    @IBAction func blueOneController(_ sender: Any) {
        if currentColor == "blue" {            blueTwoButton.isHidden = false
            blueOneButton.isHidden = true
        } else {
            wrongChoice()
        }
    }
    
    
    @IBOutlet weak var blueTwoButton: UIButton!
    @IBAction func blueTwoController(_ sender: Any) {
        if currentColor == "blue" {            blueThreeButton.isHidden = false
            blueTwoButton.isHidden = true
        } else {
            wrongChoice()
        }
    }
    
    
    @IBOutlet weak var blueThreeButton: UIButton!
    @IBAction func blueThreeController(_ sender: Any) {
        if currentColor == "blue" {            nextBtn.isHidden = false
            blueThreeButton.isHidden = true
        } else {
            wrongChoice()
        }
    }
    
    @IBAction func wrongButton(_ sender: Any) {
        wrongChoice()
    }
    func wrongChoice() {
        let alert = UIAlertController(title: "error", message: "you doing wrong", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Try again", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBOutlet weak var nextBtn: UIButton!
    
    @IBAction func nextPage(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "chapter1_63")
        self.present(vc!, animated: true, completion: nil)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = colorsPalette.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        
        switch colors[indexPath.row] {
        case "pink":
            cell.backgroundColor = UIColor(red: 255/255, green: 192/255, blue: 203/255, alpha: 1.0)
        case "blue":
            cell.backgroundColor = UIColor.blue
        case "brown":
            cell.backgroundColor = UIColor.brown
        case "cyan":
            cell.backgroundColor = UIColor.cyan
        case "green":
            cell.backgroundColor = UIColor.green
        case "magenta":
            cell.backgroundColor = UIColor.magenta
        case "orange":
            cell.backgroundColor = UIColor.orange
        case "black":
            cell.backgroundColor = UIColor.black
        case "red":
            cell.backgroundColor = UIColor.red
        case "yellow":
            cell.backgroundColor = UIColor.yellow
        case "salmon":
            cell.backgroundColor = UIColor(red: 253/255, green: 171/255, blue: 159/255, alpha: 1.0)
        case "lavender":
            cell.backgroundColor = UIColor(red: 191/255, green: 148/255, blue: 228/255, alpha: 1.0)
        default:
            cell.backgroundColor = UIColor.white
        }
        
        return cell
    }
    
    
    
    
    @IBOutlet weak var colorsPalette: UICollectionView!
    
    var conversationSound: AVAudioPlayer = AVAudioPlayer()
    var isShow = 1
    
    @IBOutlet weak var colorPalette: UIView!
    
    @IBAction func showColorPalete(_ sender: Any) {
        
        if isShow == 0 {
            colorPalette.isHidden = true
            isShow = 1
        }
        else {
            colorPalette.isHidden = false
            isShow = 0
        }
    }
    
    func audioPlay() {
        
        let path = Bundle.main.path(forResource: "conversation", ofType: "mp3")!
        let url = URL(fileURLWithPath: path)
        do {
            conversationSound = try AVAudioPlayer(contentsOf: url)
            conversationSound.delegate = self
            conversationSound.play()
        } catch {
            print(error)
        }
        
    }
    
    func removeColor() {
        if isShow == 0 {
            colorPalette.isHidden = true
            isShow = 1
        }
        else {
            colorPalette.isHidden = false
            isShow = 0
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nextBtn.isHidden = true
        colorPalette.isHidden = true
        audioPlay()
        self.colorsPalette.delegate = self
        self.colorsPalette.dataSource = self
    }
}
