//
//  Map.swift
//  Laposte
//
//  Created by Flavien SICARD on 18/03/2015.
//  Copyright (c) 2015 Flavien SICARD. All rights reserved.
//

import UIKit
import MapKit

class MailboxMap: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Boite aux Lettres"
        let location = CLLocationCoordinate2D(latitude: 45.754505, longitude: 4.859013)
        let span = MKCoordinateSpanMake(0.05, 0.05)
        let region = MKCoordinateRegion(center: location, span: span)
        let annotation = MKPointAnnotation()
        
        mapView.setRegion(region, animated: true)
        annotation.setCoordinate(location)
        annotation.title = "Big Ben"
        annotation.subtitle = "London"
        mapView.addAnnotation(annotation)
    }
    
    @IBAction func `return`(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: { () -> Void in })
    }
}
