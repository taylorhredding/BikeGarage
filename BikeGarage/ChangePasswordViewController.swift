//
//  ChangePasswordViewController.swift
//  BikeGarage
//
//  Created by Taylor Redding on 7/19/17.
//  Copyright © 2017 Taylor Redding. All rights reserved.
//

import UIKit
import SideMenu
import Firebase

class ChangePasswordViewController: UIViewController {

    @IBOutlet weak var confirmNewPasswordTxt: UITextField!
    @IBOutlet weak var newPasswordTxt: UITextField!
    @IBOutlet weak var currentPasswordTxt: UITextField!
    @IBOutlet weak var emailTxt: UITextField!
    
    @IBOutlet weak var chngBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        chngBtn.isEnabled = true
    }

    @IBAction func changeTapped(_ sender: Any) {
        
    
        if currentPasswordTxt.text != "" && emailTxt.text! != "" {
            
            let user = Auth.auth().currentUser
            let curPass = self.currentPasswordTxt.text!
            let email = self.emailTxt.text!
            
            let credentials = EmailAuthProvider.credential(withEmail: email, password: curPass)
            
            user?.reauthenticate(with: credentials) { error in
                print(email)
                print(curPass)
                print(error ?? "No Error!")
                
                if error != nil {
                    let alertController = UIAlertController(title: "Something Went Wrong!", message: "Please double check your email and current password to make sure it is correct.", preferredStyle: UIAlertControllerStyle.alert)
                    
                    
                    // Replace UIAlertActionStyle.Default by UIAlertActionStyle.default
                    let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) {
                        (result : UIAlertAction) -> Void in
                        print("OK")
                    }
                    
                    alertController.addAction(okAction)
                    self.present(alertController, animated: true, completion: nil)
                } else {
                    // User re-authenticated.
                    //make sure the new password matches
                    
                    if self.newPasswordTxt.text == self.confirmNewPasswordTxt.text && self.newPasswordTxt.text != "" && self.confirmNewPasswordTxt.text != "" {
                        
                        self.chngBtn.isEnabled = false
                        
                        Auth.auth().currentUser?.updatePassword(to: self.newPasswordTxt.text!, completion: { (error) in
                            let actVC:AccountViewController = self.storyboard?.instantiateViewController(withIdentifier: "AccountViewController") as! AccountViewController
                            
                            self.present(actVC, animated: true, completion: nil)
                        })
                        
                    }else{
                        
                        let alertController = UIAlertController(title: "Your Passwords Don't Match", message: "Your new password wasn't typed correctly!", preferredStyle: UIAlertControllerStyle.alert)
                        
                        
                        // Replace UIAlertActionStyle.Default by UIAlertActionStyle.default
                        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) {
                            (result : UIAlertAction) -> Void in
                            
                            print(self.newPasswordTxt.text!)
                            
                        }
                        
                        alertController.addAction(okAction)
                        self.present(alertController, animated: true, completion: nil)
                        
                    }
                }
//                }else{
//                    let alertController = UIAlertController(title: "Password Isn't Correct", message: "You entered the wrong current password.", preferredStyle: UIAlertControllerStyle.alert)
//                    
//                    
//                    // Replace UIAlertActionStyle.Default by UIAlertActionStyle.default
//                    let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) {
//                        (result : UIAlertAction) -> Void in
//                        print("OK")
//                    }
//                    
//                    alertController.addAction(okAction)
//                    self.present(alertController, animated: true, completion: nil)
//                }
            }
        }else{
            let alertController = UIAlertController(title: "You Must Enter Your Current Password", message: "Please confirm your current password.", preferredStyle: UIAlertControllerStyle.alert)
            
            
            // Replace UIAlertActionStyle.Default by UIAlertActionStyle.default
            let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) {
                (result : UIAlertAction) -> Void in
                print("OK")
            }
            
            alertController.addAction(okAction)
            self.present(alertController, animated: true, completion: nil)
        }
    }

}
