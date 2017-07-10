//
//  MenuViewController.swift
//  BikeGarage
//
//  Created by Taylor Redding on 6/30/17.
//  Copyright © 2017 Taylor Redding. All rights reserved.
//

import UIKit
import SideMenu

class MenuViewController: UIViewController {
    
    override func viewDidLoad() {
        

        // Do any additional setup after loading the view.
        
        SideMenuManager.menuWidth = (0.75 * 240)
        SideMenuManager.menuPresentMode = .menuSlideIn
        SideMenuManager.menuAnimationPresentDuration = 0.5
        SideMenuManager.menuFadeStatusBar = false
        SideMenuManager.menuAnimationFadeStrength = 0.3
        SideMenuManager.menuPushStyle = .replace
        
        super.viewDidLoad()
    
    }
    
    @IBAction func btnTapped(_ sender: Any) {
        
        self.dismiss(animated: true) { 
            self.performSegue(withIdentifier: "BikeViewController", sender: nil)
        }
        
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        
//        let bikeVC = segue.destination as! BikeViewController
//        bikeVC.imageURL = sender as! String
//        bikeVC.descrip = descriptionTextField.text!
//        bikeVC.uuid = uuid
//
//    }

}
