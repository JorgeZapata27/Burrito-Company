//
//  BurritoToppings.swift
//  Burrito Company
//
//  Created by JJ Zapata on 10/15/20.
//  Copyright © 2020 Jorge Zapata. All rights reserved.
//

import UIKit

class BurritoToppings: UIViewController {
    
    var burritoType = ""
    var burritoProtein = ""
    var burritoToppings = [String]()
    var totalToppings = ""
    
    @IBOutlet var button1 : UIButton!
    @IBOutlet var button2 : UIButton!
    @IBOutlet var button3: UIButton!
    @IBOutlet var button4 : UIButton!
    @IBOutlet var button5 : UIButton!
    @IBOutlet var button6 : UIButton!
    @IBOutlet var button7 : UIButton!
    @IBOutlet var button8 : UIButton!
    
    var is1S = false
    var is2S = false
    var is3S = false
    var is4S = false
    var is5S = false
    var is6S = false
    var is7S = false
    var is8S = false

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(burritoType)
        print(burritoProtein)

        // Do any additional setup after loading the view.
    }
    
    @IBAction func bohnenmus(_ sender: UIButton) {
        if self.is1S == true {
            self.button1.backgroundColor = UIColor(named: "textfieldColor")
            self.button1.setTitleColor(UIColor(named: "primaryColor"), for: .normal)
            self.is1S = false
        } else {
            self.button1.backgroundColor = UIColor.systemGreen
            self.button1.setTitleColor(UIColor.white, for: .normal)
            self.is1S = true
        }
    }
    
    @IBAction func classicSalsa(_ sender: UIButton) {
        if self.is2S == true {
            self.button2.backgroundColor = UIColor(named: "textfieldColor")
            self.button2.setTitleColor(UIColor(named: "primaryColor"), for: .normal)
            self.is2S = false
        } else {
            self.button2.backgroundColor = UIColor.systemGreen
            self.button2.setTitleColor(UIColor.white, for: .normal)
            self.is2S = true
        }
    }
    
    @IBAction func kase(_ sender: UIButton) {
        if self.is3S == true {
            self.button3.backgroundColor = UIColor(named: "textfieldColor")
            self.button3.setTitleColor(UIColor(named: "primaryColor"), for: .normal)
            self.is3S = false
        } else {
            self.button3.backgroundColor = UIColor.systemGreen
            self.button3.setTitleColor(UIColor.white, for: .normal)
            self.is3S = true
        }
    }
    
    @IBAction func mais(_ sender: UIButton) {
        if self.is4S == true {
            self.button4.backgroundColor = UIColor(named: "textfieldColor")
            self.button4.setTitleColor(UIColor(named: "primaryColor"), for: .normal)
            self.is4S = false
        } else {
            self.button4.backgroundColor = UIColor.systemGreen
            self.button4.setTitleColor(UIColor.white, for: .normal)
            self.is4S = true
        }
    }
    
    @IBAction func sourCream(_ sender: UIButton) {
        if self.is5S == true {
            self.button5.backgroundColor = UIColor(named: "textfieldColor")
            self.button5.setTitleColor(UIColor(named: "primaryColor"), for: .normal)
            self.is5S = false
        } else {
            self.button5.backgroundColor = UIColor.systemGreen
            self.button5.setTitleColor(UIColor.white, for: .normal)
            self.is5S = true
        }
    }
    
    @IBAction func salatMix(_ sender: UIButton) {
        if self.is6S == true {
            self.button6.backgroundColor = UIColor(named: "textfieldColor")
            self.button6.setTitleColor(UIColor(named: "primaryColor"), for: .normal)
            self.is6S = false
        } else {
            self.button6.backgroundColor = UIColor.systemGreen
            self.button6.setTitleColor(UIColor.white, for: .normal)
            self.is6S = true
        }
    }
    
    @IBAction func chiliSalsa(_ sender: UIButton) {
        if self.is7S == true {
            self.button7.backgroundColor = UIColor(named: "textfieldColor")
            self.button7.setTitleColor(UIColor(named: "primaryColor"), for: .normal)
            self.is7S = false
        } else {
            self.button7.backgroundColor = UIColor.systemGreen
            self.button7.setTitleColor(UIColor.white, for: .normal)
            self.is7S = true
        }
    }
    
    @IBAction func koriander(_ sender: UIButton) {
        if self.is8S == true {
            self.button8.backgroundColor = UIColor(named: "textfieldColor")
            self.button8.setTitleColor(UIColor(named: "primaryColor"), for: .normal)
            self.is8S = false
        } else {
            self.button8.backgroundColor = UIColor.systemGreen
            self.button8.setTitleColor(UIColor.white, for: .normal)
            self.is8S = true
        }
    }
    
    @IBAction func mainButtonPressed(_ sender: UIButton) {
        self.totalToppings = ""
        if self.is1S {
            self.burritoToppings.append("Bohnenmus")
        }
        if self.is2S {
            self.burritoToppings.append("Classic Salsa")
        }
        if self.is3S {
            self.burritoToppings.append("Käse")
        }
        if self.is4S {
            self.burritoToppings.append("Mais")
        }
        if self.is5S {
            self.burritoToppings.append("Sour Cream")
        }
        if self.is6S {
            self.burritoToppings.append("Salat-Mix")
        }
        if self.is7S {
            self.burritoToppings.append("Chili Salsa")
        }
        if self.is8S {
            self.burritoToppings.append("Koriander")
        }
        for topping in self.burritoToppings {
            self.totalToppings = ("\(self.totalToppings), \(topping)")
        }
        self.totalToppings.removeFirst()
        self.totalToppings.removeFirst()
        completeOrder()
    }
    
    func completeOrder() {
        // make an object
        let orderObject = OrderObject()
        orderObject.titleOfMenuItem = self.burritoType
        print("burritoType")
        print(burritoType)
        print("burritoType")
        if self.burritoProtein == "Beef" {
            orderObject.priceOfMenuItem = 6.90
        } else if self.burritoProtein == "Pulled Pork" {
            orderObject.priceOfMenuItem = 7.50
        } else if self.burritoProtein == "Chicken" {
            orderObject.priceOfMenuItem = 6.50
        } else if self.burritoProtein == "Veggies" {
            orderObject.priceOfMenuItem = 6.50
        } else {
            orderObject.priceOfMenuItem = 7.00
        }
        if self.totalToppings.isEmpty == true {
            orderObject.descriptionOfMenuItem = "\(self.burritoType), \(self.burritoProtein), Keine Beläge | \(orderObject.priceOfMenuItem!)€"
        } else {
            orderObject.descriptionOfMenuItem = "\(self.burritoType), \(self.burritoProtein), \(self.totalToppings) | \(orderObject.priceOfMenuItem!)€"
        }
        // add to global variable array
        GlobalVariables.orderList.append(orderObject)
        let secondAlert = UIAlertController(title: "Hinzugefügt!", message: "", preferredStyle: .alert)
        secondAlert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action) in
            self.view.window!.rootViewController?.dismiss(animated: true, completion: nil)
        }))
        self.present(secondAlert, animated: true, completion: nil)
    }

}
