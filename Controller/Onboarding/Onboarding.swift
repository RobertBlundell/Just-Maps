//
//  Onboarding.swift
//  Just Maps
//
//  Created by Robert Blundell on 11/12/2017.
//  Copyright © 2017 Robert Blundell. All rights reserved.
//

import UIKit

class Onboarding: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var placeCollection: UICollectionView!
    @IBOutlet weak var onboardingBgImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        placeCollection.delegate = self
        placeCollection.dataSource = self
        placeCollection.allowsMultipleSelection = true
        onboardingBgImage.addBlurEffect()
    }

    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "onboardingPlaceCell", for: indexPath) as? onboardingPlaceCell {
            
            cell.configureCellVisuals(place: places[indexPath.row])
            //todo: Cells need to be in selected state if user has exited app during onboarding. Not the case right now.

            
            //following code is here because cells reload and the border is wrong. Todo: better code would be to change cell depending on isSelected Bool.
            if cell.isSelected == true {
                cell.layer.borderWidth = 2.0
                cell.layer.borderColor = UIColor(red: 122/255, green: 191/255, blue: 47/255, alpha: 1).cgColor
            } else {
                cell.layer.borderWidth = 0
            }
            return cell

        } else {
            return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return places.count
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        cell?.layer.borderWidth = 2.0
        cell?.layer.borderColor = UIColor(red: 122/255, green: 191/255, blue: 47/255, alpha: 1).cgColor
        let cellKey = places[indexPath.row].title
        defaults.set(true, forKey: cellKey)
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        cell?.layer.borderWidth = 0
        let cellKey = places[indexPath.row].title
        defaults.set(false, forKey: cellKey)
    }
    
}
