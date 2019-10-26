//
//  StartDrivingViewController.swift
//  The Ultimate Roader
//
//  Created by Harshit Singh on 7/23/19.
//  Copyright © 2019 Harshit Singh. All rights reserved.
//

import UIKit
import GoogleMaps

class StartDrivingViewController: UIViewController, Theme {

    @IBOutlet weak var mapView: GMSMapView!
    var locationManager: CLLocationManager!
    var currentLocationMarker: GMSMarker!
    var viewModel: StartDrivingViewModel!
    var polyline = GMSPolyline()
    var gmsPath = GMSMutablePath()
    
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
    
//    func start_trip() {
//        gmsPath.removeAllCoordinates()
//        databaseRef = Database.database().reference().child("Paths").childByAutoId()
//        path = Path()
//        path?.pathID = databaseRef?.key
//        ManagePath.addInitialPath(pathID: (path?.pathID)!)
//    }
    
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
    
    func addLocationToPolylinePath(location: CLLocation) {
        gmsPath.add(location.coordinate)
        polyline.path = gmsPath
        polyline.strokeColor = pathColor
        polyline.strokeWidth = 5
        polyline.zIndex = 10
        CATransaction.begin()
        CATransaction.setAnimationDuration(2.0)
        polyline.map = mapView
        CATransaction.commit()
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
        viewModel.addLocationToPath(location: lastLocation)
        moveCameraToPosition(location: lastLocation)
        addLocationToPolylinePath(location: lastLocation)
    }
}
