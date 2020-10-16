//
//  OnboardingScreen1.swift
//  Burrito
//
//  Created by JJ Zapata on 8/12/20.
//  Copyright © 2020 Jorge Zapata. All rights reserved.
//

import UIKit

class OnboardingScreen1: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

}
