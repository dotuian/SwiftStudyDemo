//
//  SettingViewController.swift
//  countdown
//
//  Created by 鐘紀偉 on 15/2/5.
//  Copyright (c) 2015年 鐘紀偉. All rights reserved.
//

import Foundation
import UIKit

class SettingViewController : UIViewController  {
    
    
    override func viewDidLoad() {
    
        self.view.backgroundColor = UIColor.whiteColor()
        
        // title
        self.navigationItem.title = NSLocalizedString("VIEW_SETTING_TITLE", comment: "")
        
        
        
        // 导航栏按钮
        var cancelButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Cancel, target: self, action: "cancel")
        var saveButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Save, target: self, action: "save")
        
        self.navigationItem.leftBarButtonItem = cancelButton
        self.navigationItem.rightBarButtonItem = saveButton

        
    }
    
    
    func save(){
        println("=== save ===")
        self.navigationController?.dismissViewControllerAnimated(true, completion: {})
    }
    
    func cancel(){
        println("=== cancel ===")
        self.navigationController?.dismissViewControllerAnimated(true, completion: {})
    }

}