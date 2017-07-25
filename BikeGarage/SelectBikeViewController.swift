//
//  SelectBikeViewController.swift
//  BikeGarage
//
//  Created by Taylor Redding on 7/24/17.
//  Copyright © 2017 Taylor Redding. All rights reserved.
//

import UIKit
import SideMenu
import Firebase

class SelectBikeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var bikes : [Bike] = []

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self

        // Do any additional setup after loading the view.
        
        Database.database().reference().child("users").child(Auth.auth().currentUser!.uid).child("bikes").observe(DataEventType.childAdded, with: { (snapshot) in
            print(snapshot)
            
            let bike = Bike()
            let snapshotValue = snapshot.value as! NSDictionary
            
            
            bike.name = snapshotValue["bName"] as! String
            bike.frame = snapshotValue["frame"] as! String
            bike.chain = snapshotValue["chain"] as! String
            bike.frontDer = snapshotValue["frontDer"] as! String
            bike.rearDer = snapshotValue["rearDer"] as! String
            bike.brakes = snapshotValue["brakes"] as! String
            bike.cable = snapshotValue["cable"] as! String
            bike.pedal = snapshotValue["pedal"] as! String
            bike.cassette = snapshotValue["cassette"] as! String
            bike.frontChainRing = snapshotValue["frontChainRing"] as! String
            bike.uuid = snapshotValue["uuid"] as! String
            bike.active = snapshotValue["active"] as! Bool
            bike.km = snapshotValue["km"] as! Bool
            bike.key = snapshot.key
            
            
            self.bikes.append(bike)
            self.tableView.reloadData()
        })
        
        Database.database().reference().child("users").child(Auth.auth().currentUser!.uid).child("bikes").observe(DataEventType.childRemoved, with: { (snapshot) in
            print(snapshot)
            
            var index = 0
            
            for bike in self.bikes {
                
                if bike.key == snapshot.key{
                    
                    self.bikes.remove(at: index)
                }
                
                index += 1
            }
            
            self.tableView.reloadData()
            
        })
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if bikes.count == 0{
            return 1
        }else{
            return bikes.count
        }
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        if bikes.count == 0 {
            
            cell.textLabel?.text = "No bikes 😭"
            
        }else{
            let bike = bikes[indexPath.row]
            
            cell.textLabel?.text = bike.name
        }
        
        return cell
    }

}
