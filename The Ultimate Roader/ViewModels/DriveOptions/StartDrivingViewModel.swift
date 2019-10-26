//
//  StartDrivingViewModel.swift
//  The Ultimate Roader
//
//  Created by Harshit Singh on 7/23/19.
//  Copyright © 2019 Harshit Singh. All rights reserved.
//

import UIKit
import GoogleMaps

class StartDrivingViewModel {
    var path: [CLLocation] = []
    var stringPath: String = ""
    var pathName = ""
    
    init() {}
    
    func animatedMarker() -> [UIImage] {
        var imageArr : [UIImage] = []
        for i in 1...44
        {
            imageArr.append(UIImage(named : "Anim 2_\(i)")!)
        }
        return imageArr
        
    }
    
    func addLocationToPath(location: CLLocation) {
        path.append(location)
    }
    
    func savePathFile() {
        
    }
}
