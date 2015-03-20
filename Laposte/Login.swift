//
//  Login.swift
//  Laposte
//
//  Created by Flavien SICARD on 17/03/2015.
//  Copyright (c) 2015 Flavien SICARD. All rights reserved.
//

import UIKit

var stateInvit:Bool = false

class Login: UIViewController {

    @IBOutlet weak var TFLogin: UITextField!
    @IBOutlet weak var TFMDP: UITextField!
    @IBOutlet weak var Button: UIButton!
    @IBOutlet weak var Logo: UIImageView!
    
    var notif:Bool = false;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("keyboardWillShow:"), name:UIKeyboardWillShowNotification, object: nil);
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("keyboardWillHide:"), name:UIKeyboardWillHideNotification, object: nil);
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }

    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        self.view.endEditing(true)
    }
    
    func keyboardWillShow(sender: NSNotification) {
        if (self.notif == false) {
            self.TFLogin.frame.origin.y -= 50
            self.TFMDP.frame.origin.y -= 50
            self.Button.frame.origin.y -= 50
            self.Logo.frame.origin.y -= 50
            self.notif = true
        }
    }
    func keyboardWillHide(sender: NSNotification) {
        if (self.notif == true) {
            self.TFLogin.frame.origin.y += 50
            self.TFMDP.frame.origin.y += 50
            self.Button.frame.origin.y += 50
            self.Logo.frame.origin.y += 50
            self.notif = false
        }
    }
    
    func alertViewBadLogin() {
        var alertView:UIAlertView = UIAlertView()
        
        alertView.title = "Connexion Impossible"
        alertView.message = "Veuillez vérifier les identifiants"
        alertView.delegate = self
        alertView.addButtonWithTitle("OK")
        alertView.show()
    }
    
    @IBAction func connexion(sender: AnyObject) {
        if (self.TFLogin.text == "" && self.TFMDP.text == "")
        {
            self.TFLogin.text = ""
            usleep(250000)
            stateInvit = false
            self.performSegueWithIdentifier("dashboard", sender: nil)
        } else {
            alertViewBadLogin()
        }
        self.TFMDP.text = ""
    }
    
    @IBAction func connexion_invite(sender: AnyObject) {
        stateInvit = true
        self.performSegueWithIdentifier("dashboard", sender: nil)
    }
    
}
