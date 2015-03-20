//
//  Poids.swift
//  Laposte
//
//  Created by Flavien SICARD on 17/03/2015.
//  Copyright (c) 2015 Flavien SICARD. All rights reserved.
//

import UIKit

class Weight: UITableViewController {

    @IBOutlet weak var TFPoids: UITextField!
    @IBOutlet weak var TFFeuille: UITextField!
    @IBOutlet weak var Stepp: UIStepper!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Poids"
        self.Stepp.wraps = true
        self.Stepp.autorepeat = true
        self.Stepp.maximumValue = 50
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        self.view.endEditing(true)
    }

    @IBAction func valider(sender: AnyObject) {
        if (self.TFPoids.text == "")
        {
            self.alertViewBad()
        } else {
            poids = TFPoids.text + "g"
            self.performSegueWithIdentifier("destinataire", sender: nil)
        }
    }
    
    @IBAction func NbPage(sender: UIStepper) {
        self.TFFeuille.text = Int(sender.value).description
        self.TFPoids.text = "\((self.TFFeuille.text).toInt()! * 6)"
    }

    func alertViewBad() {
        var alertView:UIAlertView = UIAlertView()
        alertView.title = "Champs incomplets"
        alertView.message = "Veuillez rentrer le poids"
        alertView.delegate = self
        alertView.addButtonWithTitle("OK")
        alertView.show()
    }
    
}
