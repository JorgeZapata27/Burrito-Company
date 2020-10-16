//
//  Support.swift
//  Burrito
//
//  Created by JJ Zapata on 8/16/20.
//  Copyright © 2020 Jorge Zapata. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class Support: UIViewController, UITextFieldDelegate {
    
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
        let key = Database.database().reference().child("Users").childByAutoId().key
        let values = [
            "uid" : Auth.auth().currentUser?.uid,
            "problem" : self.oldPasswordTF!.text!,
            "howLong" : self.newPasswordTF!.text!,
            "howImportant" : self.newPasswordTF2!.text!
        ]
        var post = ["\(key)" : values]
        Database.database().reference().child("TechnicalSupportLine").updateChildValues(post)
        let alertController = UIAlertController(title: "All Good", message: "Your message was sent to the team!", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Okay", style: .default, handler: { (alert) in
            self.navigationController?.popViewController(animated: true)
        }))
        self.present(alertController, animated: true, completion: nil)
    }

}

