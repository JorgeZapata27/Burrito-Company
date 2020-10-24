//
//  HomeRewardsPage.swift
//  Burrito
//
//  Created by JJ Zapata on 8/13/20.
//  Copyright © 2020 Jorge Zapata. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase

class HomeRewardsPage: UIViewController {
    
    @IBOutlet var topNavView : UIView!
    @IBOutlet var middleView : UIView!
    @IBOutlet var getABurritoView : UIView!
    
    @IBOutlet var currentProgressBar : UIView!
    @IBOutlet var totalProgrssBarAll : UIView!
    
    @IBOutlet var titleNameNav : UILabel!
    @IBOutlet var actualPoints : UILabel!
    @IBOutlet var middlePoints : UILabel!
    
    let numberForFreeBurrito = 10

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.SetupViews()
        self.PullData()
        self.FindMeasurments()
        self.FreeBurritoBool()
    }
    
    func SetupViews() {
        self.topNavView.layer.cornerRadius = 30
        self.topNavView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        
        self.middleView.dropShadow()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    func FindMeasurments() {
        var visits = 0
        Database.database().reference().child("Users").child(Auth.auth().currentUser!.uid).child("points").observeSingleEvent(of: .value) { (totalPoints) in
            let value = totalPoints.value as? NSNumber
            // Find number of visits
            let visits = Int(value!)
            print("visits: " + "\(visits)")
            // find length of total progress
            let lengthOfAll = self.totalProgrssBarAll.frame.width
            print("lenghtOfTotal: " + "\(lengthOfAll)")
            // get the multiple of the amount needed
            let multipleOfNeed = Int(lengthOfAll) / self.numberForFreeBurrito
            print("multipleOfNeed: " + "\(multipleOfNeed)")
            // multiply the number of visits by the number of above
            let newWidth = multipleOfNeed * visits
            print("newWidth: " + "\(newWidth)")
            if visits >= self.numberForFreeBurrito {
                self.currentProgressBar.widthAnchor.constraint(equalToConstant: CGFloat(lengthOfAll)).isActive = true
            } else {
                self.currentProgressBar.widthAnchor.constraint(equalToConstant: CGFloat(newWidth)).isActive = true
            }
            
        }
        // set that number as the constraint for the current progress
    }
    
    func PullData() {
        Database.database().reference().child("Users").child(Auth.auth().currentUser!.uid).child("firstname").observe(.value, with: { (firstname) in
            let firstname : String = (firstname.value as? String)!
            self.titleNameNav.text! = "Hallo, \(firstname)"
        })
        
        Database.database().reference().child("Users").child(Auth.auth().currentUser!.uid).child("points").observeSingleEvent(of: .value) { (totalPoints) in
            let value = totalPoints.value as? NSNumber
            let newNumber = Int(value!)
            let string = String(newNumber)
            self.actualPoints!.text! = string
            self.middlePoints!.text! = "\(string) von 10"
        }

    }
    
    func FreeBurritoBool() {
        print("Free Burrito Bool")
        Database.database().reference().child("Users").child(Auth.auth().currentUser!.uid).child("points").observeSingleEvent(of: .value) { (totalPoints) in
            let value = totalPoints.value as? NSNumber
            let newNumber = Int(value!)
            print("Free Burrito Bool")
            if newNumber >= self.numberForFreeBurrito {
                self.getABurritoView.heightAnchor.constraint(equalToConstant: 35).isActive = true
                self.middleView.heightAnchor.constraint(equalToConstant: 132).isActive = true
            } else {
                self.getABurritoView.heightAnchor.constraint(equalToConstant: 0).isActive = true
                self.middleView.heightAnchor.constraint(equalToConstant: 98).isActive = true
            }
        }
    }
    
    @IBAction func orderredeem(_ sender: UIButton) {
        self.tabBarController!.selectedIndex = 0
    }

}

extension UIView {
    func dropShadow(scale: Bool = true) {
        layer.masksToBounds = false
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.2
        layer.shadowOffset = .zero
        layer.shadowRadius = 30
        layer.shouldRasterize = true
        layer.rasterizationScale = scale ? UIScreen.main.scale : 3
    }
    func dropShadow1(scale: Bool = true) {
        layer.masksToBounds = false
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.3
        layer.shadowOffset = .zero
        layer.shadowRadius = 10
        layer.shouldRasterize = true
        layer.rasterizationScale = scale ? UIScreen.main.scale : 3
    }
}
