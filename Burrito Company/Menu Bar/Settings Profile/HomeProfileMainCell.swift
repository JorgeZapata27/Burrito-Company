//
//  HomeProfileMainCell.swift
//  Burrito
//
//  Created by JJ Zapata on 8/13/20.
//  Copyright © 2020 Jorge Zapata. All rights reserved.
//

import UIKit

class HomeProfileMainCell: UITableViewCell {
    
    @IBOutlet var mainViewThatNeedsShadow : UIView!
    @IBOutlet var titleName : UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
