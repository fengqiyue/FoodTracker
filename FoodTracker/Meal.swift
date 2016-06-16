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
    
    // 初始化
    init?(name: String, photo:UIImage?, rating: Int){
        self.name = name
        self.photo = photo
        self.rating = rating
        
        if name.isEmpty || rating < 0 {
            return nil
        }
    }
    
    
    
    
    
    
    
}
