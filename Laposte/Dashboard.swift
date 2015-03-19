//
//  ViewController.swift
//  Laposte
//
//  Created by Flavien SICARD on 16/03/2015.
//  Copyright (c) 2015 Flavien SICARD. All rights reserved.
//

import UIKit

var typeLetter:String = ""
var assurance:String = " "
var poids:String = ""

class Dashboard: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!

    let MenuTableView = ["Affranchir une lettre", "Mon compte", "Déconnexion"]
    let IconeMenuTableView = ["icone_timbre", "icone_moncompte", "icone_disconnect"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
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

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        var cell:MenuCell!
        
        cell = tableView.dequeueReusableCellWithIdentifier("MenuDashboard") as MenuCell
        cell.title.text = MenuTableView[indexPath.row]
        cell.icone.image = UIImage(named: IconeMenuTableView[indexPath.row])
        if (cell.title.text == "Déconnexion") {
            cell.accessoryType = UITableViewCellAccessoryType.None
        }
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if (indexPath.row == 0) {
            self.performSegueWithIdentifier("type", sender: nil)
        } else if (indexPath.row == 1) {
            self.performSegueWithIdentifier("compte", sender: nil)
        } else if (indexPath.row == 2) {
            dismissViewControllerAnimated(true, completion: { () -> Void in })
        }
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
        
}

