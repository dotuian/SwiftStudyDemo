//
//  TextFieldViewController.swift
//  TabBarUIDemo
//
//  Created by 鐘紀偉 on 15/1/29.
//  Copyright (c) 2015年 鐘紀偉. All rights reserved.
//

import Foundation
import UIKit

class TextFieldViewController : UIViewController, UITextFieldDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

    
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "textFieldTextDidBeginEditingNotification:", name:UITextFieldTextDidBeginEditingNotification, object:nil)
        
        var textField = UITextField(frame: CGRectMake(10, 100, 300, 40))
        textField.backgroundColor = UIColor.clearColor()
        textField.textColor = UIColor.blackColor()
        textField.placeholder = "请输入..."
        textField.borderStyle = UITextBorderStyle.RoundedRect
        textField.adjustsFontSizeToFitWidth = true
        textField.delegate = self
        
        self.view.addSubview(textField)
    }
    
    func textFieldTextDidBeginEditingNotification(sender: NSNotification!) {
        
    }
    
    //    UITextFieldDelegate
    func textFieldShouldBeginEditing(textField: UITextField!) -> Bool {
        return true;
    }
    
    func textFieldDidBeginEditing(textField: UITextField!) {
    }
    
    func textFieldShouldEndEditing(textField: UITextField!) -> Bool {
        return true;
    }
    
    func textFieldDidEndEditing(textField: UITextField!) {
    }
    
    func textField(textField: UITextField!, shouldChangeCharactersInRange range: NSRange, replacementString string: String!) -> Bool {
        return true;
    }
    
    func textFieldShouldReturn(textField: UITextField!) -> Bool {
        return true;
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
        


}
