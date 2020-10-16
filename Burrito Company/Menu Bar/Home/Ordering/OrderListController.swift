//
//  OrderListController.swift
//  Burrito
//
//  Created by JJ Zapata on 9/2/20.
//  Copyright © 2020 Jorge Zapata. All rights reserved.
//

import UIKit
import BLTNBoard

class OrderListController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var tableView : UITableView!
    @IBOutlet var totalPriceLabel : UILabel!
    @IBOutlet var totalPointLabel : UILabel!
    
    var orderItems = [OrderObject]()
    var timer: Timer!
    var totalPrice = 0.00
    var pointValue = 0.00

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(self.loop), userInfo: nil, repeats: true)
        
        //
    }
    
    @objc
    func loop() {
        print(GlobalVariables.orderList)
        self.orderItems.removeAll()
        self.orderItems = GlobalVariables.orderList
        self.totalPrice = 0
        for item in orderItems {
            self.totalPrice = self.totalPrice + item.priceOfMenuItem!
        }
        self.pointValue = self.totalPrice / 0.7
        self.totalPriceLabel!.text! = "Preis: \(self.totalPrice)€"
        self.totalPointLabel!.text! = "Punkte: \(Int(self.pointValue))"
        self.tableView.reloadData()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return orderItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "orderTotalListCell", for: indexPath) as! OrderMainCell
        cell.mainTitleOrderitem!.text! = self.orderItems[indexPath.row].titleOfMenuItem!
        cell.descriptionOrderIt!.text! = self.orderItems[indexPath.row].descriptionOfMenuItem!
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("ALERT TO REMOVE")
        timer.invalidate()
        let alert = UIAlertController(title: "Are you sure you want to remove item from the order", message: "", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: { (action) in
            GlobalVariables.orderList.remove(at: indexPath.row)
            self.viewWillAppear(true)
        }))
        alert.addAction(UIAlertAction(title: "No", style: .default, handler: { (action) in
            self.dismiss(animated: true, completion: nil)
        }))
        self.present(alert, animated: true, completion: nil)
        
    }
    
    @IBAction func makeASegue(_ sender: UIButton) {
        if self.orderItems.count > 0 {
            print("Price: \(self.totalPrice)")
            self.timer.invalidate()
            self.performSegue(withIdentifier: "toPayment", sender: self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toPayment" {
            let secondController = segue.destination as! SelectPaymentAndProceed
            secondController.cost = self.totalPrice
            secondController.order = self.orderItems
            secondController.pointCost = Int(self.pointValue)
        }
    }

}
