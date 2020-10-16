//
//  OrderMainCell.swift
//  Burrito
//
//  Created by JJ Zapata on 9/1/20.
//  Copyright © 2020 Jorge Zapata. All rights reserved.
//

import UIKit

class OrderMainCell: UITableViewCell {
    
    @IBOutlet var backgroundViewMain : UIView!
    @IBOutlet var imageColorViewMain : UIView!
    @IBOutlet var mainTitleOrderitem : UILabel!
    @IBOutlet var descriptionOrderIt : UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
