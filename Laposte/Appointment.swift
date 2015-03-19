//
//  notification.swift
//  Laposte
//
//  Created by Flavien SICARD on 18/03/2015.
//  Copyright (c) 2015 Flavien SICARD. All rights reserved.
//

import UIKit

class Appointment: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Rendez-Vous"
    }
    
    @IBAction func `return`(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: { () -> Void in })
    }

}
