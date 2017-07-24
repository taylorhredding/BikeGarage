//
//  MenuViewController.swift
//  BikeGarage
//
//  Created by Taylor Redding on 6/30/17.
//  Copyright © 2017 Taylor Redding. All rights reserved.
//

import UIKit
import SideMenu
import Firebase

class MenuViewController: UIViewController {
    
    @IBOutlet weak var homeBtn: UIButton!
    @IBOutlet weak var bikeBtn: UIButton!
    @IBOutlet weak var accountBtn: UIButton!
    @IBOutlet weak var mileageBtn: UIButton!
    
    override func viewDidLoad() {
        
        if presentingViewController?.restorationIdentifier == "HomeViewController" {
            
            homeBtn.isEnabled = false
            bikeBtn.isEnabled = true
            accountBtn.isEnabled = true
            mileageBtn.isEnabled = true
            
        }else if presentingViewController?.restorationIdentifier == "BikeViewController" {
            
            homeBtn.isEnabled = true
            bikeBtn.isEnabled = false
            accountBtn.isEnabled = true
            mileageBtn.isEnabled = true
            
        }else if presentingViewController?.restorationIdentifier == "AccountViewController" {
            
            homeBtn.isEnabled = true
            bikeBtn.isEnabled = true
            accountBtn.isEnabled = false
            mileageBtn.isEnabled = true
            
        }else if presentingViewController?.restorationIdentifier == "MileageViewController" {
            
            homeBtn.isEnabled = true
            bikeBtn.isEnabled = true
            accountBtn.isEnabled = true
            mileageBtn.isEnabled = false
            
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
                
                let bikeVC:UINavigationController = self.storyboard?.instantiateViewController(withIdentifier: "bikeNavController") as! UINavigationController
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
    @IBAction func accountTapped(_ sender: Any) {
        
        let preVC:UIViewController = self.presentingViewController!
        print(preVC.restorationIdentifier!)
        
        self.dismiss(animated: true) {
            DispatchQueue.main.async {
                
                let actVC:UINavigationController = self.storyboard?.instantiateViewController(withIdentifier: "AccountNavController") as! UINavigationController
                preVC.present(actVC, animated: false, completion: nil)
                
            }
        }
        
    }

    @IBAction func mileageTapped(_ sender: Any) {
        
        let preVC:UIViewController = self.presentingViewController!
        print(preVC.restorationIdentifier!)
        
        self.dismiss(animated: true) {
            DispatchQueue.main.async {
                
                let mileVC:MileageViewController = self.storyboard?.instantiateViewController(withIdentifier: "MileageViewController") as! MileageViewController
                preVC.present(mileVC, animated: false, completion: nil)
                
            }
        }
    }
    
    @IBAction func logoutTapped(_ sender: Any) {
        
        let preVC:UIViewController = self.presentingViewController!
        print(preVC.restorationIdentifier!)
        
        self.dismiss(animated: true) {
            DispatchQueue.main.async {
                
                let logInVC:LogInViewController = self.storyboard?.instantiateViewController(withIdentifier: "LogInViewController") as! LogInViewController
                preVC.present(logInVC, animated: true) {
                    do {
                        try Auth.auth().signOut()
                    } catch (let error) {
                        print((error as NSError).code)
                    }
                }
            }
        }
    }
}
