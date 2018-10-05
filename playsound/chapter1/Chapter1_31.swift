//
//  Chapter1_31.swift
//  playsound
//
//  Created by student on 8/8/18.
//  Copyright © 2018 harvestidea. All rights reserved.
//

import UIKit
import AVFoundation

class Chapter1_31: UIViewController, AVAudioPlayerDelegate, UICollectionViewDataSource, UICollectionViewDelegate {

    var totalPaint: Int = 0
    
    @IBAction func topright(_ sender: Any) {
        if currentColor == "pink" {
            totalPaint += 1
            if totalPaint == 5 {
                nextPage()
            }
        }
        else {
            wrongColor()
        }
    }
    @IBAction func topleft(_ sender: Any) {
        if currentColor == "pink" {
            totalPaint += 1
            if totalPaint == 5 {
                nextPage()
            }
        }
        else {
            wrongColor()
        }
    }
    @IBAction func center(_ sender: Any) {
        if currentColor == "pink" {
            totalPaint += 1
            if totalPaint == 5 {
                nextPage()
            }
        }
        else {
            wrongColor()
        }
    }
    @IBAction func bottomright(_ sender: Any) {
        if currentColor == "pink" {
            totalPaint += 1
            if totalPaint == 5 {
                nextPage()
            }
        }
        else {
            wrongColor()
        }
    }
    @IBAction func bottomleft(_ sender: Any) {
        if currentColor == "pink" {
            totalPaint += 1
            if totalPaint == 5 {
                nextPage()
            }
        }
        else {
            wrongColor()
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
    
    func nextPage() {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "chapter1_32")
        self.present(vc!, animated: true, completion: nil)
    }
    
    func wrongColor() {
        let alert = UIAlertController(title: "Wrong color", message: "you choose wrong color", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "try again", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    
    var currentColor: String = ""
    let colors = ["pink","blue","brown","cyan","green","magenta","orange","purple","red","yellow","salmon","lavender"]
    
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
        case "purple":
            cell.backgroundColor = UIColor.purple
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
        colorPalette.isHidden = true
        audioPlay()
        self.colorsPalette.delegate = self
        self.colorsPalette.dataSource = self
    }
}
