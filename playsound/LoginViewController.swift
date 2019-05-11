//
//  LoginViewController.swift
//  playsound
//
//  Created by SiRiPonG! on 3/1/19.
//  Copyright © 2019 harvestidea. All rights reserved.
//

import UIKit
import AWSDynamoDB

class LoginViewController: UIViewController {

    @IBOutlet weak var loginContainer: UIView!
    @IBOutlet weak var logo: UIImageView!
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        renderLoginViewController()
    }
    
    func renderLoginViewController() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(LoginViewController.dismissKeyboard))
        
        let pink = UIColor(red: 242/255, green: 210/255, blue: 219/255, alpha: 1.0).cgColor
        let pinkPlaceholder = UIColor(red: 242/255, green: 210/255, blue: 219/255, alpha: 1.0)
        let pinkButton = UIColor(red: 238/255, green: 42/255, blue: 123/255, alpha: 1.0)
        let white = UIColor.white;
        let borderWidth = CGFloat(2);
        let cornerRadius = CGFloat(20);
        let viewRadius = CGFloat(40);
        let height = CGFloat(50);
        let textWidth = CGFloat(18);
        
        let landscape = UIInterfaceOrientation.landscapeLeft.rawValue;
        UIDevice.current.setValue(landscape, forKey: "orientation")
        
        view.addGestureRecognizer(tap)
        
        loginContainer.layer.cornerRadius = viewRadius;
        loginContainer.layer.borderWidth = borderWidth;
        loginContainer.layer.borderColor = pink
        
        logo.image = UIImage(named: "playsound-logo.png");
        
        username.layer.cornerRadius = cornerRadius;
        username.layer.borderWidth = borderWidth;
        username.layer.borderColor = pink;
        username.clipsToBounds = true;
        username.frame.size.height = height;
        username.borderStyle = UITextField.BorderStyle.roundedRect
        username.attributedPlaceholder = NSAttributedString(string: "Username", attributes: [NSAttributedString.Key.foregroundColor: pinkPlaceholder])
        
        password.layer.cornerRadius = cornerRadius;
        password.layer.borderWidth = borderWidth;
        password.layer.borderColor = pink;
        password.clipsToBounds = true;
        password.frame.size.height = height;
        password.borderStyle = UITextField.BorderStyle.roundedRect
        password.attributedPlaceholder = NSAttributedString(string: "Password", attributes: [NSAttributedString.Key.foregroundColor: pinkPlaceholder])
        password.isSecureTextEntry = true;
        
        loginButton.layer.cornerRadius = cornerRadius;
        loginButton.backgroundColor = pinkButton;
        loginButton.setTitleColor(white, for: UIControl.State.normal
        )
        loginButton.frame.size.height = height;
        loginButton.setTitle("LOGIN", for: UIControl.State.normal)
        loginButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: textWidth)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }

}
