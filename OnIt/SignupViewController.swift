//
//  SignupViewController.swift
//  OnIt
//
//  Created by ExpDev on 9/22/16.
//  Copyright © 2016 2Create360. All rights reserved.
//

import UIKit

class SignupViewController: UIViewController {

    @IBOutlet var textEmail: UITextField!
    @IBOutlet var textPassword: UITextField!
    @IBOutlet var textPassword2: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.hideKeyboardWhenTappedAround()
        
        textEmail.placeholder = "Email Address"
        textPassword.placeholder = "Password"
        textPassword2.placeholder = "Confirm password"
    }
    
    
    @IBAction func onClickSignup(_ sender: AnyObject) {
        self.performSegue(withIdentifier: "goToMain", sender: self)
    }
}
