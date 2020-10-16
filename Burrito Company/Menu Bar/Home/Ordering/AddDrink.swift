//
//  AddDrink.swift
//  Burrito Company
//
//  Created by JJ Zapata on 10/15/20.
//  Copyright © 2020 Jorge Zapata. All rights reserved.
//

import UIKit

class AddDrink: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func addSprite() {
        self.addOption(withPrice: 3.0, withTitle: "Sprite", withDescription: "3.0€")
    }
    
    @IBAction func addWasser() {
        self.addOption(withPrice: 2.0, withTitle: "Wasser", withDescription: "2.0€")
    }
    
    @IBAction func addSpzei() {
        self.addOption(withPrice: 3.0, withTitle: "Spezi", withDescription: "3.0€")
    }
    
    @IBAction func addCola() {
        self.addOption(withPrice: 3.0, withTitle: "Cola", withDescription: "3.0€")
    }
    
    func addOption(withPrice price: Double, withTitle title: String, withDescription desc: String) {
        // make an object
        let orderObject = OrderObject()
        orderObject.descriptionOfMenuItem = desc
        orderObject.titleOfMenuItem = title
        orderObject.priceOfMenuItem = price
        // add to global variable array
        GlobalVariables.orderList.append(orderObject)
        let secondAlert = UIAlertController(title: "Hinzugefügt!", message: "", preferredStyle: .alert)
        secondAlert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action) in
            self.dismiss(animated: true, completion: nil)
        }))
        self.present(secondAlert, animated: true, completion: nil)
    }

}
