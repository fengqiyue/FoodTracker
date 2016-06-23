//
//  MealTableViewCell.swift
//  FoodTracker
//
//  Created by 张旭 on 16/6/17.
//  Copyright © 2016年 cheri. All rights reserved.
//

import UIKit

class MealTableViewCell: UITableViewCell {
    
    //MARK 属性
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var ratingControl: RatingControl!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    
    override func setSelected(selected:Bool, animated:Bool) {
        super.setSelected(selected, animated:animated)
    }

}
