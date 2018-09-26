//
//  WalksArray.swift
//  Just Maps
//
//  Created by Robert Blundell on 11/12/2017.
//  Copyright © 2017 Robert Blundell. All rights reserved.
//

import Foundation

var Walks: [Place] = [westminsterWalk, theCityWalk]

private var westminsterWalk = Place(latitude: 51.501148,
                                    longitude: -0.125238,
                                    title: "Westminster Walk",
                                    placeDescription: "Walk through westminster, the political heart of England where most of London's iconic sights are.",
                                    longPlaceDescription: """
    ⭕️ We recommend starting the walk at westminster tube station (circle, district and jubilee lines) and heading off from this pin. However, the walk is made to be circular so you can start wherever is best for you.

    This walk takes you through westminster, which has been the political and religious centre of London for over a thousand years. This walk is jam-packed with London's most iconic sights and therefore is essential to any first-time visitor.

       You will pass landmarks such as Big Ben, Buckingham palace, westminster Abbey and the London eye just to name a few.
    """,
                                    placeType: .walk,
                                    placeImage: #imageLiteral(resourceName: "London route 1"))



private var theCityWalk = Place(latitude: 51.507121,
                                longitude: -0.074325,
                                title: "The City Walk",
                                placeDescription: "This walk will take you through the city of London, you will visit the financial and business heart of London.",
                                longPlaceDescription: """
    ⭕️ We recommend starting the walk at tower hill tube station (circle and district lines) However, the walk is made to be circular so you can start wherever is best for you.

    This walk will take you through the city of London, you will visit the financial and business heart of London.

    Some of the sights that you will see include the tower of London, tower bridge, the HMS belfast, the shakesperian globe theatre, St Paul's Cathedral and London's iconic skyscrapers.
    """,
                                placeType: .walk ,
                                placeImage: #imageLiteral(resourceName: "City of London route"))

