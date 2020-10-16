//
//  HomeOrderController.swift
//  Burrito
//
//  Created by JJ Zapata on 8/17/20.
//  Copyright © 2020 Jorge Zapata. All rights reserved.
//

import UIKit

class HomeOrderController: UIViewController {
    
    @IBOutlet var topNavView : UIView!
    @IBOutlet var bottomWhiteView : UIView!
    @IBOutlet var eatInView : UIView!
    @IBOutlet var deliveryView : UIView!
    @IBOutlet var pickupView : UIView!

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
    }

}
