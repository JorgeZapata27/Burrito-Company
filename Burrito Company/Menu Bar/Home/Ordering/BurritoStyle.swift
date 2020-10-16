//
//  BurritoStyle.swift
//  Burrito Company
//
//  Created by JJ Zapata on 10/15/20.
//  Copyright © 2020 Jorge Zapata. All rights reserved.
//

import UIKit

class BurritoStyle: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func burrito(_ sender: UIButton) {
        self.burritoType = "Burrito"
        self.performSegue(withIdentifier: "toBurritoCustomization2", sender: self)
    }
    
    @IBAction func burritoBowl(_ sender: UIButton) {
        self.burritoType = "Burrito Bowl"
        self.performSegue(withIdentifier: "toBurritoCustomization2", sender: self)
    }
    
    @IBAction func burrinbo(_ sender: UIButton) {
        self.burritoType = "Burrinbo"
        self.performSegue(withIdentifier: "toBurritoCustomization2", sender: self)
    }
    
    @IBAction func mexicanSalat(_ sender: UIButton) {
        self.burritoType = "Mexican Salat"
        self.performSegue(withIdentifier: "toBurritoCustomization2", sender: self)
    }
    
    var burritoType = ""
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toBurritoCustomization2" {
            let secondController = segue.destination as! BurritoProtein
            secondController.burritoType = self.burritoType
        }
    }

}
