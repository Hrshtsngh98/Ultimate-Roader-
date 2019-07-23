//
//  StartDrivingViewController.swift
//  The Ultimate Roader
//
//  Created by Harshit Singh on 7/23/19.
//  Copyright © 2019 Harshit Singh. All rights reserved.
//

import UIKit
import GoogleMaps

class StartDrivingViewController: UIViewController {

    @IBOutlet weak var mapView: GMSMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.delegate = self
    }
    
    class func fromStoryboard() -> StartDrivingViewController? {
        let storyboard = UIStoryboard.init(name: "Drive Options", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "StartDrivingViewController") as? StartDrivingViewController
        return controller
    }

}

extension StartDrivingViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
    }
}
