//
//  AccountViewController.swift
//  BikeGarage
//
//  Created by Taylor Redding on 7/18/17.
//  Copyright © 2017 Taylor Redding. All rights reserved.
//

import UIKit
import SideMenu

class AccountViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        print("AccountVC")
    }

    @IBAction func menuTapped(_ sender: Any) {
        
        performSegue(withIdentifier: "accountToMenu", sender: nil)
        
    }
}
