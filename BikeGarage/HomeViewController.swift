//
//  HomeViewController.swift
//  BikeGarage
//
//  Created by Taylor Redding on 6/30/17.
//  Copyright © 2017 Taylor Redding. All rights reserved.
//

import UIKit
import SideMenu

class HomeViewController: UIViewController {
       

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func menuTapped(_ sender: Any) {
        
        performSegue(withIdentifier: "homeToMenu", sender: nil)
        
    }
    
    
    

}
