//
//  HomeCategoryMenu.swift
//  Burrito
//
//  Created by JJ Zapata on 8/17/20.
//  Copyright © 2020 Jorge Zapata. All rights reserved.
//

import UIKit

class HomeCategoryMenu: UITableViewCell {
    
    @IBOutlet var largeView : UIView!
    @IBOutlet var itemImageView : UIImageView!
    @IBOutlet var textTitle : UILabel!
    @IBOutlet var textDescription : UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
