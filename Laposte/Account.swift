//
//  MonCompte.swift
//  Laposte
//
//  Created by Flavien SICARD on 18/03/2015.
//  Copyright (c) 2015 Flavien SICARD. All rights reserved.
//

import UIKit

class Account: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var myTableView: UITableView!
    
    let TFTableView = ["NOM", "PRENOM", "TELEPHONE", "ADRESSE", "CODE POSTAL", "VILLE"]
    let InitTFTableView = ["DUPOND", "Jean", "0649143976", "16 Boulevard du Jeu de Paume", "34000", "Montpellier"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
   /*     NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWasShown:", name: UIKeyboardDidShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillBeHidden:", name: UIKeyboardWillHideNotification, object: nil)*/
    }
    
    func keyboardWasShown (notification: NSNotification) {
        var info = notification.userInfo
        
        myTableView.contentInset = UIEdgeInsetsMake(0, 0, 432, 0)
        myTableView.scrollIndicatorInsets = myTableView.contentInset
    }
    
    func keyboardWillBeHidden (notification: NSNotification) {
        myTableView.contentInset = UIEdgeInsetsZero
        myTableView.scrollIndicatorInsets = UIEdgeInsetsZero
    }
    
    /*
    ** Table View
    */
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TFTableView.count
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "INFORMATION EXPEDITEUR"
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell:TFCell!
        
        cell = tableView.dequeueReusableCellWithIdentifier("TFMonCompte") as TFCell
        cell.selectionStyle = UITableViewCellSelectionStyle.None
        cell.TextField.placeholder = TFTableView[indexPath.row]
        cell.TextField.text = InitTFTableView[indexPath.row]
        return cell
    }

    
}
