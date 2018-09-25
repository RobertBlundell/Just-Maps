//
//  directionToPlaceModel.swift
//  Just Maps
//
//  Created by Robert Blundell on 18/12/2017.
//  Copyright © 2017 Robert Blundell. All rights reserved.
//

import UIKit

struct directionToPlace : Codable {
    struct Routes : Codable {
        let geometry: String
    }
//    struct waypoints : Codable {}
    let routes: [Routes]
}
