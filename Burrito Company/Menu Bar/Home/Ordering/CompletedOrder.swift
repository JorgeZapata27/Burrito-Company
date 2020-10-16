//
//  CompletedOrder.swift
//  Nu Crepes
//
//  Created by JJ Zapata on 10/9/20.
//  Copyright © 2020 Jorge Zapata. All rights reserved.
//

import UIKit

class CompletedOrder: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var order = [OrderObject]()
    
    @IBOutlet var datumLabel : UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
         
        let formatter3 = DateFormatter()
        formatter3.dateFormat = "HH:mm E, d MMM y"
        self.datumLabel!.text! = formatter3.string(from: Date())

        // Do any additional setup after loading the view.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.order.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "orderCompleteCell", for: indexPath) as! HomeCategoryMenu
        cell.textTitle!.text! = self.order[indexPath.row].titleOfMenuItem!
        cell.textDescription!.text! = self.order[indexPath.row].descriptionOfMenuItem!
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("selected row: \(indexPath.row)")
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 95
    }
    
    @IBAction func doneButtonPressed(_ sender: UIButton) {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc: UIViewController = sb.instantiateViewController(withIdentifier: "TabBarMain") as! MainTabBarController
        UIApplication.shared.keyWindow?.rootViewController = vc
    }

}
