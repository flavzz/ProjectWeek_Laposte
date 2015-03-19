//
//  Paiement.swift
//  Laposte
//
//  Created by Flavien SICARD on 18/03/2015.
//  Copyright (c) 2015 Flavien SICARD. All rights reserved.
//

import UIKit

class Payment: UIViewController {

    @IBOutlet weak var View1: UIView!
    @IBOutlet weak var View2: UIView!
    
    var notif:Bool = false;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Paiement"
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("keyboardWillShow:"), name:UIKeyboardWillShowNotification, object: nil);
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("keyboardWillHide:"), name:UIKeyboardWillHideNotification, object: nil);
    }
    
    func keyboardWillShow(sender: NSNotification) {
        if (self.notif == false) {
            self.View1.frame.origin.y -= 50
            self.View2.frame.origin.y -= 50
            self.notif = true
        }
    }
    func keyboardWillHide(sender: NSNotification) {
        if (self.notif == true) {
            self.View1.frame.origin.y += 50
            self.View2.frame.origin.y += 50
            self.notif = false
        }
    }
 
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        self.view.endEditing(true)
    }
    
    @IBAction func Valider(sender: AnyObject) {
        self.performSegueWithIdentifier("CUA", sender: nil)
    }
    
}
