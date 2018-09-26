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
    
    
    
    func configureCellVisuals(interest: Interest) {
        onboardingPlaceName.text = interest.interestName
        onboardingPlaceImage.image = interest.interestImage
    }
 
    
    
}

