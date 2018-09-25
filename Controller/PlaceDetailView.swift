//
//  placeDetailView.swift
//  JustaMapp
//
//  Created by Robert Blundell on 16/11/2017.
//  Copyright © 2017 Robert Blundell. All rights reserved.
//

import UIKit

class PlaceDetailView: UIViewController {

    var place2: Place!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var placeImageView: UIImageView!
    @IBOutlet weak var descriptionText: UITextView!
    @IBOutlet var bgView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.text = place2.title
        placeImageView.image = place2.placeImage
        descriptionText.text = place2.longPlaceDescription
        bgView.addBlurEffectNormalView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        UIApplication.shared.statusBarStyle = .default
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        UIApplication.shared.statusBarStyle = .lightContent
    }
    
    @IBAction func dismissButtonPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    

}
