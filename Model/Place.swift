//
//  Place.swift
//  JustaMapp
//
//  Created by Robert Blundell on 09/11/2017.
//  Copyright © 2017 Robert Blundell. All rights reserved.
//

import Foundation
import UIKit
//Testing 123
enum PlaceType {
    case pointOfInterest
    case church
    case skyscraper
    case secret
    case walk
    case museum
}

class Place {
    private var _latitude: Double!
    private var _longitude: Double!
    private var _title: String!
    private var _placeDescription: String!
    private var _longPlaceDescription: String!
    private var _placeType: PlaceType!
    private var _placeImage: UIImage!
    
    private var _isSelectedForMap: Bool = false
    private var directionToPlaceURLString: String!

    
    var latitude: Double {
        return _latitude
    }
    
    var longitude: Double {
        return _longitude
    }
    
    var title: String {
        return _title
    }
    
    var placeDescription: String {
        return _placeDescription
    }
    
    var longPlaceDescription: String {
        return _longPlaceDescription
    }
    
    var placeType: PlaceType {
        return _placeType
    }
    
    var placeImage: UIImage {
        return _placeImage
    }
    
    
    //DELETE all isselectedForMap stuff on just maps
    var isSelectedForMap: Bool {
        get {
            return _isSelectedForMap
        }
        set {
            self._isSelectedForMap = newValue
        }
    }
    
    init(latitude: Double, longitude: Double, title: String, placeDescription: String, longPlaceDescription: String, placeType: PlaceType, placeImage: UIImage){
        _latitude = latitude
        _longitude = longitude
        _title = title
        _placeDescription = placeDescription
        _longPlaceDescription = longPlaceDescription
        _placeType = placeType
        _placeImage = placeImage
        
        directionToPlaceURLString = "https://api.mapbox.com/directions/v5/mapbox/walking/-0.068275,51.510401;\(longitude),\(latitude)?access_token=pk.eyJ1IjoicmJsdW5kZWxsIiwiYSI6ImNqNmdhcGh0eDA2dGczM3Awcnp3dmIzMG0ifQ.h3NrYLZr7cmCi27--KuDCA"
    }
    

    func directionAPICallAndParse() {
        
        guard let url = URL(string: directionToPlaceURLString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if error != nil {
                print(error!.localizedDescription)
            }
            
            guard let data = data else { return }
            
            do {
                //Decode retrived data with JSONDecoder and assing type of Article object
                let directionsData = try JSONDecoder().decode(directionToPlace.self, from: data)
                let polylineString = directionsData.routes[0].geometry
                //Polylinestring returns an encoded polyline. Step 1 Decode polyline. Step 2 draw polyline. Step 3 done! Or add turn by turn??

                // What are the next lines for?
//                DispatchQueue.main.async {
//                }
            } catch let jsonError {
                print(jsonError)
            }
            }.resume()
    }
}
