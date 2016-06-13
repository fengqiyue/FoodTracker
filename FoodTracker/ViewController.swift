//
//  ViewController.swift
//  FoodTracker
//
//  Created by 张旭 on 16/6/13.
//  Copyright © 2016年 cheri. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    // 属性
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var mealNameLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //通过代理的回调，处理文本域的用户输入
        nameTextField.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //Action
    @IBAction func setDefaultLabelText(sender: UIButton) {
        mealNameLabel.text = "缺省值"
    }
    
    // MARK: UITextFieldDelegate
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        //隐藏键盘
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        mealNameLabel.text = textField.text
    }

}

