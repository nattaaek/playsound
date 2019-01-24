//
//  Chapter1_31.swift
//  playsound
//
//  Created by student on 8/8/18.
//  Copyright © 2018 harvestidea. All rights reserved.
//

import UIKit

class Chapter1_25: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    var totalPaint: Int = 0
    
    @IBAction func topright(_ sender: Any) {
        if currentColor == "black" {
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
        if currentColor == "black" {
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
        if currentColor == "black" {
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
        if currentColor == "black" {
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
        if currentColor == "black" {
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
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "chapter1_26")
        self.present(vc!, animated: true, completion: nil)
    }
    
    func wrongColor() {
        let alert = UIAlertController(title: "Wrong color", message: "you choose wrong color", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "try again", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    
    var currentColor: String = ""
    let colors = ["pink","blue","brown","cyan","green","magenta","orange","purple","red","yellow","black","lavender"]
    
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
        case "black":
            cell.backgroundColor = UIColor.black
        case "lavender":
            cell.backgroundColor = UIColor(red: 191/255, green: 148/255, blue: 228/255, alpha: 1.0)
        default:
            cell.backgroundColor = UIColor.white
        }
        
        return cell
    }
    
    
    @IBOutlet weak var colorsPalette: UICollectionView!
    
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        colorPalette.isHidden = true
        self.colorsPalette.delegate = self
        self.colorsPalette.dataSource = self
    }
}
