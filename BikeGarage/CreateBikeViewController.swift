//
//  CreateBikeViewController.swift
//  BikeGarage
//
//  Created by Taylor Redding on 7/24/17.
//  Copyright © 2017 Taylor Redding. All rights reserved.
//

import UIKit
import SideMenu
import Firebase

class CreateBikeViewController: UIViewController {

    @IBOutlet weak var nameTxt: UITextField!
    @IBOutlet weak var frameTxt: UITextField!
    @IBOutlet weak var chainTxt: UITextField!
    @IBOutlet weak var frntDerTxt: UITextField!
    @IBOutlet weak var rearDerTxt: UITextField!
    @IBOutlet weak var casTxt: UITextField!
    @IBOutlet weak var chainringTxt: UITextField!
    @IBOutlet weak var cablesTxt: UITextField!
    @IBOutlet weak var brakeTxt: UITextField!
    @IBOutlet weak var pedalsTxt: UITextField!
    
    
    @IBOutlet weak var frameLifeTxt: UITextField!
    @IBOutlet weak var chainLifeTxt: UITextField!
    @IBOutlet weak var frntDerLifeTxt: UITextField!
    @IBOutlet weak var rearDerLifeTxt: UITextField!
    @IBOutlet weak var casLifeTxt: UITextField!
    @IBOutlet weak var chainringLifeTxt: UITextField!
    @IBOutlet weak var cablesLifeTxt: UITextField!
    @IBOutlet weak var brakeLifeTxt: UITextField!
    @IBOutlet weak var pedalsLifeTxt: UITextField!
    
    @IBOutlet weak var activeBool: UISwitch!
    @IBOutlet weak var kiloBool: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        kiloBool.isOn = false
        activeBool.isOn = false

        // Do any additional setup after loading the view.
    }
    

    @IBAction func saveBtn(_ sender: Any) {
        
        var isKilo = ""
        var isActive = ""
        
        //set constants
        if kiloBool.isOn == false{
            isKilo = "no"
        }else{
            isKilo = "yes"
        }
        
        if activeBool.isOn == false{
            isActive = "no"
        }else{
            isActive = "yes"
        }
        
        Database.database().reference().child("users").child(Auth.auth().currentUser!.uid).child("bikes").child("bName").setValue(nameTxt.text)
        
        //set item
        let bike = ["bName":nameTxt.text, "kilometers":isKilo, "active":isActive, "frame":frameTxt.text, "chain":chainTxt.text, "frontDer":frntDerTxt.text, "rearDer":rearDerTxt.text, "cassette":casTxt.text, "chainring":chainringTxt.text, "cables":cablesTxt.text, "brakes":brakeTxt.text, "pedals":pedalsTxt.text, "frameLife":frameLifeTxt.text, "chainLife":chainLifeTxt.text, "frontDerLife":frntDerLifeTxt.text, "rearDerLife":rearDerLifeTxt.text, "cassetteLife":casLifeTxt.text, "chainringLife":chainringLifeTxt.text, "cablesLife":cablesLifeTxt.text, "brakesLife":brakeLifeTxt.text, "pedalsLife":pedalsLifeTxt.text]
        
        Database.database().reference().child("users").child(Auth.auth().currentUser!.uid).child("bikes").childByAutoId().setValue(bike)
        
        //dismiss ourselves
//        self.dismiss(animated: true, completion: nil)
        
    }

}
