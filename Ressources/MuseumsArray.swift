//
//  MuseumsArray.swift
//  Just Maps
//
//  Created by Robert Blundell on 11/12/2017.
//  Copyright © 2017 Robert Blundell. All rights reserved.
//

import Foundation

var Museums: [Place] = [britishMuseum, nationalGallery, victoriaAndAlbertMuseum, naturalHistoryMuseum, cabinetWarRooms, tateGallery, HMSBelfast, londonMuseum, madamTussauds]

private var britishMuseum = Place(latitude: 51.519369,
                                  longitude: -0.126988,
                                  title: "British Museum",
                                  placeDescription: "Showcase of antiquities from all over the globe",
                                  longPlaceDescription: """
    💵 Free
    🕒 Every day 10:00 to 17:30. Fri 10:00 to 20:30


    The British Museum is dedicated to global human history, art and culture. It's huge collection of over 8 million curiosities originate from all over the world, and many of the artefacts in the museum are there as a consequence of British colonization.

    Some of the artefacts you can visit are the egyptian Mummy of Katebet, the Rosetta Stone, the huge Assyrian winged bulls from Khorsabad, greek parthenon sculptures and so much more.
    """,
                                  placeType: .museum,
                                  placeImage: #imageLiteral(resourceName: "placeholder"))

private var nationalGallery = Place(latitude: 51.508675,
                                    longitude: -0.128302,
                                    title: "National Gallery",
                                    placeDescription: "Wide ranging western art collection, from 'Giotto' to Cézanne",
                                    longPlaceDescription: """
    💵 Free
    🕒 Every day 10:00 to 18:00. Fri 10 am to 9pm


    The National Gallery displays some 2300 Western European paintings dating from the Middle Ages to the 20th century. The museum displays a vast extent of works by both British aritists such as Gainsborough, Constable and Turner as well as by other western artists like Botticelli, Leonardo da Vinci, Rembrandt, Renoir and Van Gogh.
    """,
                                    placeType: .museum,
                                    placeImage: #imageLiteral(resourceName: "placeholder"))

private var victoriaAndAlbertMuseum = Place(latitude: 51.496601,
                                            longitude: -0.172096,
                                            title: "Victoria and Alberts Museum",
                                            placeDescription: "World's largest museum of decorative arts and and design",
                                            longPlaceDescription: """
    💵 Free
    🕒 Every day 10:00 to 17:45. Fri 10:00 to 22:00
    
    Founded in 1852, the V&A is part of Prince Albert's legacy and is named after himself and Queen Victoria. The numerous galleries show off textiles, ceramics, statues from the 8th century up until WW1.

    The different galleries are mostly themed by cultures and include japan, the Islamic Middle East, Medieval and renaissance, britain, jewellery and photography.

    """,
                                            placeType: .museum,
                                            placeImage: #imageLiteral(resourceName: "placeholder"))

private var naturalHistoryMuseum = Place(latitude: 51.496236,
                                         longitude: -0.176453,
                                         title: "Natural History Museum",
                                         placeDescription: "Animals, natural phenomena, hands-on exhibits and animatronic dinosaurs",
                                         longPlaceDescription: """
    💵 Free
    🕒 Every day 10:00 to 17:30
    

    The building delivers a cathedral-like sense of grandeur, and the exhibits themselves have set the standard for natural history displays for centuries.
    
    The various galleries portray skeletons, animatronics and casts of Mammals, Dinosaurs and insects. The Darwin centre holds millions of species and explains the research done by the museum. The earth galleries show off minerals, moon rocks and has an earthquake simulator. A recent addition to the collection is Sophie, the best preserved stegasaurous fossil in the world.
    """,
                                         placeType: .museum,
                                         placeImage: #imageLiteral(resourceName: "placeholder"))

private var cabinetWarRooms = Place(latitude: 51.502224,
                                    longitude: -0.129308,
                                    title: "Churchill war rooms",
                                    placeDescription: "Museum about the leadership in WW2",
                                    longPlaceDescription: """
    💵 £19 adults, £9.50 under 15
    🕒 Every day 9:30 to 18:00


    The museum comprises the Cabinet War Rooms, a historic underground complex that housed a British government command centre throughout the Second World War, and the Churchill Museum, a biographical museum exploring the life and accomplishements of British statesman Winston Churchill.

    Construction of the Cabinet War Rooms began in 1938 and they became operational in August 1939, shortly before the outbreak of war in Europe. They remained in operation throughout the Second World War, before being abandoned in August 1945 after the surrender of Japan.
    """,
                                    placeType: .museum,
                                    placeImage: #imageLiteral(resourceName: "Cabinet war rooms"))

private var tateGallery = Place(latitude: 51.507612,
                                longitude: -0.099394,
                                title: "Modern Art Tate Gallery",
                                placeDescription: "Modern and contemporary art museum.",
                                longPlaceDescription: """
    💵 Free
    🕒 Sun to Thu 10:00 to 18:00. Fri & Sat 10:00 to 22:00

    Tate is is a network of four art museums displaying the United Kingdom's national collection of British art, and international modern and contemporary art. The wildly popular tate modern is a vigorous statement of modernity and accessibility.
    """,
                                placeType: .museum,
                                placeImage: #imageLiteral(resourceName: "Tate modern"))

private var HMSBelfast = Place(latitude: 51.506557,
                               longitude: -0.081348,
                               title: "HMS Belfast",
                               placeDescription: "A museum ship dating from WW2.",
                               longPlaceDescription: """
    💵 £18 adults, £8 under 15s
    🕒 Every day 10:00 to 17:00


    HMS Belfast is a museum ship permanently moored on the River Thames in London. Originally a light cruiser built for the Royal Navy, the HMS Belfast served during world war II, helped sink German battleship Sharnhorst, shelled the Normandy coast on D-day and later participated in the korean war.
    """,
                               placeType: .museum,
                               placeImage:#imageLiteral(resourceName: "HMS belfast"))

private var londonMuseum = Place(latitude: 51.517581,
                                 longitude: -0.096884,
                                 title: "Museum of London",
                                 placeDescription: "This Museum illustrates the rich history of London.",
                                 longPlaceDescription: """
    💵 Free
    🕒 Every day 10:00 to 18:00


    The Museum of London retraces the history of London from 450,000 BC to the Romans to present day London. It hosts the largest urban history collection in the world. The building is part of the striking brutalist Barbican complex, built after the war over bomb-damaged London.
    """,
                                 placeType: .museum,
                                 placeImage: #imageLiteral(resourceName: "London Museum"))

private var madamTussauds = Place(latitude: 51.522783,
                                  longitude: -0.154907,
                                  title: "Madam Tussauds",
                                  placeDescription: "Wax figures of famous people",
                                  longPlaceDescription: """
    💵 £35 adults, £30 under 15 (save £6 by booking online)
    🕒 Mon to Fri 10:00 to 16:00, Sat & Sun 9:00 to 16:00
    ⚠️ To avoid queues, guarantee entry and save money on the ticket it is best to book online. The venue is commercial and you will have spending opportunities in every room.

    
    Madame Tussauds displays a wide array of life-like wax figures of world leaders, athletes, A-list movie-stars and celebrities.

    The museum itself has an interesting origin story, being founded by Marie Tussaud who made death masks of people guillotined during the French revolution. She arrived in London in 1803 to display 30 wax figures of celebrities near Baker street, a true novelty in a time before photography existed. The London museum opened it's doors in 1835, and the madam tussauds brand now has 26 locations around the globe. 
    """,
                                  placeType: .museum,
                                  placeImage: #imageLiteral(resourceName: "placeholder"))









