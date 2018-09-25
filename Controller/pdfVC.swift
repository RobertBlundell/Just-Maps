//
//  pdfVC.swift
//  Just Maps
//
//  Created by Robert Blundell on 17/12/2017.
//  Copyright © 2017 Robert Blundell. All rights reserved.
//

import UIKit
import WebKit

class pdfVC: UIViewController, Rotatable {

    @IBOutlet weak var webKitViewTube: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let path = Bundle.main.path(forResource: "tubeMap", ofType: "pdf")
        let url = URL(fileURLWithPath: path!)
        let request = URLRequest(url: url)
        
        webKitViewTube.load(request)
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
        resetToPortrait()
    }
    
}
