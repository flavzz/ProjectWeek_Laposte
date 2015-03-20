//
//  Affranchir.swift
//  Laposte
//
//  Created by Flavien SICARD on 17/03/2015.
//  Copyright (c) 2015 Flavien SICARD. All rights reserved.
//

import UIKit
import AVFoundation

class CUA: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var Timbre: UILabel!
    
    let MenuTableView = ["Géolocaliser une boite", "Prendre un rendez-vous"]
    let IconeMenuTableView = ["icone_geo", "icone_RV"]
    let synth = AVSpeechSynthesizer()
    var token = ""
    var myUtterance = AVSpeechUtterance(string: "")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "CUA"
        self.displayToken()
    }
    
    func displayToken()
    {
        var tmp = typeLetter + assurance + poids
        var label:UILabel = UILabel()
        var Size:CGSize = CGSize(width: (view.frame.width) / 2.9, height: 0)
        
        self.token = Token().Get("Flavien")
        label.text = token
        label.font = UIFont.systemFontOfSize((125 * view.frame.width) / 768)
        label.numberOfLines = 0
        label.textAlignment = NSTextAlignment.Center
        Size = label.sizeThatFits(Size)
        label.frame.origin = CGPoint(x: view.frame.width  / 3, y: ((view.frame.height - Size.height - 200) / 2 + 30))
        label.textColor = UIColor.blackColor()
        label.frame.size = Size
        label.tag = 2323
        
        var Tap = UITapGestureRecognizer(target: self, action: Selector("DetecTap:"))
        Tap.numberOfTapsRequired = 3
        view.addGestureRecognizer(Tap)

        self.view.addSubview(label)

        var txt:UILabel = UILabel(frame: CGRect(x: 0, y: label.frame.origin.y + label.frame.size.height + 10, width: view.frame.width, height: 20))
        txt.text = tmp;
        txt.textAlignment = NSTextAlignment.Center
        self.view.addSubview(txt)
    }
    
    func DetecTap(sender:UITapGestureRecognizer) {
        myUtterance = AVSpeechUtterance(string: "Votre code timbre est le suivant ")
        myUtterance.rate = 0.05
        synth.speakUtterance(myUtterance)
        for i in 0 ... 8 {
            myUtterance = AVSpeechUtterance(string: token[i])
            myUtterance.rate = 0.05
            synth.speakUtterance(myUtterance)
        }
    }
    
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
        
        cell = tableView.dequeueReusableCellWithIdentifier("menu") as MenuCell
        cell.title.text = MenuTableView[indexPath.row]
        cell.icone.image = UIImage(named: IconeMenuTableView[indexPath.row])
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if (indexPath.row == 0) {
            self.performSegueWithIdentifier("geolocalisation", sender: nil)
        } else if (indexPath.row == 1) {
            self.alertViewGood()
        }
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    func alertViewGood() {
        var alertView:UIAlertView = UIAlertView()
        alertView.title = "Envoyé !"
        alertView.message = "Votre facteur viendra récupérer votre lettre"
        alertView.delegate = self
        alertView.addButtonWithTitle("OK")
        alertView.show()
    }
    
    
}
