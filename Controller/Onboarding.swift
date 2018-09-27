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
            
            cell.configureCellVisuals(interest: interestsArray[indexPath.row])
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
        return interestsArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        cell?.layer.borderWidth = 2.0
        cell?.layer.borderColor = UIColor(red: 122/255, green: 191/255, blue: 47/255, alpha: 1).cgColor
        
        if indexPath.row == 0 {
            defaults.set(true, forKey: "Big Ben & houses of parliament")
            defaults.set(true, forKey: "Buckingham palace")
            defaults.set(true, forKey: "Trafalgar square")
            defaults.set(true, forKey: "London Eye")
            defaults.set(true, forKey: "Tower Bridge")
            defaults.set(true, forKey: "St Paul's Cathedral")
            defaults.set(true, forKey: "Tower of London")
        }
        
        if indexPath.row == 1 {
            defaults.set(true, forKey: "Southwark Cathedral")
            defaults.set(true, forKey: "Westminster Abbey")
        }

        if indexPath.row == 2 {defaults.set(true, forKey: "The Globe Theatre")}

        if indexPath.row == 3 {defaults.set(true, forKey: "The London Dungeon")}

        if indexPath.row == 4 {defaults.set(true, forKey: "Leadenhall Market")}

        if indexPath.row == 5 {
            defaults.set(true, forKey: "The Shard")
            defaults.set(true, forKey: "Walkie Talkie")
        }

        if indexPath.row == 6 {
            defaults.set(true, forKey: "Platform 9 3/4")
            defaults.set(true, forKey: "Sherlock Holmes Room")
        }

        if indexPath.row == 7 {defaults.set(true, forKey: "National Gallery")}

        if indexPath.row == 8 {defaults.set(true, forKey: "Modern Art Tate Gallery")}

        if indexPath.row == 9 {
            defaults.set(true, forKey: "HMS Belfast")
            defaults.set(true, forKey: "Churchill war rooms")
        }

        if indexPath.row == 10 {
            defaults.set(true, forKey: "Westminster Walk")
            defaults.set(true, forKey: "The City Walk")
        }

        if indexPath.row == 11 {
            defaults.set(true, forKey: "The Shard")
            defaults.set(true, forKey: "Walkie Talkie")
        }

        if indexPath.row == 12 {
            defaults.set(true, forKey: "British Museum")
            defaults.set(true, forKey: "Victoria and Alberts Museum")
            defaults.set(true, forKey: "Natural History Museum")
            if defaults.bool(forKey: "Camley Street Natural Park") == true {
                defaults.set(true, forKey: "Museum of Brands")
            }
        }

        if indexPath.row == 13 {
            defaults.set(true, forKey: "Camley Street Natural Park")
            if defaults.bool(forKey: "British Museum") == true {
                defaults.set(true, forKey: "Museum of Brands")
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        cell?.layer.borderWidth = 0

        if indexPath.row == 0 {
            defaults.set(true, forKey: "Big Ben & houses of parliament")
            defaults.set(true, forKey: "Buckingham palace")
            defaults.set(true, forKey: "Trafalgar square")
            defaults.set(true, forKey: "London Eye")
            defaults.set(true, forKey: "Tower Bridge")
            defaults.set(true, forKey: "St Paul's Cathedral")
            defaults.set(true, forKey: "Tower of London")
        }
        
        if indexPath.row == 1 {
            defaults.set(false, forKey: "Southwark Cathedral")
            defaults.set(false, forKey: "Westminster Abbey")
        }
        
        if indexPath.row == 2 {defaults.set(false, forKey: "The Globe Theatre")}
        
        if indexPath.row == 3 {defaults.set(false, forKey: "The London Dungeon")}
        
        if indexPath.row == 4 {defaults.set(false, forKey: "Leadenhall Market")}
        
        if indexPath.row == 5 {
            defaults.set(false, forKey: "The Shard")
            defaults.set(false, forKey: "Walkie Talkie")
        }
        
        if indexPath.row == 6 {
            defaults.set(false, forKey: "Platform 9 3/4")
            defaults.set(false, forKey: "Sherlock Holmes Room")
        }
        
        if indexPath.row == 7 {defaults.set(false, forKey: "National Gallery")}
        
        if indexPath.row == 8 {defaults.set(false, forKey: "Modern Art Tate Gallery")}
        
        if indexPath.row == 9 {
            defaults.set(false, forKey: "HMS Belfast")
            defaults.set(false, forKey: "Churchill war rooms")
        }
        
        if indexPath.row == 10 {
            defaults.set(false, forKey: "Westminster Walk")
            defaults.set(false, forKey: "The City Walk")
        }
        
        if indexPath.row == 11 {
            defaults.set(false, forKey: "The Shard")
            defaults.set(false, forKey: "Walkie Talkie")
        }
        
        if indexPath.row == 12 {
            defaults.set(false, forKey: "British Museum")
            defaults.set(false, forKey: "Victoria and Alberts Museum")
            defaults.set(false, forKey: "Natural History Museum")
        }
        
        if indexPath.row == 13 {defaults.set(false, forKey: "Camley Street Natural Park")}
        
    }
    
}
