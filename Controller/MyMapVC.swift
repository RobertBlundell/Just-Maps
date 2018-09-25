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

class MyMapVC: UIViewController, MGLMapViewDelegate {

    @IBOutlet weak var placeTitleLabel: UILabel!
    @IBOutlet weak var descriptionTitleLabel: UILabel!
    @IBOutlet weak var placeViewToBottom: NSLayoutConstraint!
    @IBOutlet weak var placePopupImage: UIImageView!
    @IBOutlet weak var placeView: UIView!
    @IBOutlet weak var tubeButtonView: UIView!
    
    @IBOutlet weak var searchBar: UISearchBar!

    private var placeSelectedMap: Place!
    private var mapView: MGLMapView!
    
    //Offline Maps:
    private var progressView: UIProgressView!
    private var londonOfflineMapBounds: MGLCoordinateBounds!
    private var dim: UIView!
    private var mapDownloadMessage: UILabel!
    private var temporaryAnnotation: MGLPointAnnotation!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView = MGLMapView(frame: view.bounds)
        mapView.delegate = self
        mapView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        mapView.setCenter(CLLocationCoordinate2D(latitude: 51.507822, longitude: -0.109849), zoomLevel: 11, animated: false)
        view.addSubview(mapView)
        mapView.showsUserLocation = true
        
        searchBar.backgroundImage = UIImage()
        
        self.placeView.addBlurEffectNormalView()
        self.view.bringSubviewToFront(placeView)
        self.view.bringSubviewToFront(tubeButtonView)
        
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
        
        print(mapView.selectedAnnotations.count)
        
        if mapView.selectedAnnotations.count == 0 {
            placeViewToBottom.constant = -140
        } else {
            placeViewToBottom.constant = 49
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        UIApplication.shared.statusBarStyle = .default
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        UIApplication.shared.statusBarStyle = .lightContent
    }
    
    
    // Coding directions!
    
    @IBAction func Getdirectionsbutton(_ sender: Any) {
        placeSelectedMap.directionAPICallAndParse()
    
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
        placeViewToBottom.constant = 49
        UIView.animate(withDuration: 0.25, animations: {self.view.layoutIfNeeded()})
        let viewSquareImage = (annotation as? JustMapsPointAnnotation)?.place.placeImage
        placePopupImage.image = viewSquareImage
        placeTitleLabel.text = (annotation as? JustMapsPointAnnotation)?.place.title
        descriptionTitleLabel.text = (annotation as? JustMapsPointAnnotation)?.place.placeDescription

        let placeAnnotation = annotation as? JustMapsPointAnnotation
        placeSelectedMap = placeAnnotation?.place
        
        let temporarylatitude = placeAnnotation?.place.latitude
        let temporarylongitude = placeAnnotation?.place.longitude
        temporaryAnnotation = MGLPointAnnotation()
        temporaryAnnotation.coordinate = CLLocationCoordinate2D(latitude: temporarylatitude!, longitude: temporarylongitude!)
        mapView.addAnnotation(temporaryAnnotation)
    }
    
    func mapView(_ mapView: MGLMapView, didDeselect annotation: MGLAnnotation) {
        placeViewToBottom.constant = -140
        UIView.animate(withDuration: 0.25, animations: {self.view.layoutIfNeeded()})
        mapView.removeAnnotation(temporaryAnnotation)
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
                dim.frame = CGRect(x: (frame.width / 4 - 15), y: (frame.height * 0.75 - 15), width: (frame.width / 2 + 30), height: 68)
                dim.backgroundColor = UIColor(red: 30/250, green: 30/250, blue: 30/250, alpha: 0.8)
                dim.layer.cornerRadius = 4
                view.addSubview(dim)
                
                mapDownloadMessage = UILabel()
                mapDownloadMessage.frame = CGRect(x: (frame.width / 4 - 13), y: (frame.height * 0.75), width: (frame.width / 2 + 26), height: 50)
                mapDownloadMessage.numberOfLines = 2
                mapDownloadMessage.text = "Offline map downloading, this may take up to a minute."
                mapDownloadMessage.textColor = UIColor.white
                mapDownloadMessage.font = mapDownloadMessage.font.withSize(16)
                mapDownloadMessage.textAlignment = NSTextAlignment.center
                view.addSubview(mapDownloadMessage)
                
                progressView = UIProgressView(progressViewStyle: .default)
                progressView.frame = CGRect(x: frame.width / 4, y: frame.height * 0.75, width: frame.width / 2, height: 10)
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

