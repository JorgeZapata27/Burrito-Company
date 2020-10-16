//
//  ForgotPassword.swift
//  Burrito
//
//  Created by JJ Zapata on 8/13/20.
//  Copyright © 2020 Jorge Zapata. All rights reserved.
//

import UIKit
import FirebaseAuth

class ForgotPassword: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var email : UITextField!
    
    @IBOutlet var resetButton : UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.TextFieldSetup()
        self.ButtonsSetup()

        // Do any additional setup after loading the view.
    }
    
    func TextFieldSetup() {
        self.email.delegate = self
        self.email.layer.borderWidth = 2
        self.email.layer.cornerRadius = 10
        self.email.layer.borderColor = UIColor(red: 248/255, green: 248/255, blue: 248/255, alpha: 1).cgColor
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.email.delegate = self
        self.email.layer.borderWidth = 2
        self.email.layer.cornerRadius = 10
        self.email.layer.borderColor = UIColor(red: 255/255, green: 145/255, blue: 0/255, alpha: 1).cgColor
    }
    
    func ButtonsSetup() {
        self.resetButton.layer.cornerRadius = 10
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.ResetTextFieldBorders()
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.ResetTextFieldBorders()
        textField.resignFirstResponder()
        return (true)
    }
    
    func ResetTextFieldBorders() {
        self.email.delegate = self
        self.email.layer.borderWidth = 2
        self.email.layer.cornerRadius = 10
        self.email.layer.borderColor = UIColor(red: 248/255, green: 248/255, blue: 248/255, alpha: 1).cgColor
    }
    
    @IBAction func mainButtonPressed(_ sender: UIButton) {
        // firebase stuff
        Auth.auth().sendPasswordReset(withEmail: self.email.text!) { (error) in
            if let error = error {
                let alert = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Okay", style: .default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            } else {
                self.performSegue(withIdentifier: "toSuccessForgotPassword", sender: self)
            }
        }
    }

}
