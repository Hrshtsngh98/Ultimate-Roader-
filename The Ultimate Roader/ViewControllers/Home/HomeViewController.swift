//
//  HomeViewController.swift
//  The Ultimate Roader
//
//  Created by Harshit Singh on 7/23/19.
//  Copyright © 2019 Harshit Singh. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    class func fromStoryboard() -> HomeViewController? {
        let controller = instantiateController(from: "Home", with: "HomeViewController", from: nil) as? HomeViewController
        return controller
    }

}
