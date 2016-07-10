//
//  Meal.swift
//  FoodTracker
//
//  Created by 张旭 on 16/6/16.
//  Copyright © 2016年 cheri. All rights reserved.
//

import UIKit

class Meal :NSObject, NSCoding {
    
    //MARK 属性
    
    var name : String
    var photo : UIImage?
    var rating : Int
    var mydescription: String
    
    // MARK: Types
    struct PropertyKey {
        static let nameKey = "name"
        static let photoKey = "photo"
        static let ratingKey = "rating"
        static let descriptionKey = "description"
    }
    
    // MARK: Archiving Paths
    
    static let DocumentsDirectory = NSFileManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.URLByAppendingPathComponent("meals")
    
    init?(name: String, photo:UIImage?, rating: Int, description: String){
        // 初始化要存储的属性
        self.name = name
        self.photo = photo
        self.rating = rating
        self.mydescription = description
        
        super.init()
        
        // 如果没有名称或者评分为负数，就失败
        if name.isEmpty || rating < 0 {
            return nil
        }
    }
    
    
    // NSCoding
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(name, forKey: PropertyKey.nameKey)
        aCoder.encodeObject(photo, forKey: PropertyKey.photoKey)
        aCoder.encodeInteger(rating, forKey: PropertyKey.ratingKey)
        aCoder.encodeObject(mydescription, forKey: PropertyKey.descriptionKey)
    }

    required convenience init?(coder aDecoder: NSCoder) {
        let name = aDecoder.decodeObjectForKey(PropertyKey.nameKey) as! String
        
        // Because photo is an optional property of Meal, use conditional cast.
        let photo = aDecoder.decodeObjectForKey(PropertyKey.photoKey) as? UIImage
        
        let rating = aDecoder.decodeIntegerForKey(PropertyKey.ratingKey)
        
        let description = aDecoder.decodeObjectForKey(PropertyKey.descriptionKey) as! String
        
        // Must call designated initializer.
        self.init(name: name, photo: photo, rating: rating, description: description)
    }
    

}
