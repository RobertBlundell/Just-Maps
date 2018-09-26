//
//  InterestsArray.swift
//  Just Maps
//
//  Created by Robert Blundell on 26/09/2018.
//  Copyright © 2018 Robert Blundell. All rights reserved.
//

import Foundation
import UIKit


class Interest {
    
    private var _interestName: String!
    private var _interestImage: UIImage!
    
    var interestName: String {
        return _interestName
    }
    
    var interestImage: UIImage {
        return _interestImage
    }
    
    init(interestName: String, interestImage: UIImage) {
        _interestName = interestName
        _interestImage = interestImage
    }
}


let interestsArray: [Interest] = [londonIcons, churches, theatre, horror, markets, skyscrapers, fantasy, classicalArt, modernArt, secondWorldWar, walking, skyline, museums, secrets]

private var londonIcons = Interest(interestName: "London's most iconic sites", interestImage: #imageLiteral(resourceName: "London Icons"))

private var churches = Interest(interestName: "Churches & monasteries", interestImage: #imageLiteral(resourceName: "St Paul's Cathedral"))

private var theatre = Interest(interestName: "Theatre", interestImage: #imageLiteral(resourceName: "Globe Theatre"))

private var horror = Interest(interestName: "Spooky London", interestImage: #imageLiteral(resourceName: "London Dungeon"))

private var markets = Interest(interestName: "Marketplaces", interestImage: #imageLiteral(resourceName: "Leadenhall market"))

private var skyscrapers = Interest(interestName: "Skyscrapers", interestImage: #imageLiteral(resourceName: "City tour"))

private var fantasy = Interest(interestName: "Fantasy worlds", interestImage: #imageLiteral(resourceName: "placeholder"))

private var classicalArt = Interest(interestName: "Classical art", interestImage: #imageLiteral(resourceName: "placeholder"))

private var modernArt = Interest(interestName: "Modern art", interestImage: #imageLiteral(resourceName: "placeholder"))

private var secondWorldWar = Interest(interestName: "Museums about the war", interestImage: #imageLiteral(resourceName: "HMS belfast"))

private var walking = Interest(interestName: "Walking", interestImage: #imageLiteral(resourceName: "placeholder"))

private var skyline = Interest(interestName: "Hunt for the best skyline of London", interestImage: #imageLiteral(resourceName: "City tour"))

private var museums = Interest(interestName: "Museums", interestImage: #imageLiteral(resourceName: "placeholder"))

private var secrets = Interest(interestName: "Off the beaten areas", interestImage: #imageLiteral(resourceName: "placeholder"))
