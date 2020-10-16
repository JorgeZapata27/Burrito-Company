//
//  SelectPaymentAndProceed.swift
//  Nu Crepes
//
//  Created by JJ Zapata on 10/8/20.
//  Copyright © 2020 Jorge Zapata. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase

class SelectPaymentAndProceed: UIViewController {
    
    var cost = 0.00
    var pointCost = 0
    var order = [OrderObject]()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func removePoints() {
        print("extra")
        // remove from database
        Database.database().reference().child("Users").child(Auth.auth().currentUser!.uid).child("points").observeSingleEvent(of: .value) { (snapshot) in
            let value = snapshot.value as? NSNumber
            let newNumber = Int(value!)
            let newToUpload = newNumber - self.pointCost
            self.subtract(points: newToUpload)
        }
    }
    
    func subtract(points: Int) {
        let uyploadValue = [ "points" : Int(points) ] as [String : Any]
        Database.database().reference().child("Users").child(Auth.auth().currentUser!.uid).updateChildValues(uyploadValue)
    }
    
    func addToRedemptions() {
        // add to redemptions
        Database.database().reference().child("Users").child(Auth.auth().currentUser!.uid).child("numberOfRedemptions").observeSingleEvent(of: .value) { (snapshot) in
            let numberOfRedemptions = snapshot.value as? NSNumber
            let newNumber = Int(numberOfRedemptions!)
            let newToUpload = newNumber + 1
            self.add(number: newToUpload)
        }
    }
    
    func add(number: Int) {
        let uyploadValue = [ "numberOfRedemptions" : Int(number) ] as [String : Any]
        Database.database().reference().child("Users").child(Auth.auth().currentUser!.uid).updateChildValues(uyploadValue)
    }
    
    func completion() {
        self.removePoints()
        self.addToRedemptions()
        self.performSegue(withIdentifier: "toCompletedOrderScreen", sender: self)
    }
    
    @IBAction func point(_ sender: UIButton) {
        Database.database().reference().child("Users").child(Auth.auth().currentUser!.uid).child("points").observeSingleEvent(of: .value) { (totalPoints) in
            let value = totalPoints.value as? NSNumber
            let newNumber = Int(value!)
            if newNumber > self.pointCost {
                let alert = UIAlertController(title: "Sie haben genug Punkte!!", message: "Sind Sie sicher, dass Sie fortfahren wollen? Fahren Sie nur fort, wenn Sie am Schalter sind!", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Nein", style: .cancel, handler: nil))
                alert.addAction(UIAlertAction(title: "Ja", style: .default, handler: { (action) in
                    self.completion()
                    // pass order info
                }))
                self.present(alert, animated: true, completion: nil)
            } else {
                let alert = UIAlertController(title: "Fehler!", message: "nicht genügend Punkte. Etwas kaufen und einlösen!", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Okay", style: .default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toCompletedOrderScreen" {
            let secondController = segue.destination as! CompletedOrder
            secondController.order = self.order
        }
    }

}
