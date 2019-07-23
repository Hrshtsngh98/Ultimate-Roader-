//
//  UIViewController+Util.swift
//  The Ultimate Roader
//
//  Created by Harshit Singh on 7/23/19.
//  Copyright © 2019 Harshit Singh. All rights reserved.
//

import UIKit

typealias StoryboardName = String
typealias ViewControllerIdentifier = String

extension UIViewController {
    
    func swapController(with controller: UIViewController) {
        guard let appDelegate = UIApplication.shared.delegate as?  AppDelegate else { return }
        appDelegate.window?.rootViewController = controller
    }

}
