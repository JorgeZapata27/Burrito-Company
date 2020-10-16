//
//  ChangePassword.swift
//  Burrito
//
//  Created by JJ Zapata on 8/16/20.
//  Copyright © 2020 Jorge Zapata. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class ChangePassword: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var topNavView : UIView!
    @IBOutlet var bottomWhiteView : UIView!
    @IBOutlet var middleView : UIView!
    
    @IBOutlet var oldPasswordTF : UITextField!
    @IBOutlet var newPasswordTF : UITextField!
    @IBOutlet var newPasswordTF2 : UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        SetupViews()
        TextFieldSetup()

        // Do any additional setup after loading the view.
    }
    
    func SetupViews() {
        self.topNavView.layer.cornerRadius = 30
        self.topNavView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        
        self.bottomWhiteView.layer.cornerRadius = 30
        self.bottomWhiteView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        
        self.middleView.dropShadow()
        self.middleView.layer.cornerRadius = 20
    }
    
    func TextFieldSetup() {
        self.oldPasswordTF.delegate = self
        self.oldPasswordTF.layer.borderWidth = 2
        self.oldPasswordTF.layer.cornerRadius = 10
        self.oldPasswordTF.layer.borderColor = UIColor(named: "textfieldColor")?.cgColor
        
        self.newPasswordTF.delegate = self
        self.newPasswordTF.layer.borderWidth = 2
        self.newPasswordTF.layer.cornerRadius = 10
        self.newPasswordTF.layer.borderColor = UIColor(named: "textfieldColor")?.cgColor
        
        self.newPasswordTF2.delegate = self
        self.newPasswordTF2.layer.borderWidth = 2
        self.newPasswordTF2.layer.cornerRadius = 10
        self.newPasswordTF2.layer.borderColor = UIColor(named: "textfieldColor")?.cgColor
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        switch textField {
        case self.oldPasswordTF:
            self.oldPasswordTF.delegate = self
            self.oldPasswordTF.layer.borderWidth = 2
            self.oldPasswordTF.layer.cornerRadius = 10
            self.oldPasswordTF.layer.borderColor = UIColor(named: "primaryColor")?.cgColor
            
            self.newPasswordTF.delegate = self
            self.newPasswordTF.layer.borderWidth = 2
            self.newPasswordTF.layer.cornerRadius = 10
            self.newPasswordTF.layer.borderColor = UIColor(named: "textfieldColor")?.cgColor
            
            self.newPasswordTF2.delegate = self
            self.newPasswordTF2.layer.borderWidth = 2
            self.newPasswordTF2.layer.cornerRadius = 10
            self.newPasswordTF2.layer.borderColor = UIColor(named: "textfieldColor")?.cgColor
        case self.newPasswordTF:
            self.oldPasswordTF.delegate = self
            self.oldPasswordTF.layer.borderWidth = 2
            self.oldPasswordTF.layer.cornerRadius = 10
            self.oldPasswordTF.layer.borderColor = UIColor(named: "textfieldColor")?.cgColor
            
            self.newPasswordTF.delegate = self
            self.newPasswordTF.layer.borderWidth = 2
            self.newPasswordTF.layer.cornerRadius = 10
            self.newPasswordTF.layer.borderColor = UIColor(named: "primaryColor")?.cgColor
            
            self.newPasswordTF2.delegate = self
            self.newPasswordTF2.layer.borderWidth = 2
            self.newPasswordTF2.layer.cornerRadius = 10
            self.newPasswordTF2.layer.borderColor = UIColor(named: "textfieldColor")?.cgColor
        case self.newPasswordTF2:
            self.oldPasswordTF.delegate = self
            self.oldPasswordTF.layer.borderWidth = 2
            self.oldPasswordTF.layer.cornerRadius = 10
            self.oldPasswordTF.layer.borderColor = UIColor(named: "textfieldColor")?.cgColor
            
            self.newPasswordTF.delegate = self
            self.newPasswordTF.layer.borderWidth = 2
            self.newPasswordTF.layer.cornerRadius = 10
            self.newPasswordTF.layer.borderColor = UIColor(named: "textfieldColor")?.cgColor
            
            self.newPasswordTF2.delegate = self
            self.newPasswordTF2.layer.borderWidth = 2
            self.newPasswordTF2.layer.cornerRadius = 10
            self.newPasswordTF2.layer.borderColor = UIColor(named: "primaryColor")?.cgColor
        default:
            print("Another tf")
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.ResetTextFieldBorders()
        textField.resignFirstResponder()
        return (true)
    }
    
    func ResetTextFieldBorders() {
        self.newPasswordTF.delegate = self
        self.newPasswordTF.layer.borderWidth = 2
        self.newPasswordTF.layer.cornerRadius = 10
        self.newPasswordTF.layer.borderColor = UIColor(named: "textfieldColor")?.cgColor
        
        self.oldPasswordTF.delegate = self
        self.oldPasswordTF.layer.borderWidth = 2
        self.oldPasswordTF.layer.cornerRadius = 10
        self.oldPasswordTF.layer.borderColor = UIColor(named: "textfieldColor")?.cgColor
        
        self.newPasswordTF2.delegate = self
        self.newPasswordTF2.layer.borderWidth = 2
        self.newPasswordTF2.layer.cornerRadius = 10
        self.newPasswordTF2.layer.borderColor = UIColor(named: "textfieldColor")?.cgColor
    }
    
    @IBAction func submitButtonPressed(_ sender: UIButton) {
        if self.newPasswordTF!.text! == self.newPasswordTF2!.text! {
            Auth.auth().currentUser?.updatePassword(to: self.newPasswordTF!.text!, completion: { (error) in
                if error == nil {
                    let alertController = UIAlertController(title: "All good!", message: "Your password was changed successfully!", preferredStyle: .alert)
                    alertController.addAction(UIAlertAction(title: "Okay", style: .default, handler: { (action) in
                        self.navigationController?.popViewController(animated: true)
                    }))
                    self.present(alertController, animated: true, completion: nil)
                } else {
                    let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                    alertController.addAction(UIAlertAction(title: "Okay", style: .default, handler: nil))
                    self.present(alertController, animated: true, completion: nil)
                }
            })
        } else {
            let alertController = UIAlertController(title: "Error", message: "Make sure your new password matches the confirmation text box", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "Okay", style: .default, handler: nil))
            self.present(alertController, animated: true, completion: nil)
        }
        
    }

}
