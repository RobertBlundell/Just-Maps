//
//  TableViewCell.swift
//  JustaMapp
//
//  Created by Robert Blundell on 09/11/2017.
//  Copyright © 2017 Robert Blundell. All rights reserved.
//

import UIKit

class PlaceCell: UITableViewCell {

    @IBOutlet weak var placeImage: UIImageView!
    @IBOutlet weak var placeName: UILabel!
    @IBOutlet weak var placeShortDescription: UILabel!
    @IBOutlet weak var placeSelectorButton: UIButton!
    
    func configureCellVisuals(place: Place) {
        placeName.text = place.title
        placeShortDescription.text = place.placeDescription
        placeImage.image = place.placeImage
        
        if defaults.bool(forKey: placeName.text!) == true {
            placeSelectorButton.setImage(#imageLiteral(resourceName: "Selected Button"), for: .normal)
        } else { placeSelectorButton.setImage(#imageLiteral(resourceName: "Select Button"), for: .normal) }
        
    }
    
    @IBAction func placeSelectorButtonPressed(_ sender: Any) {

        let oldValue = defaults.bool(forKey: placeName.text!)
        defaults.set(!oldValue, forKey: placeName.text!)
        
        if defaults.bool(forKey: placeName.text!) == true {
            placeSelectorButton.setImage(#imageLiteral(resourceName: "Selected Button"), for: .normal)
        } else { placeSelectorButton.setImage(#imageLiteral(resourceName: "Select Button"), for: .normal) }
    }
    
}
