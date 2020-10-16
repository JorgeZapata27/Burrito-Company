//
//  AboutDeveloper.swift
//  Burrito
//
//  Created by JJ Zapata on 8/16/20.
//  Copyright © 2020 Jorge Zapata. All rights reserved.
//

import UIKit
import MessageUI

class AboutDeveloper: UIViewController, MFMailComposeViewControllerDelegate {
        
    @IBOutlet var topNavView : UIView!
    @IBOutlet var bottomWhiteView : UIView!
    @IBOutlet var factview1 : UIView!
    @IBOutlet var factview2 : UIView!
    @IBOutlet var factview3: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        SetupViews()

        // Do any additional setup after loading the view.
    }
    
    func SetupViews() {
        self.topNavView.layer.cornerRadius = 30
        self.topNavView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        
        self.bottomWhiteView.layer.cornerRadius = 30
        self.bottomWhiteView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        
        self.factview1.layer.cornerRadius = 12
        self.factview1.dropShadow()
        
        self.factview2.layer.cornerRadius = 12
        self.factview2.dropShadow()
        
        self.factview3.layer.cornerRadius = 12
        self.factview3.dropShadow()
    }
    
    @IBAction func emailDeveloper() {
        let recipientEmail = "jorgejaden@gmail.com"
        if MFMailComposeViewController.canSendMail() {
            let mail = MFMailComposeViewController()
            mail.mailComposeDelegate = self
            mail.setToRecipients([recipientEmail])
            present(mail, animated: true)
        } else {
            let alertController = UIAlertController(title: "You don't have the Apple Mail app ", message: "Feel free to manually email me at jorgejaden@gmail.com", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "Okay", style: .default, handler: nil))
            self.present(alertController, animated: true, completion: nil)
        }
    }
    
    @IBAction func openWebsite() {
        if let url = URL(string: "https://jorgezapata-mun.netlify.app/") {
            UIApplication.shared.open(url)
        }
    }
    
    @IBAction func openInstagram() {
        if let url = URL(string: "https://www.instagram.com/jorge_zapata27/") {
            UIApplication.shared.open(url)
        }
    }

}
