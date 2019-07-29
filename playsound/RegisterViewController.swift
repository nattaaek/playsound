//
//  RegisterViewController.swift
//  playsound
//
//  Created by user153934 on 5/17/19.
//  Copyright © 2019 harvestidea. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {

    @IBOutlet weak var photoSection: UIView!
    @IBOutlet weak var addPhotoButton: UIButton!
    @IBOutlet weak var userImage: UIImageView!
    
    @IBOutlet weak var informationSection: UIView!
    @IBOutlet weak var firstnameText: UITextField!
    @IBOutlet weak var lastnameText: UITextField!
    @IBOutlet weak var birthdayText: UITextField!
    @IBOutlet weak var ageText: UITextField!
    @IBOutlet weak var genderSegment: UISegmentedControl!
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var usernameText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var createAccountButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        renderRegisterViewController()
    }
    
    func renderRegisterViewController() {
        
        let lightGreen = UIColor(red: 40/255, green: 175/255, blue: 153/255, alpha: 1)
        let white = UIColor.white.cgColor
        
        let viewCorner = CGFloat(40)
        let borderWidth = CGFloat(2)
        let componentHeight = CGFloat(50)
        
        
        photoSection.layer.cornerRadius = viewCorner
        photoSection.layer.borderWidth = borderWidth
        photoSection.layer.borderColor = UIColor(red: 116/255, green: 201/255, blue: 187/255, alpha: 1).cgColor
        
        addPhotoButton.layer.cornerRadius = getCornerRadius(height: addPhotoButton.frame.height)
        addPhotoButton.backgroundColor = lightGreen
        addPhotoButton.setTitleColor(UIColor.white, for: .normal)
        addPhotoButton.frame.size.height = 50
        addPhotoButton.setTitle("Add Your Photo", for: .normal)
        addPhotoButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        
        userImage.layer.masksToBounds = false
        userImage.clipsToBounds = true
        userImage.layer.cornerRadius = userImage.frame.height / 2
        userImage.layer.borderColor = UIColor(red: 116/255, green: 201/255, blue: 187/255, alpha: 1).cgColor
        userImage.layer.borderWidth = 1
        userImage.image = UIImage(named: "user.png")
        
        informationSection.backgroundColor = lightGreen
        informationSection.layer.cornerRadius = viewCorner
        
        firstnameText.layer.borderWidth = 1
        firstnameText.layer.borderColor = white
        firstnameText.clipsToBounds = true;
        firstnameText.frame.size.height = componentHeight
        firstnameText.layer.cornerRadius = getCornerRadius(height: firstnameText.frame.height)
        firstnameText.borderStyle = UITextField.BorderStyle.roundedRect
        firstnameText.backgroundColor = lightGreen
        firstnameText.attributedPlaceholder = NSAttributedString(string: "First name", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        firstnameText.tintColor = UIColor.white
        firstnameText.textColor = UIColor.white
        
        lastnameText.layer.borderWidth = 1
        lastnameText.layer.borderColor = white
        lastnameText.clipsToBounds = true;
        lastnameText.frame.size.height = componentHeight
        lastnameText.layer.cornerRadius = getCornerRadius(height: lastnameText.frame.height)
        lastnameText.borderStyle = UITextField.BorderStyle.roundedRect
        lastnameText.backgroundColor = lightGreen
        lastnameText.attributedPlaceholder = NSAttributedString(string: "Last name", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        lastnameText.tintColor = UIColor.white
        lastnameText.textColor = UIColor.white
    }
    
    func getCornerRadius(height: CGFloat) -> CGFloat {
        return CGFloat(height / 2)
    }
}
