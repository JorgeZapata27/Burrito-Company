//
//  HomeMenuMainCell.swift
//  Burrito
//
//  Created by JJ Zapata on 8/13/20.
//  Copyright © 2020 Jorge Zapata. All rights reserved.
//

import UIKit

class HomeMenuMainCell: UITableViewCell {
    
    @IBOutlet var mainViewThatNeedsShadow : UIView!
    @IBOutlet var titleName : UILabel!
    @IBOutlet var imageName : UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
