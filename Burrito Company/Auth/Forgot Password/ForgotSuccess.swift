//
//  ForgotSuccess.swift
//  Burrito
//
//  Created by JJ Zapata on 8/13/20.
//  Copyright © 2020 Jorge Zapata. All rights reserved.
//

import UIKit

class ForgotSuccess: UIViewController {
    
    @IBOutlet var backButton : UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.ButtonsSetup()

        // Do any additional setup after loading the view.
    }
    
    func ButtonsSetup() {
        self.backButton.layer.cornerRadius = 10
    }
    
    @IBAction func mainButtonPressed(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
        self.navigationController?.popViewController(animated: true)
    }

}
