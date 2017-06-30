//
//  ViewController.swift
//  BikeGarage
//
//  Created by Taylor Redding on 6/29/17.
//  Copyright © 2017 Taylor Redding. All rights reserved.
//

import UIKit
import FirebaseAuth

class LogInViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    @IBAction func loginTapped(_ sender: Any) {
        
        Auth.auth().signIn(withEmail: emailTextField.text!, password: passwordTextField.text!) { (user, error) in
            
            print("We tried to sign in")
            
            if error != nil {
                
                //we don't have an account
                
                let alertController = UIAlertController(title: "Incorrect Email and/or Password", message: "We didn't recognize you, try again!", preferredStyle: UIAlertControllerStyle.alert)
                
                
                // Replace UIAlertActionStyle.Default by UIAlertActionStyle.default
                let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) {
                    (result : UIAlertAction) -> Void in
                    print("OK")
                }
                
                alertController.addAction(okAction)
                self.present(alertController, animated: true, completion: nil)
                
            }else{
                
                print("Signed in succesfully")
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
            }
            
        }
        
    }
    @IBAction func signupTapped(_ sender: Any) {
        
        self.performSegue(withIdentifier: "createUserSegue", sender: nil)
        
    }

}

