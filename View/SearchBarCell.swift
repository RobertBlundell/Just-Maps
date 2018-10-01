//
//  SearchBarCell.swift
//  Just Maps
//
//  Created by Robert Blundell on 27/09/2018.
//  Copyright © 2018 Robert Blundell. All rights reserved.
//

import UIKit

class SearchBarCell: UITableViewCell {

    @IBOutlet weak var searchCellIcon: UIImageView!
    @IBOutlet weak var searchCellTitleButton: IndexButton!
    

    func configureSearchCell (cell: SearchBarCell, indexPath: IndexPath, array: [Place]) {
                
        let cellIconType = array[indexPath.row].placeType
        if cellIconType == PlaceType.church { cell.searchCellIcon.image =  #imageLiteral(resourceName: "Church") }
        if cellIconType == PlaceType.pointOfInterest { cell.searchCellIcon.image =  #imageLiteral(resourceName: "icon") }
        if cellIconType == PlaceType.skyscraper { cell.searchCellIcon.image =  #imageLiteral(resourceName: "Skyscraper") }
        if cellIconType == PlaceType.secret { cell.searchCellIcon.image =  #imageLiteral(resourceName: "Secret") }
        if cellIconType == PlaceType.walk { cell.searchCellIcon.image =  #imageLiteral(resourceName: "Walk") }
        if cellIconType == PlaceType.museum { cell.searchCellIcon.image =  #imageLiteral(resourceName: "Museum") }
        
        cell.searchCellTitleButton.setTitle(array[indexPath.row].title, for: .normal)
        cell.backgroundColor = UIColor.clear
        cell.searchCellTitleButton.indexPath = indexPath
    }
    
}
