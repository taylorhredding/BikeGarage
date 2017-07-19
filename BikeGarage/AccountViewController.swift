//
//  AccountViewController.swift
//  BikeGarage
//
//  Created by Taylor Redding on 7/18/17.
//  Copyright © 2017 Taylor Redding. All rights reserved.
//

import UIKit
import SideMenu
import Firebase

class AccountViewController: UIViewController {

    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var emailLbl: UILabel!
    var name = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        Database.database().reference().child("users").child(Auth.auth().currentUser!.uid).observeSingleEvent(of: .value, with: { (snapshot) in
            
            if !snapshot.exists() { return }
            self.name = snapshot.childSnapshot(forPath: "name").value as! String
            let email = snapshot.childSnapshot(forPath: "email").value as! String

            self.nameLbl.text = "Name: \(self.name)"
            self.emailLbl.text = "Email: \(email)"
            
            
        })
    }

    @IBAction func menuTapped(_ sender: Any) {
        
        performSegue(withIdentifier: "accountToMenu", sender: nil)
        
    }
    
    @IBAction func editTapped(_ sender: Any) {
        
        performSegue(withIdentifier: "editAccount", sender: name)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "editAccount"{
            let nextVC = segue.destination as! EditAccountViewController
            nextVC.name = name
        }else{
            print("We Skipped")
        }
    }
    
    
}
