//
//  OnboardingScreen3.swift
//  Burrito
//
//  Created by JJ Zapata on 8/12/20.
//  Copyright © 2020 Jorge Zapata. All rights reserved.
//

import UIKit

class OnboardingScreen3: UIViewController {
    
    @IBOutlet var signInButton : UIButton!
    @IBOutlet var signUpButton : UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.configureSignInButton()
        self.configureSignUpButton()

        // Do any additional setup after loading the view.
    }
    
    func configureSignInButton() {
        self.signInButton.layer.borderColor = UIColor(named: "primaryColor")?.cgColor
        self.signInButton.layer.borderWidth = 3
        self.signInButton.layer.cornerRadius = self.signInButton.frame.height / 5
    }
    
    func configureSignUpButton() {
        self.signUpButton.layer.cornerRadius = self.signInButton.frame.height / 5
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    @IBAction func signInButtonPressed(sender: UIButton) {
        DispatchQueue.main.async {
            // set user defaults
            UserDefaults.standard.set(true, forKey: "onboardingSeen")
            
            // transfer to the sign up page
            let sb = UIStoryboard(name: "Main", bundle: nil)
            let vc: UIViewController = sb.instantiateViewController(withIdentifier: "SignInNav") as! Sign_In_Nav
            UIApplication.shared.keyWindow?.rootViewController = vc
        }
    }
    
    @IBAction func signUpButtonPressed(sender: UIButton) {
        DispatchQueue.main.async {
            // set user defaults
            UserDefaults.standard.set(true, forKey: "onboardingSeen")
            
            // transfer to the sign up page
            let sb = UIStoryboard(name: "Main", bundle: nil)
            let vc: UIViewController = sb.instantiateViewController(withIdentifier: "SignUpNav") as! Sign_Up_Nav
            UIApplication.shared.keyWindow?.rootViewController = vc
        }
    }
}
