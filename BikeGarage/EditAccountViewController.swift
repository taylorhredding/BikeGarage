//
//  EditAccountViewController.swift
//  BikeGarage
//
//  Created by Taylor Redding on 7/19/17.
//  Copyright © 2017 Taylor Redding. All rights reserved.
//

import UIKit
import SideMenu
import Firebase

class EditAccountViewController: UIViewController {
    
    var name = ""

    @IBOutlet weak var nameTxt: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        nameTxt.text = name
    }

    @IBAction func saveTapped(_ sender: Any) {
        
        Database.database().reference().child("users").child(Auth.auth().currentUser!.uid).child("name").setValue(nameTxt.text)
        
        let actVC:AccountViewController = self.storyboard?.instantiateViewController(withIdentifier: "AccountViewController") as! AccountViewController
        present(actVC, animated: false, completion: nil)
        
    }
    
}
