//
//  HomeScanView.swift
//  Burrito
//
//  Created by JJ Zapata on 8/13/20.
//  Copyright © 2020 Jorge Zapata. All rights reserved.
//

import UIKit
import FirebaseDatabase
import FirebaseAuth
import AVFoundation
import SceneKit
import ARKit
import BLTNBoard

class HomeScanView: UIViewController, AVCaptureMetadataOutputObjectsDelegate, ARSCNViewDelegate {
    
    @IBOutlet var middleView : UIView!
    @IBOutlet var sceneView : ARSCNView!
    
    var Points : Int?

    lazy var bulletinManager: BLTNItemManager = {
        let page = BLTNPageItem(title: "Card Found!")
        page.descriptionText = "Add 1 Visit?"
        let greenColor = UIColor(red: 235/255, green: 149/255, blue: 35/255, alpha: 1)
        page.appearance.actionButtonColor = greenColor
        page.appearance.alternativeButtonTitleColor = greenColor
        page.appearance.actionButtonTitleColor = .white
        page.actionButtonTitle = "Yes!"
        page.alternativeButtonTitle = "Not yet"
        page.actionHandler = { (item: BLTNActionItem) in
            print("Action button tapped")
            let uid = Auth.auth().currentUser!.uid
            Database.database().reference().child("Users").child(uid).child("points").observeSingleEvent(of: .value, with: { (snapshot) in
                // Get user value
                let value = snapshot.value as? NSNumber
                let newNumber = Int(Int((value!)) + 1)
                Database.database().reference().child("Users").child(uid).child("points").setValue(newNumber)
                print(String(newNumber))
                item.manager?.dismissBulletin(animated: true)
                self.navigationController?.popViewController(animated: true)
              }) { (error) in
                print(error.localizedDescription)
            }
        }
        page.alternativeHandler = { (item: BLTNActionItem) in
            print("Alternative button tapped")
            item.manager?.dismissBulletin(animated: true)
            self.navigationController?.popViewController(animated: true)
        }
        return BLTNItemManager(rootItem: page)
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        SetupViews()
        
        sceneView.delegate = self
        sceneView.showsStatistics = false
        let scene = SCNScene(named: "art.scnassets/ship.scn")!

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let config = ARImageTrackingConfiguration()
        let images = ARReferenceImage.referenceImages(inGroupNamed: "images", bundle: nil)
        config.trackingImages = images!
        sceneView.session.run(config)
    }
        
    func PointPuncture() {
        let uid = Auth.auth().currentUser!.uid
        Database.database().reference().child("Users").child(uid).child("points").observe(.childAdded, with: { (data) in
            var name = (data.value as? Int)!
            self.Points = name
            debugPrint(name)
        })
    }
    
    func SetupViews() {
        self.middleView.layer.cornerRadius = 25
        self.middleView.dropShadow()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        sceneView.session.pause()
    }
    
    func renderer(_ renderer: SCNSceneRenderer, didAdd node: SCNNode, for anchor: ARAnchor) {
        guard let imageAnchor = anchor as? ARImageAnchor else { return }
        let name = imageAnchor.referenceImage.name!
        switch name {
        case "IMG_2854":
            DispatchQueue.main.async {
                
                self.callData()
            }
            break;
        default:
            print("Hello")
            DispatchQueue.main.async {
                
                self.callData()
            }
            break;
        }
    }
    
    func callData() {
        self.bulletinManager.showBulletin(above: self)
    }

}
