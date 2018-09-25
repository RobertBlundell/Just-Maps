//
//  PlacesArray.swift
//  JustaMapp
//
//  Created by Robert Blundell on 09/11/2017.
//  Copyright © 2017 Robert Blundell. All rights reserved.
//

import Foundation

let allPlaces = (places + Secrets + Walks + Museums)

var places: [Place] = [bigBen, westminsterAbbey, downingStreet, buckinghamPalace, trafalgarSquare, londonEye, towerBridge, towerOfLondon, stPaulsCathedral, globeTheatre, southwarkCathedral, londonDungeon, leadenhallMarket, theShard, walkieTalkie]


private var bigBen = Place(latitude: 51.500768,
                           longitude: -0.124664,
                           title: "Big Ben & houses of parliament",
                           placeDescription: "The great bell of westminster palace, where the british parliament sit",
                           longPlaceDescription: """
    💡 Tour Westminster palace. Book at parliament.co.uk
    💵 £25 adults £10 children
    🕒 Every Saturday and on parliament recess days


    Big Ben is the nickname for the Great Bell of the clock at the north end of the Palace of Westminster. A British cultural icon, the tower is one of the most prominent symbols of the United Kingdom and is often in the establishing shot of films set in London.

    On 21 August 2017, the tower began a four-year period of renovation. With a few exceptions, the tower's renowned bells will be silent until the renovation is complete.

    The House of Commons is where Members of Parliament meet to discuss and propose new legislation, as well as question the prime minister. The house of lords is occupied by citizens who have distinguished themselves through their career and were subsequently appointed by the queen of England. In olden times membership was hereditary but there remain ony 92 citizens who were born into their position as of today.
""",
                           placeType: .pointOfInterest ,
                           placeImage: #imageLiteral(resourceName: "London Icons"))

private var westminsterAbbey = Place(latitude: 51.499295,
                                     longitude: -0.127324,
                                     title: "Westminster Abbey",
                                     placeDescription: "Large, Gothic abbey church",
                                     longPlaceDescription: """
    💡 Visit the grandiose interior
    💵 £20 Adults, £9 children
    🕒 Mon, Tue, Thu & Fri 9:30 to 4:30. Wed 9:30 to 19:00.  Sat 9:30 to 14:30
    ⚠️ Westminster Abbey can get very busy with tiresome queues. It is first and foremost a place of worship


    Westminster Abbey is the United Kingdom's most notable religious building and the traditional place of coronation for British monarchs for soon to be a thousand years.

    This church is the best example of early English Gothic architecthure, and it's status is not of a cathedral but instead of "Royal Peculiar" — which implies that it is under direct sovereignty of the crown.
    """,
                                     placeType: .church,
                                     placeImage: #imageLiteral(resourceName: "Westminster Abbey"))



private var downingStreet = Place(latitude: 51.503357,
                                  longitude: -0.127636,
                                  title: "10 Downing street",
                                  placeDescription: "Residence and office of the Prime Minister.",
                                  longPlaceDescription: """
    💡 Witness the horse guards  parade
    🕒 Mon to Sat at 11 am. Sun at 10 am.
    ⚠️ The street has been sealed off with blast-proof steel doors, so you won't see much.


    10 Downing Street, colloquially known in the United Kingdom as Number 10, is the headquarters of the Government of the United Kingdom and the official residence and office of the Prime Minister. Number 10 is over 300 years old and contains approximately 100 rooms.

    A private residence occupies the third floor and there is a kitchen in the basement. The other floors contain offices and conference, reception, sitting and dining rooms where the Prime Minister works, and where government ministers, national leaders and foreign dignitaries are met and entertained.
    """,
                                  placeType: .pointOfInterest,
                                  placeImage: #imageLiteral(resourceName: "10 Downing street"))

private var buckinghamPalace = Place(latitude: 51.501364,
                                     longitude: -0.141890,
                                     title: "Buckingham palace",
                                     placeDescription: "London residence of the queen",
                                     longPlaceDescription: """
    💡 Witness the customary changing of the guard, a military parade that takes place daily in fron of the palace
    🕒 Every day at 11:00 April to July. Winter calendar varies. Last 30 minutes
    ⚠️ The calendar is irregular, so you must check the online calendar for dates. If the weather is bad, cancellations may happen at the last minute.
    ⚠️ It can be hard to get a good viewing spot, if you want to be at the front get to Buckingham Palace at 10:15

    💡 Visit 19 magnificent state rooms inside of Buckingham Palace
    💵 £24 Adults, £13.50 under 17
    🕒 Everyday 9:30 to 17:15 in August and September. Occasional irregular openings during winter and spring.


    Located in the City of Westminster, the palace is often at the centre of state occasions and royal hospitality. It has been a focal point for the British people at times of national rejoicing and mourning.

    Originally built for the Duke of Buckingham in 1703, it was acquired by King George III in 1761 and became the London residence of the British monarch on the accession of Queen Victoria in 1837. The palace boasts 775 rooms and the largest private garden in London.
    """,
                                     placeType: .pointOfInterest,
                                     placeImage: #imageLiteral(resourceName: "Buckingham Palace"))

private var trafalgarSquare = Place(latitude: 51.508033,
                                    longitude: -0.128065,
                                    title: "Trafalgar square",
                                    placeDescription: "Famous public square",
                                    longPlaceDescription: """
    Trafalgar Square was built to commemorate the Battle of Trafalgar, a British naval victory in the Napoleonic Wars with France and Spain that took place on 21 October 1805 off the coast of Cape Trafalgar, Spain.

    At it's center lies a 52 metre tall pillar crowned with a statue of Admiral Lord Horatio Nelson and guarded by four lion statues. During the battle Admiral Nelson engaged with 27 ships against a larger coalition of thirty three French and Spanish ships. His use of unorthodox tactics payed off, and the Royal Navy sunk twenty two ships without losing a single of their own. Nelson perished shortly thereafter from wounds suffered during the battle, becoming one of Britain's greatest war heroes.

    The Fourth Plinth, left empty in 1840, is currently host to contemporary art. The square is often used for community gatherings and political demonstrations, including New Year's Eve, anti-war protests and campaigns against climate change.
    """,
                                    placeType: .pointOfInterest,
                                    placeImage: #imageLiteral(resourceName: "Trafalgar square"))

private var londonEye = Place(latitude: 51.503317,
                              longitude: -0.119543,
                              title: "London Eye",
                              placeDescription: "Giant Ferris wheel",
                              longPlaceDescription: """
    💡 Spend 30 minutes in the glass capsules "flying" above the London skyline
    💵 £25 Adults, £19 under 15
    🕒 Varies, usually 11.30 - 18:00
    ⚠️ Up to 2 hour queues during peak time. Save time by booking tickets online, paying £10 for a fast track or by coming after 3 pm (try timing it with the sunset!)

    The London Eye is situated in the South Bank of London, an entertainment and commercial district of London. Businesses such as the London aquarium or the London dungeons have displaced the medieval activities that were theatres, prostitution and bear-baiting.

    The London eye is the most visited attraction in the uk with over 3.75 million annual visitors, and the ninth most popular place to propose in the world. At 135 metres tall it was the world's tallest ferris wheel in the year 2000 when it was inaugurated. Currently, the High roller in Las Vegas holds the title of tallest ferris wheel, measuring in at 167.6 metres tall.

    The London eye offers the second heighest viewing point in London after the 72nd floor of The Shard, and is adjoined by the charming Jubilee gardens.
    """,
                              placeType: .pointOfInterest,
                              placeImage: #imageLiteral(resourceName: "London eye"))


private var towerBridge = Place(latitude: 51.505448,
                                longitude: -0.075339,
                                title: "Tower Bridge",
                                placeDescription: "Iconic bascule and suspension bridge",
                                longPlaceDescription: """
    💡 With a tower bridge ticket you can look at an exhibit, climb up the tower, walk on the glass floor above the Thames and visit the engine room
    💵 £9.80 adult, £4.20 for under 15s
    🕒 April - september 10:00 to 17h:30. October - March 9:30 to 17:00
    
    Tower Bridge is a combined bascule and suspension bridge in London built between 1886 and 1894. The bridge crosses the River Thames close to the Tower of London and has become an iconic symbol of London, resulting in it sometimes being confused with London Bridge, situated some 0.5 mi (0.80 km) upstream. Tower Bridge is one of five London bridges now owned and maintained by the Bridge House Estates, a charitable trust overseen by the City of London Corporation. It is the only one of the Trust's bridges not to connect the City of London directly to the Southwark bank, as its northern landfall is in Tower Hamlets.
    """,
                                placeType: .pointOfInterest,
                                placeImage: #imageLiteral(resourceName: "Tower bridge"))

private var towerOfLondon = Place(latitude: 51.508173,
                                  longitude: -0.075940,
                                  title: "Tower of London",
                                  placeDescription: "The Tower of London is a historic castle.",
                                  longPlaceDescription: """
    💡 Visit the castle and it's multiple exhibits, most prized of all the crown jewels
    💵 £24.80 for adults, £11.50 under 15
    🕒 Tue to Sat 9:00 to 16:00. Sun & Mon 10:00 to 16:00
    ⚠️ As is the case with many London attractions, you can save 10 % by booking online

    The 'Tower' of London is in fact a castle, officially 'Her Majesty's Royal Palace and Fortress of the Tower of London'. The tower is at the heart of London's past, itself having a fascinating albeit bleak history.

    It was founded towards the end of 1066 as part of the Norman Conquest of England. The White Tower was built by William the Conqueror in 1078 and was a resented symbol of oppression, inflicted upon London by the new ruling elite.

    North of the white tower are the crown jewels, which include lavishly bejeweled scepters, orbs and various crowns. The centerpiece is the Imperial State Crown: set with 2,868 diamonds including the 317-carat 'star of Africa', sapphires, emeralds, rubies and pearls. Its estimated worth is over £20 Billion.
    """,
                                  placeType: .pointOfInterest,
                                  placeImage: #imageLiteral(resourceName: "Tower of London"))

private var stPaulsCathedral = Place(latitude: 51.513774,
                                     longitude: -0.098294,
                                     title: "St Paul's Cathedral",
                                     placeDescription: "Anglican cathedral and the seat of the Bishop of London",
                                     longPlaceDescription: """
    💡 Enter the cathedral floor, crypt and three galleries in the dome
    💵 £18 adults, £8 for under 18s
    🕒 Mon to Sat 8:30 (Galleries 9:30) to 16:15

    The cathedral is one of the most majestic and recognisable sights of London. Its dome has dominated the skyline for over 300 years. At 111 m high, it was the tallest building in London from 1710 to 1967 and it's dome is among the highest in the world.

    The crypt holds monuments to over three hundred figures such as Sir Winston Churchill as well as the graves of the Duke of Wellington, Admiral Nelson and others.
    """,
                                     placeType: .church,
                                     placeImage: #imageLiteral(resourceName: "St Paul's Cathedral"))

private var globeTheatre = Place(latitude: 51.508104,
                                 longitude: -0.097136,
                                 title: "The Globe Theatre",
                                 placeDescription: "Rebuilt traditional shakesperian theatre",
                                 longPlaceDescription: """
    💡 visit the globe exhibit to learn about shakespeare and theatre in the 17th century.
    💵 adult £13.50, child £8
    🕒 9:00 am to 17:00 pm (The globe itself will often be closed after 13:00 because actors are performing, but the exhibit will remain open)

    💡 Watch a shakesperian play in the theatre the plays were intended to be performed in
    💵 £5 'Groundling' tickets (standing up). Seated £10 to £40


    The original globe was closed down by the puritans in 1644 by the puritans. The current globe theatre opened in 1997 and was painstalkingly reconstructed using traditional Elizabethan materials and methods, as it's goal is to be as authentic as possible. It can host up to 700 'groundlings', who will watch the play standing up in the open-air pit at the mercy of the weather. There are three levels of galleries where spectators can enjoy greater comfort.
    """,
                                 placeType: .pointOfInterest,
                                 placeImage: #imageLiteral(resourceName: "Globe Theatre"))

private var southwarkCathedral = Place(latitude: 51.506101,
                                       longitude: -0.089592,
                                       title: "Southwark Cathedral",
                                       placeDescription: "Gothic Cathedral",
                                       longPlaceDescription: """
    💡 Follow one of the free drop-in tours
    💵 Free — £1 donation asked for taking pictures
    🕒 Mon to Fri 9:00 to 17:00, Sat 9:30 to 18:00, Sun 12:30 to 18:00
    ⚠️ Drop-in tours are available Wed & Thu 14:00, Fri 11:00, 13:00
    
    Southwark has been a place of Christian worship for more than 1,000 years, but it's creation is a subject of debate and legend. Some accounts claim that a nunnery was established on the spot in 606 AD, but other accounts claim that a monastery was founded thee by Saint Swithun in the 9th century.

    The present building retains the basic form of the Gothic structure built between 1220 and 1420, although the nave is a late 19th-century reconstruction.
    """,
                                       placeType: .church,
                                       placeImage: #imageLiteral(resourceName: "Southwark Cathedral"))

private var londonDungeon = Place(latitude: 51.502505,
                                  longitude: -0.118763,
                                  title: "The London Dungeon",
                                  placeDescription: "Hi-tech haunted house attraction",
                                  longPlaceDescription: """
    💡 Take a 90 minute walkthrough horror experience that you can hear, touch, smell and feel.
    💵 £30 (30% discount for booking online)
    🕒 Mon - Wed & Fri 10:00 tto 16:00, Thu 11:00 to 17:00, Sat & Sun 10:00 to 18:00

    The Dungeons brings together a cast of theatrical actors, special effects, stages, scenes and rides in a unique and sometimes scary walkthrough experience that you see, hear, touch, smell and feel.
    
    You walk through the Dungeon, moving from show to show, guided by actors representing sinister characters based on real London history and legends including Jack the Ripper and the infamous barber of Fleet Street, Sweeney Todd.
    """,
                                  placeType: .pointOfInterest,
                                  placeImage: #imageLiteral(resourceName: "London Dungeon"))

private var leadenhallMarket = Place(latitude: 51.512608,
                                     longitude: -0.083362,
                                     title: "Leadenhall Market",
                                     placeDescription: "A covered market dating from the 14th century.",
                                     longPlaceDescription: """
    💡 Come to leadenhall for some high-end shopping or for dining


    Leadenhall Market is a covered market in London dating from the 14th century, and it is located in the historic centre of the City of London financial district. In the past, Leadenhall was the centre of Roman Londinium.

    It is typically open from 10 am until 6 pm, and it will be most busy on weekdays at midday when all the bankers have lunch here. Originally a meat, game and poultry market, now restaurants and commercial retailers occupy the market.

    The ornate roof structure, painted green, maroon and cream, and cobbled floors of the current structure make Leadenhall Market a tourist attraction.
    """,
                                     placeType: .pointOfInterest,
                                     placeImage: #imageLiteral(resourceName: "Leadenhall market"))

private var theShard = Place(latitude: 51.504482,
                             longitude: -0.086422,
                             title: "The Shard",
                             placeDescription: "Tallest skyscrapper in London",
                             longPlaceDescription: """
    💡 Take a lift to gaze at the London skyline from the city's highest viewpoint
    💵 £29.95 adults, £23.95 under 15 (£5 to £10 discount online)
    🕒 10:00 to 18:00
    💡 Alternatively, get breakfast (or a cocktail) at one of the restaurants in the building for half the price

    Puncturing the sky with it's broken glass-like top, the dramatic effect of the shard had made it a foundation of the London skyline. Get a lift up to floors 68, 69 and 72 where you will stand at a 244 metre high vantage point — by far the highest in London.
    """,
                             placeType: .skyscraper,
                             placeImage: #imageLiteral(resourceName: "placeholder"))

private var walkieTalkie = Place(latitude: 51.511219,
                                 longitude: -0.083632,
                                 title: "Walkie Talkie",
                                 placeDescription: "Sixth-tallest building in London, it is famous for its top-heavy form",
                                 longPlaceDescription: """
    💡 At the top of the of the walkie talkie is a unique garden that spans three storeys and offers 360 degree uninterrupted views across the City of London.
    💵 The gardens are free!
    🕒 Open Daily 10:00 to 17:00
    ⚠️ Beware, the tickets to get to the top run out quickly because they are free. Tickets are released every monday, so reserve a week in advance on the skygarden website.

    Known locally as the Walkie-Talkie, the 38-storey building is the sixth tallest completed building in the City of London. Designed by architect Rafael Viñoly and costing over £200 million, 20 Fenchurch Street features a highly distinctive top-heavy form which appears to burst upward and outward.

    It was discovered soon after construction that when sun shines directly onto the building, it acts as a concave mirror and focuses light onto the streets to the south. Temperature readings rose up to 91 °C, and the scorching sunlight melted cars and set fire to a local shops' carpet. A reporter for the newspaper City A.M. was even able to fry an egg in a pan set out on the ground, which earned the building it's nickname of 'Fryscraper'.

    """,
                                 placeType: .skyscraper,
                                 placeImage: #imageLiteral(resourceName: "placeholder"))





