//
//  MileageViewController.swift
//  BikeGarage
//
//  Created by Taylor Redding on 7/18/17.
//  Copyright © 2017 Taylor Redding. All rights reserved.
//

import UIKit
import SideMenu

class MileageViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func menuTapped(_ sender: Any) {
        
        performSegue(withIdentifier: "mileToMenu", sender: nil)

    }

}
