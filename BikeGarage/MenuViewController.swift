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
    
    @IBAction func bikeTapped(_ sender: Any) {
        
        let homeVC:HomeViewController = self.presentingViewController! as! HomeViewController
        print(homeVC.restorationIdentifier!)
        
        self.dismiss(animated: true) {
            DispatchQueue.main.async {
                
                let bikeVC:BikeViewController = self.storyboard?.instantiateViewController(withIdentifier: "BikeViewController") as! BikeViewController
                homeVC.present(bikeVC, animated: false, completion: nil)
                
            }
        }
    }
    

}
