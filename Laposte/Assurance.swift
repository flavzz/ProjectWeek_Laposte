//
//  Assurance.swift
//  Laposte
//
//  Created by Flavien SICARD on 17/03/2015.
//  Copyright (c) 2015 Flavien SICARD. All rights reserved.
//

import UIKit

class Assurance: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let MenuTableView = ["R1", "R2", "R3", "R4"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Assurance"
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
        
        cell = tableView.dequeueReusableCellWithIdentifier("Menu") as MenuCell
        cell.title.text = MenuTableView[indexPath.row]
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        assurance = " " + MenuTableView[indexPath.row] + " "
        self.performSegueWithIdentifier("Poid2", sender: nil)
    }
}
