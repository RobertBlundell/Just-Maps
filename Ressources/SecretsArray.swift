//
//  SecretsArray.swift
//  Just Maps
//
//  Created by Robert Blundell on 11/12/2017.
//  Copyright © 2017 Robert Blundell. All rights reserved.
//

import Foundation

var Secrets: [Place] = [camleyStreet, platform934, sherlockHolmesRoom, broadgateIceSkatingRing, theMonument, museumOfBrands]

private var camleyStreet = Place(latitude: 51.535446,
                                 longitude: -0.127705,
                                 title: "Camley Street Natural Park",
                                 placeDescription: "Concealed Garden",
                                 longPlaceDescription: """
                                    Only a few years ago, King's Cross was one of the most squalid patches of London. Since then, real estate developers have transformed King's Cross into an uninspiring urban centre of offices, appartments and restaurants chains.
                                    
                                    This peaceful park is a hidden jungle where dragonflies and frogs cohabitate with tourists. Sit down at the community-run café and watch the canal where boats, kingfishers and swans bathe calmly.
                                    """,
                                 
                                 
                                 placeType:  .secret,
                                 placeImage:  #imageLiteral(resourceName: "placeholder") )

private var platform934 = Place(latitude: 51.532138,
                                 longitude: -0.124019,
                                 title: "Platform 9 3/4",
                                 placeDescription: "Recreation of Harry Potter's famous departure point to hogwarts",
                                 longPlaceDescription: """
                                    Platform 9 3/4 at King’s Cross station in London is extremely important to young wizards, as that’s where one departs for Hogwarts via the Hogwarts Express.

                                    The Harry Potter Shop at Platform 9 3/4 is an experience that has something for everyone and a great opportunity for gift-shopping.
                                    """,
                                 
                                 placeType: .secret,
                                 placeImage: #imageLiteral(resourceName: "placeholder"))

private var sherlockHolmesRoom = Place(latitude: 51.523784,
                                 longitude: -0.158465,
                                 title: "Sherlock Holmes Room",
                                 placeDescription: "221 Baker Street is the home of fictional detective Sherlock Holmes",
                                 longPlaceDescription: """
                                    221B Baker Street is the London address of the fictional detective Sherlock Holmes, created by author Sir Arthur Conan Doyle. Baker Street in the late 19th century was a high-class residential district, and Holmes' apartment would have been part of a Georgian terrace.

                                    For many years, Abbey National had to employ a full-time secretary to answer mail addressed to Sherlock Holmes. In 1990, the Sherlock Holmes museum (situated on the same block) installed a blue plaque marking 221B Baker Street, which led to a 15-year dispute between Abbey National and the Holmes Museum for the right to receive Sherlock Holm's mail.

                                    The Sherlock Holmes Museum is located between 237 and 241 Baker Street. It displays exhibits in period rooms, wax figures and Holmes memorabilia, with the famous study overlooking Baker Street the highlight of the museum. The description of the house can be found throughout the stories, including the 17 steps leading from the ground-floor hallway to the first-floor study. The Sherlock Holmes Pub nearby also displays tourist memorabilia.
                                    """,
                                 
                                 placeType: .secret,
                                 placeImage: #imageLiteral(resourceName: "placeholder"))

private var broadgateIceSkatingRing = Place(latitude: 51.519849,
                                 longitude: -0.081198,
                                 title: "Broadgate Ice Skating Rink",
                                 placeDescription: "Hidden Ice Skating Ring in The City of London",
                                 longPlaceDescription: """
                                    Despite being in the heart of London's financial centre, this homely ice ring is one of the cheapest in London. Few people know of it's existence, other than the investment Bankers that stare longingly at skaters from the top of their high-rise offices.

                                    The ring only fills up on Tuesdays evenings, at 7pm when broomball matches are held. 12 players will face off in this animalistic version of hockey where players substitute their sticks with brooms.
                                    """,
                                 
                                 placeType: .secret,
                                 placeImage: #imageLiteral(resourceName: "placeholder"))

private var theMonument = Place(latitude: 51.510139,
                                 longitude: -0.085943,
                                 title: "The Monument",
                                 placeDescription: "Stone tower that offers an alternative view of the London Landscape",
                                 longPlaceDescription: """
                                    This 61-metre tall tower built in pure stone (the tallest of it's kind) was built to commemorate the Great Fire of London of 1677. The city of London has outgrown the Tower, but it offers an alternative landscape view to the one most tourists take. It will take you 311 steps to walk up the damn thing, but every brave soul that makes it to the top will recieve a certificate for their fortitude.
                                    """,
                                 
                                 placeType: .secret,
                                 placeImage: #imageLiteral(resourceName: "placeholder"))

private var museumOfBrands = Place(latitude: 51.516433,
                                 longitude: -0.211127,
                                 title: "Museum of Brands",
                                 placeDescription: "A hommage to consumerism",
                                 longPlaceDescription: """
                                    Outside the centre of London is this strange museum that catalogues the conumption habits of the British population druing the past two decades. Organized artfully by theme or decade, these everyday products and packaging deconstruct the social history of Britain. The museum boasts over half a million unremarkable objects, ranging from the "Servants' Friend" stove polish to "The Win the War Cookery Book".
                                    """,
                                 
                                 placeType: .secret,
                                 placeImage: #imageLiteral(resourceName: "placeholder"))

// Little Venice??
//Camden passage??
// Move leadenhall to secrets??
// Add St. Catherin's Docks to the secrets array.
// add brick lane market?
// add less touristy markets?



