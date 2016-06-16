//
//  RatingControl.swift
//  FoodTracker
//
//  Created by 张旭 on 16/6/16.
//  Copyright © 2016年 cheri. All rights reserved.
//

import UIKit

class RatingControl: UIView {

    //Initialization
    required init?(coder aDecoder: NSCoder) {
       
        super.init(coder: aDecoder)
        
        let filledStarImage = UIImage(named: "filledStar")
        let emptyStarImage = UIImage(named: "emptyStar")
        
        // 画按钮
        for _ in 0..<starCount {
            let button = UIButton()
            
            button.setImage(emptyStarImage, forState: .Normal)
            button.setImage(filledStarImage, forState: .Selected)
            button.setImage(filledStarImage, forState: [.Highlighted, .Selected])
            
            button.adjustsImageWhenHighlighted = false

            button.addTarget(self, action: #selector(ratingButtonTapped(_:)), forControlEvents: .TouchDown)
            ratingButtons += [button]
            addSubview(button)
        }
    }
    
    override func intrinsicContentSize() -> CGSize {
        let buttonSize = Int(frame.size.height)
        let width = (buttonSize * starCount) + (spacing * (starCount - 1))
        
        return CGSize(width: width, height: buttonSize)
    }
    
    override func layoutSubviews() {
        let buttonSize = Int(frame.size.height)
        var buttonFrame = CGRect(x: 0, y: 0, width: buttonSize, height: buttonSize)
        for (index, button) in ratingButtons.enumerate() {
            buttonFrame.origin.x = CGFloat(index * (buttonSize + 5))
            button.frame = buttonFrame
        }
        updateButtonSelectionStates()

    }
    
    //MARK Propertise
    var rating = 0 {
        didSet {
            setNeedsLayout()
        }
    }
    var ratingButtons = [UIButton]()
    let spacing = 5
    let starCount = 5
    

    // MARK Action
    func ratingButtonTapped(button: UIButton) {
        rating = ratingButtons.indexOf(button)! + 1
        
        updateButtonSelectionStates()
    }
    
    func updateButtonSelectionStates() {
         for (index, button) in ratingButtons.enumerate() {
            // 设置被选中的星星数，如果超过了设置的最大值，那就把选中的数目设置为最大值
            button.selected = index < rating
        }
    }
}
