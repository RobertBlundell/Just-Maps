//
//  SecondViewController.swift
//  JustaMapp
//
//  Created by Robert Blundell on 08/11/2017.
//  Copyright © 2017 Robert Blundell. All rights reserved.
//

import UIKit
import Mapbox

class JustMapsPointAnnotation: MGLPointAnnotation {
    var placeType: PlaceType!
    var place: Place!
}

class MyMapVC: UIViewController, MGLMapViewDelegate, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {

    @IBOutlet weak var placeTitleLabel: UILabel!
    @IBOutlet weak var descriptionTitleLabel: UILabel!
    @IBOutlet weak var placeViewToBottom: NSLayoutConstraint!
    @IBOutlet weak var greenSliderPlaceView: NSLayoutConstraint!
    @IBOutlet weak var placePopupImage: UIImageView!
    @IBOutlet weak var placeView: UIView!
    @IBOutlet weak var placeViewTwo: UIView!
    @IBOutlet weak var tubeButtonView: UIView!
    @IBOutlet weak var directionsViewTemporary: UIView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var locationSelectorButton: UIButton!
    @IBOutlet weak var searchTableView: UITableView!
    @IBOutlet weak var containerViewForSearchTableView: UIView!
    @IBOutlet weak var containerViewForSearchTableViewHeight: NSLayoutConstraint!
    
    
    private var placeSelectedMap: Place!
    private var mapView: MGLMapView!
    
    //Offline Maps:
    private var progressView: UIProgressView!
    private var londonOfflineMapBounds: MGLCoordinateBounds!
    private var dim: UIView!
    private var mapDownloadMessage: UILabel!
    private var temporaryAnnotation: MGLPointAnnotation!
    private var insearchmode: Bool = false
    // Rearrange code in SearchBarCell to make following var private??
    var allPlacesSearched: [Place] = []


    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchTableView.delegate = self
        searchTableView.dataSource = self
        searchTableView.rowHeight = 40
        
        searchBar.delegate = self
        searchBar.returnKeyType = UIReturnKeyType.done

        
        mapView = MGLMapView(frame: view.bounds)
        mapView.delegate = self
        mapView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        mapView.setCenter(CLLocationCoordinate2D(latitude: 51.507822, longitude: -0.109849), zoomLevel: 11, animated: false)
        view.addSubview(mapView)
        mapView.showsUserLocation = true
        
        searchBar.backgroundImage = UIImage()
        
        self.placeViewTwo.addBlurEffectNormalView()
        
        
        self.view.bringSubviewToFront(placeView)
        self.view.bringSubviewToFront(tubeButtonView)
        self.view.bringSubviewToFront(containerViewForSearchTableView)
        
        //Offline Maps:
        
        //Define offline map bounds
        let ne = CLLocationCoordinate2D(latitude: 51.553175 , longitude: -0.024149)
        let sw = CLLocationCoordinate2D(latitude: 51.470033, longitude: -0.176439)
        londonOfflineMapBounds = MGLCoordinateBounds(sw: sw, ne: ne)
        
        // Setup offline pack notification handlers.
        NotificationCenter.default.addObserver(self, selector: #selector(offlinePackProgressDidChange), name: NSNotification.Name.MGLOfflinePackProgressChanged, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(offlinePackDidReceiveError), name: NSNotification.Name.MGLOfflinePackError, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(offlinePackDidReceiveMaximumAllowedMapboxTiles), name: NSNotification.Name.MGLOfflinePackMaximumMapboxTilesReached, object: nil)
        
        //Check for downloading map
        if defaults.bool(forKey: "mapHasDownloaded") == false {
            startOfflinePackDownload()
        }

        
    }

    override func viewDidAppear(_ animated: Bool) {
      
        reloadAnnotations()


    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        UIApplication.shared.statusBarStyle = .default
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        UIApplication.shared.statusBarStyle = .lightContent
         // TODO: set a new status bar style in every view did appear for the sake of consistency/ease. 
    }
    
    
    
    // TABLE VIEW STUFF HERE
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if insearchmode{
            return allPlacesSearched.count
        } else { return allPlaces.count}
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        if let cell = searchTableView.dequeueReusableCell(withIdentifier: "searchCell", for: indexPath) as? SearchBarCell {
            if insearchmode{
                cell.configureSearchCell(cell: cell, indexPath: indexPath, array: allPlacesSearched)
                    return cell
            } else {
                cell.configureSearchCell(cell: cell, indexPath: indexPath, array: allPlaces)
                    return cell
            }
        } else {
            return UITableViewCell()
        }
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        containerViewForSearchTableView.isHidden = false
        // Weird dynamics for when tableview appears: after Editing or after text is input into searchbar?? Two things activate it right now
    }

    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        containerViewForSearchTableView.isHidden = true
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchBar.text == "" || searchBar.text == nil {
            insearchmode = false
            searchTableView.reloadData()
            styleViewForTable()
        } else {
            insearchmode = true
            
            let lower = searchBar.text?.lowercased()
            allPlacesSearched = allPlaces.filter({$0.title.localizedStandardRange(of: lower!) != nil})
            searchTableView.reloadData()
            styleViewForTable()
        }
    }
    
    
    @IBAction func searchButtonPressed(_ button: IndexButton) {
        if insearchmode{
//            print(button.indexPath.row)
            let placeSearch = allPlacesSearched[button.indexPath.row]
            let latitude: CLLocationDegrees = placeSearch.latitude
            let longitude: CLLocationDegrees = placeSearch.longitude
            let coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
            mapView.setCenter(coordinate, animated: true)
            searchBar.text = ""
            containerViewForSearchTableView.isHidden = true
            defaults.set(true, forKey: placeSearch.title)
            reloadAnnotations()
            selectAnnotation(mapView: mapView, place: placeSearch)
        } else {
            let placeSearch = allPlaces[button.indexPath.row]
            let latitude = placeSearch.latitude
            let longitude = placeSearch.longitude
            let coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
            mapView.setCenter(coordinate, animated: true)
            searchBar.text = ""
            containerViewForSearchTableView.isHidden = true
            defaults.set(true, forKey: placeSearch.title)
            reloadAnnotations()
            selectAnnotation(mapView: mapView, place: placeSearch)
        }
    }
    
    func styleViewForTable () {
        if insearchmode{
            containerViewForSearchTableView.isHidden = false
            let tableCount = allPlacesSearched.count
            if tableCount < 5 {
                containerViewForSearchTableViewHeight.constant = CGFloat(tableCount * 40 - 1)
            } else {
                containerViewForSearchTableViewHeight.constant = CGFloat(199)
            }
        } else {
            containerViewForSearchTableViewHeight.constant = CGFloat(199)
            containerViewForSearchTableView.isHidden = true
        }
    }
    
    //END OF TABLE VIEW
    
    @IBAction func locationPressed(_ sender: Any) {
        greenSliderPlaceView.constant = 2
        UIView.animate(withDuration: 0.25, animations: {self.view.layoutIfNeeded()})
        directionsViewTemporary.isHidden = true
    }
    
    @IBAction func directionsPressed(_ sender: Any) {
        let sliderDisplacement = view.frame.size.width / 2 - 86
        greenSliderPlaceView.constant = sliderDisplacement
        UIView.animate(withDuration: 0.25, animations: {self.view.layoutIfNeeded()})
        directionsViewTemporary.isHidden = false
    }
    
    @IBAction func placeSelectButtonPressed(_ sender: Any) {
        
        let oldValue = defaults.bool(forKey: placeSelectedMap.title)
        defaults.set(!oldValue, forKey: placeSelectedMap.title)
        
        if defaults.bool(forKey: placeSelectedMap.title) == true {
            locationSelectorButton.setImage(#imageLiteral(resourceName: "Remove(long)"), for: .normal)
        } else { locationSelectorButton.setImage(#imageLiteral(resourceName: "AddToMap(long)"), for: .normal) }
        
        reloadAnnotations()
        placeViewToBottom.constant = 34
        placeView.layer.removeAllAnimations()
    }
    


    
    @objc(mapView:imageForAnnotation:)
    func mapView(_ mapView: MGLMapView, imageFor annotation: MGLAnnotation) -> MGLAnnotationImage? {
        
        var annotationImage = mapView.dequeueReusableAnnotationImage(withIdentifier: "Marker")
        
        if let castAnnotation = annotation as? JustMapsPointAnnotation {
            if castAnnotation.placeType == .pointOfInterest {
                annotationImage = MGLAnnotationImage(image: UIImage(named: "icon")!, reuseIdentifier: "Marker")
                return annotationImage
            } else if castAnnotation.placeType == .secret {
                annotationImage = MGLAnnotationImage(image: UIImage(named: "Secret")!, reuseIdentifier: "Marker1")
                return annotationImage
            } else if castAnnotation.placeType == .walk {
                annotationImage = MGLAnnotationImage(image: UIImage(named: "Walk")!, reuseIdentifier: "Marker2")
                return annotationImage
            } else if castAnnotation.placeType == .museum {
                annotationImage = MGLAnnotationImage(image: UIImage(named: "Museum")!, reuseIdentifier: "Marker3")
                return annotationImage
            } else if castAnnotation.placeType == .church {
                annotationImage = MGLAnnotationImage(image: UIImage(named: "Church")!, reuseIdentifier: "Marker4")
                return annotationImage
            } else {
                annotationImage = MGLAnnotationImage(image: UIImage(named: "Skyscraper")!, reuseIdentifier: "Marker5")
                return annotationImage
            }
        } else {
            annotationImage = MGLAnnotationImage(image: UIImage(named: "Select Button")!, reuseIdentifier: "Marker6")
            return annotationImage
        }
//        return nil
    }

    
    func mapView(_ mapView: MGLMapView, didSelect annotation: MGLAnnotation) {
        selectAnnotation(mapView: mapView, place: (annotation as? JustMapsPointAnnotation)?.place ?? allPlaces[0])
//        placeViewToBottom.constant = 34
//        UIView.animate(withDuration: 0.25, animations: {self.view.layoutIfNeeded()})
//        let viewSquareImage = (annotation as? JustMapsPointAnnotation)?.place.placeImage
//        placePopupImage.image = viewSquareImage
//        let placeTitle = (annotation as? JustMapsPointAnnotation)?.place.title
//        placeTitleLabel.text = placeTitle
//        descriptionTitleLabel.text = (annotation as? JustMapsPointAnnotation)?.place.placeDescription
//
//        if defaults.bool(forKey: placeTitle!) == true {
//            locationSelectorButton.setImage(#imageLiteral(resourceName: "Remove(long)"), for: .normal)
//        } else { locationSelectorButton.setImage(#imageLiteral(resourceName: "AddToMap(long)"), for: .normal) }
//
//
//        let placeAnnotation = annotation as? JustMapsPointAnnotation
//        placeSelectedMap = placeAnnotation?.place
//
//        let temporarylatitude = placeAnnotation?.place.latitude
//        let temporarylongitude = placeAnnotation?.place.longitude
//        temporaryAnnotation = MGLPointAnnotation()
//        temporaryAnnotation.coordinate = CLLocationCoordinate2D(latitude: temporarylatitude!, longitude: temporarylongitude!)
//        mapView.addAnnotation(temporaryAnnotation)
    }
    
    func mapView(_ mapView: MGLMapView, didDeselect annotation: MGLAnnotation) {
        placeViewToBottom.constant = -140
        UIView.animate(withDuration: 0.25, animations: {self.view.layoutIfNeeded()})
        mapView.removeAnnotation(temporaryAnnotation)
    }
    
    func selectAnnotation(mapView: MGLMapView, place: Place) {
        placeViewToBottom.constant = 34
        UIView.animate(withDuration: 0.25, animations: {self.view.layoutIfNeeded()})
        let viewSquareImage = place.placeImage
        placePopupImage.image = viewSquareImage
        let placeTitle = place.title
        placeTitleLabel.text = placeTitle
        descriptionTitleLabel.text = place.placeDescription
        
        if defaults.bool(forKey: placeTitle) == true {
            locationSelectorButton.setImage(#imageLiteral(resourceName: "Remove(long)"), for: .normal)
        } else { locationSelectorButton.setImage(#imageLiteral(resourceName: "AddToMap(long)"), for: .normal) }
        
        
        placeSelectedMap = place
        
        let temporarylatitude = place.latitude
        let temporarylongitude = place.longitude
        temporaryAnnotation = MGLPointAnnotation()
        temporaryAnnotation.coordinate = CLLocationCoordinate2D(latitude: temporarylatitude, longitude: temporarylongitude)
        mapView.addAnnotation(temporaryAnnotation)
    }


    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        if segue.identifier == "segueToPlaceDetail" {
            let nextVC = segue.destination as! PlaceDetailView
            nextVC.place2 = placeSelectedMap
        }
        if segue.identifier == "segueToTubeMap" {
            //code here??
        }
    }
    
    
    // func to draw the walk
    
    func drawWalk(walkName: String) {

        print("drawing walk")

        DispatchQueue.global(qos: .background).async(execute: {

            if let jsonPath = Bundle.main.path(forResource: walkName, ofType: "geojson"){
                do {
                    let data = try Data(contentsOf: URL(fileURLWithPath: jsonPath))
                    let shapeCollectionFeature = try MGLShape(data: data, encoding: String.Encoding.utf8.rawValue) as! MGLShapeCollectionFeature
                    if let polyline = shapeCollectionFeature.shapes.first as? MGLPolylineFeature {
                        polyline.title = polyline.attributes["name"] as? String
                        DispatchQueue.main.async(execute: {
                            [unowned self] in
                            self.mapView.addAnnotation(polyline)
                        })
                    }
                }
                catch {
                    print("GeoJSON parsing failed")
                }
            }
        })
    }

    func mapView(_ mapView: MGLMapView, strokeColorForShapeAnnotation annotation: MGLShape) -> UIColor {
        return UIColor(red: 122/255, green: 191/255, blue: 47/255, alpha: 1)
    }
    
    func reloadAnnotations() {
        
        if let currentAnnotations = mapView.annotations {
             mapView.removeAnnotations(currentAnnotations)
        }

        for place in allPlaces {
            if defaults.bool(forKey: place.title) == true {
                let point = JustMapsPointAnnotation()
                point.coordinate = CLLocationCoordinate2D(latitude: place.latitude, longitude: place.longitude)
                point.placeType = place.placeType
                point.place = place

                if place.placeType == .walk {
                    drawWalk(walkName: place.title)
                }

                mapView.addAnnotation(point)
            }
        }
    }
    
    
    //Offline maps:
    //Start
    
    
    func mapViewDidFinishLoadingMap(_ mapView: MGLMapView) {
        // Start downloading tiles and resources for z13-16.
//        startOfflinePackDownload()
    }
    
    deinit {
        // Remove offline pack observers.
        NotificationCenter.default.removeObserver(self)
    }

    
    func startOfflinePackDownload() {
        // Create a region that includes the current viewport and any tiles needed to view it when zoomed further in.
        // Because tile count grows exponentially with the maximum zoom level, you should be conservative with your `toZoomLevel` setting.
        let region = MGLTilePyramidOfflineRegion(styleURL: mapView.styleURL, bounds: londonOfflineMapBounds, fromZoomLevel: 10, toZoomLevel: 16)
        
        // Store some data for identification purposes alongside the downloaded resources.
        let userInfo = ["name": "My Offline Pack"]
        let context = NSKeyedArchiver.archivedData(withRootObject: userInfo)
        
        // Create and register an offline pack with the shared offline storage object.
        
        MGLOfflineStorage.shared().addPack(for: region, withContext: context) { (pack, error) in
            guard error == nil else {
                // The pack couldn’t be created for some reason.
                print("Error: \(error?.localizedDescription ?? "unknown error")")
                return
            }
            
            // Start downloading.
            pack!.resume()
        }
        
    }
    
    // MARK: - MGLOfflinePack notification handlers
    
    @objc func offlinePackProgressDidChange(notification: NSNotification) {
        // Get the offline pack this notification is regarding,
        // and the associated user info for the pack; in this case, `name = My Offline Pack`
        if let pack = notification.object as? MGLOfflinePack,
            let userInfo = NSKeyedUnarchiver.unarchiveObject(with: pack.context) as? [String: String] {
            let progress = pack.progress
            // or notification.userInfo![MGLOfflinePackProgressUserInfoKey]!.MGLOfflinePackProgressValue
            let completedResources = progress.countOfResourcesCompleted
            let expectedResources = progress.countOfResourcesExpected
            
            // Calculate current progress percentage.
            let progressPercentage = Float(completedResources) / Float(expectedResources)
            
            // Setup the progress bar.
            if progressView == nil {
                let frame = view.bounds.size
                
                dim = UIView()
                dim.frame = CGRect(x: (frame.width / 4 - 15), y: (frame.height * 0.15 - 15), width: (frame.width / 2 + 30), height: 68)
                dim.backgroundColor = UIColor(red: 30/250, green: 30/250, blue: 30/250, alpha: 0.8)
                dim.layer.cornerRadius = 4
                view.addSubview(dim)
                
                mapDownloadMessage = UILabel()
                mapDownloadMessage.frame = CGRect(x: (frame.width / 4 - 13), y: (frame.height * 0.15), width: (frame.width / 2 + 26), height: 50)
                mapDownloadMessage.numberOfLines = 2
                mapDownloadMessage.text = "Offline map downloading, this may take up to a minute."
                mapDownloadMessage.textColor = UIColor.white
                mapDownloadMessage.font = mapDownloadMessage.font.withSize(16)
                mapDownloadMessage.textAlignment = NSTextAlignment.center
                view.addSubview(mapDownloadMessage)
                
                progressView = UIProgressView(progressViewStyle: .default)
                progressView.frame = CGRect(x: frame.width / 4, y: frame.height * 0.15, width: frame.width / 2, height: 10)
                view.addSubview(progressView)
            }
            
            progressView.progress = progressPercentage
            //Next line is to ensure map doesn't always redownload
            defaults.set(true, forKey: "mapHasDownloaded")
            // If this pack has finished, print its size and resource count.
            if completedResources == expectedResources {
                progressView.removeFromSuperview()
                dim.removeFromSuperview()
                mapDownloadMessage.removeFromSuperview()
                let byteCount = ByteCountFormatter.string(fromByteCount: Int64(pack.progress.countOfBytesCompleted), countStyle: ByteCountFormatter.CountStyle.memory)
                print("Offline pack “\(userInfo["name"] ?? "unknown")” completed: \(byteCount), \(completedResources) resources")
            } else {
                // Otherwise, print download/verification progress.
                print("Offline pack “\(userInfo["name"] ?? "unknown")” has \(completedResources) of \(expectedResources) resources — \(progressPercentage * 100)%.")
            }
        }
    }
    
    @objc func offlinePackDidReceiveError(notification: NSNotification) {
        if let pack = notification.object as? MGLOfflinePack,
            let userInfo = NSKeyedUnarchiver.unarchiveObject(with: pack.context) as? [String: String],
            let error = notification.userInfo?[MGLOfflinePackUserInfoKey.error] as? NSError {
            print("Offline pack “\(userInfo["name"] ?? "unknown")” received error: \(error.localizedFailureReason ?? "unknown error")")
        }
    }
    
    @objc func offlinePackDidReceiveMaximumAllowedMapboxTiles(notification: NSNotification) {
        if let pack = notification.object as? MGLOfflinePack,
            let userInfo = NSKeyedUnarchiver.unarchiveObject(with: pack.context) as? [String: String],
            let maximumCount = (notification.userInfo?[MGLOfflinePackUserInfoKey.maximumCount] as AnyObject).uint64Value {
            print("Offline pack “\(userInfo["name"] ?? "unknown")” reached limit of \(maximumCount) tiles.")
        }
    }
    
    //Offline maps END    
    
}

