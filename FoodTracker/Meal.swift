//
//  Meal.swift
//  FoodTracker
//
//  Created by 张旭 on 16/6/16.
//  Copyright © 2016年 cheri. All rights reserved.
//

import UIKit

class Meal {
    //MARK 属性
    
    var name : String
    var photo : UIImage?
    var rating : Int
    
    
    init?(name: String, photo:UIImage?, rating: Int){
        // 初始化要存储的属性
        self.name = name
        self.photo = photo
        self.rating = rating
        
        // 如果没有名称或者评分为负数，就失败
        
        if name.isEmpty || rating < 0 {
            return nil
        }
    }
}
