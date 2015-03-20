//
//  ListStamp.swift
//  Laposte
//
//  Created by Flavien SICARD on 19/03/2015.
//  Copyright (c) 2015 Flavien SICARD. All rights reserved.
//

import UIKit

class ListStamp: UIViewController, UITableViewDelegate, UITableViewDataSource {

    let ListStamp = ["19/03/2015 : 9D6EF4321", "19/03/2015 : 9D6EF4321", "19/03/2015 : 9D6EF4321", "17/03/2015 : 52FA96EBC", "16/03/2015 : 9D6EF4321"]
    let IconeStamp = ["icone_prio", "icone_prio", "icone_verte", "icone_reco", "icone_verte"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Timbres Générés"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    /*
    ** Table View
    */
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ListStamp.count
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 90
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "LISTE DES TIMBRES GÉNÉRÉS"
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell:MenuCell!
        
        cell = tableView.dequeueReusableCellWithIdentifier("ListStamp") as MenuCell
        cell.selectionStyle = UITableViewCellSelectionStyle.None
        cell.title.text = ListStamp[indexPath.row]
        cell.icone.image = UIImage(named: IconeStamp[indexPath.row])
        return cell
    }
}
