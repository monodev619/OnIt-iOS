//
//  ViewController.swift
//  OnIt
//
//  Created by ExpDev on 9/21/16.
//  Copyright © 2016 2Create360. All rights reserved.
//

import UIKit

import SwiftValidator

class LoginViewController: UIViewController {

    @IBOutlet var textEmail: KUITextField!
    @IBOutlet var textPassword: KUITextField!
    @IBOutlet var btnGoogle: UIButton!
    @IBOutlet var btnFacebook: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.hideKeyboardWhenTappedAround() 
        
        textEmail.placeholder = "Email Address"
        textPassword.placeholder = "Password"
        
        var paddingLeft = ( btnGoogle.frame.width - (btnGoogle.imageView?.frame.width)! - (btnGoogle.titleLabel?.frame.width)! ) / 2
        btnGoogle.titleEdgeInsets = UIEdgeInsetsMake(0, paddingLeft, 0, 0)
        
        paddingLeft = ( btnFacebook.frame.width - (btnFacebook.imageView?.frame.width)! - (btnFacebook.titleLabel?.frame.width)! ) / 2
        btnFacebook.titleEdgeInsets = UIEdgeInsetsMake(0, paddingLeft, 0, 0)
        
    }

    @IBAction func onClickLogin(_ sender: AnyObject) {
        
        let validator = Validator()
        
        //validator.registerField(textEmail, errorLabel: emailErrorLabel, rules: [RequiredRule(), EmailRule(message: "Invalid email")])
        
        //self.performSegue(withIdentifier: "goToMain", sender: self)
    }

}

