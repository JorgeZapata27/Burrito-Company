    //
//  HomeProfilePage.swift
//  Burrito
//
//  Created by JJ Zapata on 8/13/20.
//  Copyright © 2020 Jorge Zapata. All rights reserved.
//

import UIKit
import FirebaseDatabase
import FirebaseAuth
import BLTNBoard

class HomeProfilePage: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var nameTitles = [" Passwort Ändern", " Technischer Support", " Über Us", " Über Entwickler", " Ausloggen"]
    
    @IBOutlet var topNavView : UIView!
    @IBOutlet var bottomWhiteView : UIView!
    @IBOutlet var factview1 : UIView!
    @IBOutlet var factview2 : UIView!
    @IBOutlet var factview3: UIView!
    
    @IBOutlet var daysOfHaving : UILabel!
    @IBOutlet var actualPoints : UILabel!
    @IBOutlet var totalRedemptions : UILabel!
    @IBOutlet var titleNameNav : UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        SetupViews()
        PullData()
        
    }
    
    func PullData() {
        Database.database().reference().child("Users").child(Auth.auth().currentUser!.uid).child("firstname").observe(.value) { (snapshot) in
            let firstname : String = (snapshot.value as? String)!
            self.titleNameNav.text! = "Hallo, \(firstname)"
        }
        
        Database.database().reference().child("Users").child(Auth.auth().currentUser!.uid).child("points").observeSingleEvent(of: .value) { (totalPoints) in
            let value = totalPoints.value as? NSNumber
            let newNumber = Int(value!)
            let string = String(newNumber)
            self.actualPoints!.text! = string
        }
        
        Database.database().reference().child("Users").child(Auth.auth().currentUser!.uid).child("numberOfRedemptions").observeSingleEvent(of: .value) { (redeems) in
            let value = redeems.value as? NSNumber
            let newNumber = Int(value!)
            let string = String(newNumber)
            self.totalRedemptions!.text! = string
        }
        
        Database.database().reference().child("Users").child(Auth.auth().currentUser!.uid).child("memberSince").observeSingleEvent(of: .value) { (date) in
            let dateFrom : String = (date.value as? String)!
            self.daysOfHaving!.text! = dateFrom
        }

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
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.nameTitles.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeMainSettings", for: indexPath) as! HomeProfileMainCell
        cell.titleName.text = nameTitles[indexPath.row]
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            self.performSegue(withIdentifier: "toChangePassword", sender: self)
        case 1:
            self.performSegue(withIdentifier: "toSupport", sender: self)
        case 2:
            self.performSegue(withIdentifier: "toUs", sender: self)
        case 3:
            self.performSegue(withIdentifier: "toDeveloper", sender: self)
        case 4:
            let alert = UIAlertController(title: "Ausloggen?", message: "", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Nein", style: .default, handler: nil))
            alert.addAction(UIAlertAction(title: "Ja", style: .destructive, handler: { (action) in
                do {
                    try Auth.auth().signOut()
                    let sb = UIStoryboard(name: "Main", bundle: nil)
                    let vc: UIViewController = sb.instantiateViewController(withIdentifier: "SignInNav") as! Sign_In_Nav
                    UIApplication.shared.keyWindow?.rootViewController = vc
                } catch let error {
                    print(error)
                }
            }))
            self.present(alert, animated: true, completion: nil)
        default:
            print("error")
        }
    }

}
