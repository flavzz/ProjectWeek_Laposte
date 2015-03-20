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

    var MenuTableView = ["Affranchir une lettre", "Timbres générés", "Mon compte", "Déconnexion"]
    var IconeMenuTableView = ["icone_timbre", "icone_list_timbre", "icone_moncompte", "icone_disconnect"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if (stateInvit == true)
        {
            MenuTableView = ["Affranchir une lettre", "Déconnexion"]
            IconeMenuTableView = ["icone_timbre", "icone_disconnect"]
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
 
    /*
    ** Table View Menu
    */
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 90
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
        if (MenuTableView[indexPath.row] == "Affranchir une lettre") {
            self.performSegueWithIdentifier("type", sender: nil)
        } else if (MenuTableView[indexPath.row] == "Timbres générés") {
            self.performSegueWithIdentifier("liste", sender: nil)
        } else if (MenuTableView[indexPath.row] == "Mon compte") {
            self.performSegueWithIdentifier("compte", sender: nil)
        } else if (MenuTableView[indexPath.row] == "Déconnexion") {
            dismissViewControllerAnimated(true, completion: { () -> Void in })
        }
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
        
}

