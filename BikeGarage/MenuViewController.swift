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
    
    @IBOutlet weak var homeBtn: UIButton!
    @IBOutlet weak var bikeBtn: UIButton!
    
    override func viewDidLoad() {
        
        if presentingViewController?.restorationIdentifier == "HomeViewController" {
            
            homeBtn.isEnabled = false
            bikeBtn.isEnabled = true
            
        }else if presentingViewController?.restorationIdentifier == "BikeViewController" {
            
            homeBtn.isEnabled = true
            bikeBtn.isEnabled = false
            
        }

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
        
        let preVC:UIViewController = self.presentingViewController!
        print(preVC.restorationIdentifier!)
        
        self.dismiss(animated: true) {
            DispatchQueue.main.async {
                
                let bikeVC:BikeViewController = self.storyboard?.instantiateViewController(withIdentifier: "BikeViewController") as! BikeViewController
                preVC.present(bikeVC, animated: false, completion: nil)
                
            }
        }
    }
    
    @IBAction func homeTapped(_ sender: Any) {
        
        let preVC:UIViewController = self.presentingViewController!
        print(preVC.restorationIdentifier!)
        
        self.dismiss(animated: true) {
            DispatchQueue.main.async {
                
                let homeVC:HomeViewController = self.storyboard?.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
                preVC.present(homeVC, animated: false, completion: nil)
                
            }
        }
    }

}
