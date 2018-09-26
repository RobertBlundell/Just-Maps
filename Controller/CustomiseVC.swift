//
//  FirstViewController.swift
//  JustaMapp
//
//  Created by Robert Blundell on 08/11/2017.
//  Copyright © 2017 Robert Blundell. All rights reserved.
//

import UIKit

class CustomizeVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var placesTableView: UITableView!
    @IBOutlet weak var segmentPlaces: UISegmentedControl!
    @IBOutlet weak var selectionBarConstraint: NSLayoutConstraint!
    @IBOutlet weak var selectionBarWidth: NSLayoutConstraint!
    
    
    var segueSelectedPlace: Place!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if #available(iOS 11.0, *) {
            placesTableView.contentInsetAdjustmentBehavior = .never
        }
        
        placesTableView.delegate = self
        placesTableView.dataSource = self
        placesTableView.rowHeight = 122
        
        selectionBarWidth.constant = view.frame.size.width / 5
        segmentPlaces.removeBorders()
            
        // This needs to be deleted soon enough, will be done in app delegate/onboarding screens. instead of default use lack of "true" bool results within places.
        if defaults.bool(forKey: "JustMapsIsSetup") == false {
            setupJustMaps()
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        placesTableView.reloadData()
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("Number of rows function running")
        if segmentPlaces.selectedSegmentIndex == 0 {
            var isSelectedForMapCount = 0
            for place in allPlaces {
                if defaults.bool(forKey: place.title) == true {
                    isSelectedForMapCount += 1
                }
            }
            return isSelectedForMapCount
   
        } else if segmentPlaces.selectedSegmentIndex == 1 {
            print(places.count)
            return places.count
        } else if segmentPlaces.selectedSegmentIndex == 2 {
            return Secrets.count
        } else if segmentPlaces.selectedSegmentIndex == 3 {
            print(Walks.count)
            return Walks.count
        } else { return Museums.count }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("cellforRowAt running")
        let cell = placesTableView.dequeueReusableCell(withIdentifier: "PlaceCell") as? PlaceCell
        configureCell(cell: cell!, indexPath: indexPath)
        return cell!
    }
    
    private func configureCell(cell: PlaceCell, indexPath: IndexPath) {
        print("configure cell running")
        if segmentPlaces.selectedSegmentIndex == 0 {
            var isSelectedForMapCount = 0
            for place in allPlaces {
                if defaults.bool(forKey: place.title) == true {
                    if isSelectedForMapCount == indexPath.row {
                        cell.configureCellVisuals(place: place)
                    }
                    isSelectedForMapCount += 1
                }
            }
        } else if segmentPlaces.selectedSegmentIndex == 1 {
            let place = places[indexPath.row]
            cell.configureCellVisuals(place: place)
        } else if segmentPlaces.selectedSegmentIndex == 2 {
            let place = Secrets[indexPath.row]
            cell.configureCellVisuals(place: place)
        } else if segmentPlaces.selectedSegmentIndex == 3 {
            print(Walks[indexPath.row].title)
            let place = Walks[indexPath.row]
            cell.configureCellVisuals(place: place)
        } else if segmentPlaces.selectedSegmentIndex == 4 {
            let place = Museums[indexPath.row]
            cell.configureCellVisuals(place: place)
        }
    }

    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if segmentPlaces.selectedSegmentIndex == 0 {
            for place in allPlaces {
                let placeCell = placesTableView.cellForRow(at: indexPath) as? PlaceCell
                if placeCell?.placeName.text == place.title {
                    segueSelectedPlace = place
                    performSegue(withIdentifier: "showPlaceDetailsVC", sender: self.placesTableView)
                }
            }
        } else if segmentPlaces.selectedSegmentIndex == 1 {
            segueSelectedPlace = places[indexPath.row]
            performSegue(withIdentifier: "showPlaceDetailsVC", sender: self.placesTableView)
        } else if segmentPlaces.selectedSegmentIndex == 2 {
            segueSelectedPlace = Secrets[indexPath.row]
            performSegue(withIdentifier: "showPlaceDetailsVC", sender: self.placesTableView)
        } else if segmentPlaces.selectedSegmentIndex == 3 {
            segueSelectedPlace = Walks[indexPath.row]
            performSegue(withIdentifier: "showPlaceDetailsVC", sender: self.placesTableView)
        } else if segmentPlaces.selectedSegmentIndex == 4 {
            segueSelectedPlace = Museums[indexPath.row]
            performSegue(withIdentifier: "showPlaceDetailsVC", sender: self.placesTableView)
        }
    
        placesTableView.deselectRow(at: indexPath, animated: false)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showPlaceDetailsVC" {
            let nextVC = segue.destination as! PlaceDetailView
            nextVC.place2 = segueSelectedPlace
        }
    }
  
    @IBAction func segmentChange(_ sender: AnyObject) {
        print("segment change #1")
        placesTableView.reloadData()
        print("tableview reloaded #2")
        selectionBarConstraint.constant = CGFloat(75 * segmentPlaces.selectedSegmentIndex)
        UIView.animate(withDuration: 0.25, animations: {self.view.layoutIfNeeded()})
        let indexPath = IndexPath(item: 0, section: 0)
        
        
        // BUG: when segment = 0 and there are no selected places, following line will crash app: placesTableView.scrollToRow(at: indexPath, at: .top, animated: false)
        if segmentPlaces.selectedSegmentIndex != 0 {
            placesTableView.scrollToRow(at: indexPath, at: .top, animated: false)
        } else if segmentPlaces.selectedSegmentIndex == 0 {
            // use while loop?
            // way to avoid going through whole loop??
            for place in allPlaces {
                if defaults.bool(forKey: place.title) == true {
                    placesTableView.scrollToRow(at: indexPath, at: .top, animated: false)
                }
            }
        }
    }

    
    // This needs to be deleted soon enough, will be done in app delegate/onboarding screens.
    
    
    // DELETE??
    
    
    
    // DELETE??
    
    func setupJustMaps() {
        for place in places {
            defaults.set(false, forKey: place.title)
        }
        // Without next lines, the selection on secrets was extremely weird.
        for place in Secrets {
            defaults.set(false, forKey: place.title)
        }
        for place in Walks {
            defaults.set(false, forKey: place.title)
        }
        for place in Museums {
            defaults.set(false, forKey: place.title)
        }
        
        defaults.set(true, forKey: "JustMapsIsSetup")
        print("Setting up function is running")
    }
}
