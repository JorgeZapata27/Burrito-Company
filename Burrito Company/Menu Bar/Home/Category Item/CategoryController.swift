//
//  CategoryController.swift
//  Burrito
//
//  Created by JJ Zapata on 8/17/20.
//  Copyright © 2020 Jorge Zapata. All rights reserved.
//

import UIKit

class CategoryController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var topNavView : UIView!
    @IBOutlet var categoryView : UIView!
    @IBOutlet var categoryLabel : UILabel!
    
    var images = [String()]
    var titles = [String()]
    var descs = [String()]
    
    var typeOf = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.SetupViews()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.categoryLabel!.text! = self.typeOf
    }
    
    func SetupViews() {
        self.topNavView.layer.cornerRadius = 30
        self.topNavView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        
        self.categoryView.dropShadow()
        self.categoryView.layer.cornerRadius = 12
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.titles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "menuCatItemCell", for: indexPath) as! HomeCategoryMenu
        cell.largeView.dropShadow1()
        cell.textTitle!.text! = titles[indexPath.row]
        cell.textDescription!.text! = descs[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("hello")
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 95
    }

}
