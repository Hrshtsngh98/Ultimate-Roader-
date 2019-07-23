//
//  Theme.swift
//  The Ultimate Roader
//
//  Created by Harshit Singh on 7/23/19.
//  Copyright © 2019 Harshit Singh. All rights reserved.
//

import UIKit

protocol Theme {
    var baseThemeColor: UIColor { get }
}

extension Theme {
    var baseThemeColor: UIColor {
        return UIColor.roaderLightThemeColor()
    }
    
}
