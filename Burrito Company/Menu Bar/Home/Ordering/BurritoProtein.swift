//
//  BurritoProtein.swift
//  Burrito Company
//
//  Created by JJ Zapata on 10/15/20.
//  Copyright © 2020 Jorge Zapata. All rights reserved.
//

import UIKit

class BurritoProtein: UIViewController {
    
    var burritoType = ""

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func beef(_ sender: UIButton) {
        self.burritoProtein = "Beef"
        self.performSegue(withIdentifier: "toBurritoCustomization3", sender: self)
    }
    
    @IBAction func burritoBowl(_ sender: UIButton) {
        self.burritoProtein = "Pulled Pork"
        self.performSegue(withIdentifier: "toBurritoCustomization3", sender: self)
    }
    
    @IBAction func burrinbo(_ sender: UIButton) {
        self.burritoProtein = "Chicken"
        self.performSegue(withIdentifier: "toBurritoCustomization3", sender: self)
    }
    
    @IBAction func mexicanSalat(_ sender: UIButton) {
        self.burritoProtein = "Veggies"
        self.performSegue(withIdentifier: "toBurritoCustomization3", sender: self)
    }
    
    var burritoProtein = ""
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toBurritoCustomization3" {
            let secondController = segue.destination as! BurritoToppings
            secondController.burritoType = self.burritoType
            secondController.burritoProtein = self.burritoProtein
        }
    }

}
