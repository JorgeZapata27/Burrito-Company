//
//  HomeMenuPage.swift
//  Burrito
//
//  Created by JJ Zapata on 8/13/20.
//  Copyright © 2020 Jorge Zapata. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase

class HomeMenuPage: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let namesOfTitles = [" Entscheidungen", " Proteine", " Belag", " Extras"]
    let namesOfImages = ["image1", "image5", "image3", "image4"]
    
    var typesOfFood = [String()]
    var descsOfFood = [String()]
    var imageOfFood = [String()]
    
    var indexTaped = 100
    
    @IBOutlet var topNavView : UIView!
    @IBOutlet var bottomWhiteView : UIView!
    @IBOutlet var titleNameNav : UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        SetupViews()
        
        Database.database().reference().child("Users").child(Auth.auth().currentUser!.uid).child("firstname").observe(.value) { (snapshot) in
            let firstname : String = (snapshot.value as? String)!
            self.titleNameNav.text! = "Hallo, \(firstname)"
        }

        // Do any additional setup after loading the view.
    }
    
    func SetupViews() {
        self.topNavView.layer.cornerRadius = 30
        self.topNavView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        
        self.bottomWhiteView.layer.cornerRadius = 30
        self.bottomWhiteView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return namesOfTitles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeMainMenu", for: indexPath) as! HomeMenuMainCell
        cell.titleName.text = namesOfTitles[indexPath.row]
        cell.imageName.image = UIImage(named: namesOfImages[indexPath.row])
        cell.imageName.alpha = 0.5
        cell.mainViewThatNeedsShadow.dropShadow()
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 210
    }
        
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            // choices
            self.typesOfFood = ["Burrito",
                                "Burrinbo",
                                "Burrito Bowl",
                                "Mexican Salad"
                                ]
            self.descsOfFood = ["Gegrillter Torilla-Fladen, gefühlt mit Reis",
                                "Die kleine Version des Burritos - kostet 1,50 weniger",
                                "Burrito in einer Schale auf einem Reisbett, statt im Fladen",
                                "Frischer Salatmix mit einem gegrillten Torilla-Fladen",
                                ]
            self.imageOfFood = ["name", "name", "name", "name", "name", "name", "name", "name"]
            self.indexTaped = 0
        } else if indexPath.row == 1 {
            // proteins
            self.typesOfFood = ["Beef | 6,90",
                                "Chicken | 6,50",
                                "Pulled Pork | 7,50",
                                "Veggies | 6,50",
                                ]
            print(typesOfFood.count)
            self.descsOfFood = ["100% Rinderhackfleisch in fruchtig-würziger Sauce",
                                "Gegrilltes Hänchenbrustfilet",
                                "Zarte Schweineschulter, 24 Std. gegart, smokey flavour",
                                "Gegrilltes Gemüse",
                                ]
            print(descsOfFood.count)
            self.imageOfFood = ["name", "name", "name", "name", "name", "name", "name", "name", "name", "name", "name"]
            self.indexTaped = 1
        } else if indexPath.row == 2 {
            // insiders
            self.typesOfFood = ["Bohnenmus",
                                "Käse",
                                "Sour Cream",
                                "Chili Salsa",
                                "Classic Salsa",
                                "Mais",
                                "Salat Mix",
                                "Koriander"
                                ]
            print(typesOfFood.count)
            self.descsOfFood = ["",
                                "",
                                "",
                                "",
                                "",
                                "",
                                "",
                                "",
                                ]
            print(descsOfFood.count)
            self.imageOfFood = ["name", "name", "name", "name", "name", "name", "name", "name", "name", "name", "name", "name"]
            self.indexTaped = 2
        } else {
            // extras
            self.typesOfFood = ["Guacamole", "Extra Käse", "Grillgemüse", "Extra Hirtenkäse", "Extra Fleisch", "Extra Jalapeños"]
            self.descsOfFood = ["1,00€", "1,00€", "1,50€", "1,00€", "1,50€", "0,50€"]
            self.imageOfFood = ["name", "name", "name", "name", "name", "name"]
            self.indexTaped = 3
        }
        self.performSegue(withIdentifier: "toMenuCategory", sender: self)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toMenuCategory" {
            let secondController = segue.destination as! CategoryController
            secondController.descs = descsOfFood
            secondController.images = imageOfFood
            secondController.titles = typesOfFood
            secondController.typeOf = namesOfTitles[indexTaped]
        }
    }

}	
