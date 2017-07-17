//
//  BikeViewController.swift
//  BikeGarage
//
//  Created by Taylor Redding on 7/5/17.
//  Copyright © 2017 Taylor Redding. All rights reserved.
//

import UIKit
import SideMenu

class BikeViewController: UIViewController {
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("We Made It To Bikes")
        
        
    }
    
    @IBAction func menuTapped(_ sender: Any) {
        
        performSegue(withIdentifier: "bikeToMenu", sender: nil)
    }
    

}
