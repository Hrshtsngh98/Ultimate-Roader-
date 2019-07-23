//
//  HomeViewController.swift
//  The Ultimate Roader
//
//  Created by Harshit Singh on 7/23/19.
//  Copyright © 2019 Harshit Singh. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, Theme {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = baseThemeColor
    }
    
    class func fromStoryboard() -> HomeViewController? {
        let storyboard = UIStoryboard.init(name: "Home", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "HomeViewController") as? HomeViewController
        return controller
    }

    @IBAction func signoutButtonAction(_ sender: UIButton) {
        if let controller = LoginViewController.fromStoryboard() {
            swapController(with: controller)
        }
    }
    
    @IBAction func startDrivingButtonAction(_ sender: UIButton) {
        if let controller = StartDrivingViewController.fromStoryboard() {
            navigationController?.pushViewController(controller, animated: true)
        }
    }
}
