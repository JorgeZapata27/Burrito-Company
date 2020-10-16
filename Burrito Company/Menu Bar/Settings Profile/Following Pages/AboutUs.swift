//
//  AboutUs.swift
//  Burrito
//
//  Created by JJ Zapata on 8/16/20.
//  Copyright © 2020 Jorge Zapata. All rights reserved.
//

import UIKit
import StoreKit

class AboutUs: UIViewController {
    
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
    
    @IBAction func callTeam() {
        if let url = URL(string: "tel://\(08921965986)") {
            UIApplication.shared.open(url)
        }
    }
    
    @IBAction func openWebsite() {
        if let url = URL(string: "https://burrito-company.de/") {
            UIApplication.shared.open(url)
        }
    }
    
    @IBAction func rateUs() {
        let writeReviewURL = URL(string: "https://itunes.apple.com/app/id15355965537?action=write-review")
        UIApplication.shared.open(writeReviewURL!, options: [:], completionHandler: nil)
    }

}
