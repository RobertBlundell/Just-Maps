//
//  onboardingPlaceCell.swift
//  Just Maps
//
//  Created by Robert Blundell on 11/12/2017.
//  Copyright © 2017 Robert Blundell. All rights reserved.
//

import UIKit

class onboardingPlaceCell: UICollectionViewCell {
    
    @IBOutlet weak var onboardingPlaceImage: UIImageView!
    @IBOutlet weak var onboardingPlaceName: UILabel!
    
    
    
    func configureCellVisuals(place: Place) {
        onboardingPlaceName.text = place.title
        onboardingPlaceImage.image = place.placeImage
    }
 
    
    
}

