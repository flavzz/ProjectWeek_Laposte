//
//  TypeLetter.swift
//  Laposte
//
//  Created by Flavien SICARD on 17/03/2015.
//  Copyright (c) 2015 Flavien SICARD. All rights reserved.
//

import UIKit

class TypeLetter: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let MenuTableView = ["Lettre Recommandée", "Lettre Prioritaire", "Lettre Verte", "Ecoplie"]
    let IconeMenuTableView = ["icone_reco", "icone_prio", "icone_verte", "icone_ecopli"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Type de lettre"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    /*
    ** Table View Menu
    */
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 100
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MenuTableView.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell:MenuCell!
        
        cell = tableView.dequeueReusableCellWithIdentifier("MenuType") as MenuCell
        cell.title.text = MenuTableView[indexPath.row]
        cell.icone.image = UIImage(named: IconeMenuTableView[indexPath.row])
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        typeLetter = MenuTableView[indexPath.row]
        if (indexPath.row == 0) {
            self.performSegueWithIdentifier("assurance", sender: nil)
        } else {
            self.performSegueWithIdentifier("Poids", sender: nil)
        }
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
}
