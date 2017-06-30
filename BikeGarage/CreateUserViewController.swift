//
//  CreateUserViewController.swift
//  BikeGarage
//
//  Created by Taylor Redding on 6/30/17.
//  Copyright © 2017 Taylor Redding. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase

class CreateUserViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func createAccountTapped(_ sender: Any) {
        
        if passwordTextField.text == confirmPasswordTextField.text{
            
            print("We did it")
            
            Auth.auth().createUser(withEmail: emailTextField.text!, password: passwordTextField.text!, completion: { (user, error) in
                
                if error != nil {
                    
                    print("Hey we have an error:\(error)")
                    
                    //show user error
                    let alertController = UIAlertController(title: "Easy There Cowboy!", message: "Passwords must be more then 6 characters!", preferredStyle: UIAlertControllerStyle.alert)
                    
                    let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) {
                        (result : UIAlertAction) -> Void in
                        print("OK")
                    }
                    
                    alertController.addAction(okAction)
                    self.present(alertController, animated: true, completion: nil)
                    
                } else {
                    
                    print("Created User Successfully")
                    
                    Database.database().reference().child("users").child(user!.uid).child("email").setValue(user!.email)
                    Database.database().reference().child("users").child(user!.uid).child("name").setValue(self.nameTextField.text)
                    
                    self.performSegue(withIdentifier: "signinSegue", sender: nil)
                    
                }
            })
            
        }else{
            
            let alertController = UIAlertController(title: "Passwords Don't Match", message: "We got your back, try again!", preferredStyle: UIAlertControllerStyle.alert)
            
            
            // Replace UIAlertActionStyle.Default by UIAlertActionStyle.default
            let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) {
                (result : UIAlertAction) -> Void in
                print("OK")
            }
            
            alertController.addAction(okAction)
            self.present(alertController, animated: true, completion: nil)
            
        }
        
    }
    
    
    @IBAction func backTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}
