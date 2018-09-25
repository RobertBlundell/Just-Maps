//
//  Side menu.swift
//  Just Maps
//
//  Created by Robert Blundell on 15/12/2017.
//  Copyright © 2017 Robert Blundell. All rights reserved.
//

import UIKit
import MessageUI

class ProfileVC: UIViewController, MFMailComposeViewControllerDelegate {
    
    @IBOutlet weak var bgPicture: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func contactButtonPressed(_ sender: Any) {
        sendEmail()
    }
    
    func sendEmail() {
        if MFMailComposeViewController.canSendMail() {
            let mail = MFMailComposeViewController()
            mail.mailComposeDelegate = self
            mail.setToRecipients(["r.a.blundell@warwick.ac.uk"])
            mail.setSubject("Just Maps contact")
            mail.setMessageBody("<p></p>", isHTML: true)
            
            self.present(mail, animated: true)
        } else {
            print("cannot send e-mail")
        }
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true)
    }
    
    @IBAction func InstagramButtonPressed(_ sender: Any) {
        let Username =  "r.a.blundell"
        let appURL = NSURL(string: "instagram://user?username=\(Username)")!
        let webURL = NSURL(string: "https://instagram.com/\(Username)")!
        let application = UIApplication.shared
        
        if application.canOpenURL(appURL as URL) {
            application.open(appURL as URL)
        } else {
            // if Instagram app is not installed, open URL inside Safari
            application.open(webURL as URL)
        }
    }
    
    
    
    
}
