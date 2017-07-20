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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func changeTapped(_ sender: Any) {
        
        //make sure they entered somthing in the current text box.
        if currentPasswordTxt.text != "" {
            
            //make sure the new password matches
            if newPasswordTxt.text == confirmNewPasswordTxt.text {
                
                Auth.auth().currentUser?.updatePassword(to: newPasswordTxt.text!, completion: { (error) in
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
            
        }else{
            
            let alertController = UIAlertController(title: "You Must Enter Your Current Password", message: "We didn't recognize you, try again!", preferredStyle: UIAlertControllerStyle.alert)
            
            
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
