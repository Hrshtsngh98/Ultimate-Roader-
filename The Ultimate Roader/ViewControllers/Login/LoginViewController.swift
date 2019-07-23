//
//  LoginViewController.swift
//  The Ultimate Roader
//
//  Created by Harshit Singh on 7/23/19.
//  Copyright © 2019 Harshit Singh. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    class func fromStoryboard() -> LoginViewController? {        
        let storyboard = UIStoryboard.init(name: "Login", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "LoginViewController") as? LoginViewController
        return controller
    }

    @IBAction func loginButtonAction(_ sender: UIButton) {
        if let controller = HomeViewController.fromStoryboard() {
            swapController(with: controller)
        }
    }
    
}
