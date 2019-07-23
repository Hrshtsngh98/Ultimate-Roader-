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
    var locationManager: CLLocationManager!
    var currentLocationMarker: GMSMarker!
    var viewModel: StartDrivingViewModel!
    
    class func fromStoryboard() -> StartDrivingViewController? {
        let storyboard = UIStoryboard.init(name: "Drive Options", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "StartDrivingViewController") as? StartDrivingViewController
        controller?.viewModel = StartDrivingViewModel()
        return controller
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpNavigationBar()
        setUpLocationManager()
        setUpMap()
    }
    
    func setUpNavigationBar() {
        title = "You are driving!"
        let backButton = UIBarButtonItem(title: "<", style: .done, target: self, action: #selector(backButtonAction))
        navigationItem.leftBarButtonItem = backButton
    }
    
    func setUpLocationManager() {
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        locationManager.requestAlwaysAuthorization()
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        locationManager.startUpdatingHeading()
    }
    
    func setUpMap() {
        mapView.delegate = self
        
        currentLocationMarker = GMSMarker()
        currentLocationMarker.map = mapView
        currentLocationMarker.groundAnchor = CGPoint(x: 0.5, y: 0.5)
        currentLocationMarker.icon = UIImage.animatedImage(with: viewModel.animatedMarker(), duration: 3.0)
    }
    
    func moveCameraToPosition(location: CLLocation) {
        mapView.camera = GMSCameraPosition(target: location.coordinate, zoom: 15, bearing: 0, viewingAngle: 0)
        currentLocationMarker.position = location.coordinate
        
    }
    
    @objc func backButtonAction() {
        locationManager.stopUpdatingHeading()
        locationManager.stopUpdatingLocation()
        navigationController?.popViewController(animated: true)
    }

}

extension StartDrivingViewController: GMSMapViewDelegate { }

extension StartDrivingViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let lastLocation = locations.last else { return }
        moveCameraToPosition(location: lastLocation)
        viewModel.addLocationToPath(location: lastLocation)
    }
}
