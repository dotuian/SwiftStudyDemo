//
//  UIButtonViewController.swift
//  TabBarUIDemo
//
//  Created by 鐘紀偉 on 15/1/29.
//  Copyright (c) 2015年 鐘紀偉. All rights reserved.
//

import Foundation
import UIKit

class ButtonViewController : UIViewController {

    override func viewDidLoad() {
        self.title = "UIButton示范"

        var button = UIButton.buttonWithType(UIButtonType.System) as UIButton
        button.frame = CGRectMake(100, 200, 100, 100)
        button.setTitleColor(UIColor.redColor(), forState : UIControlState.Normal)
        button.setTitleColor(UIColor.greenColor(), forState: UIControlState.Selected)
     
        button.setTitle("Normal", forState: UIControlState.Normal)
        button.setTitle("Selected", forState:UIControlState.Selected)
        
        button.tag = 100
        button.clipsToBounds = true
        button.layer.cornerRadius = 5
        
        button.addTarget(self, action: "onClick:", forControlEvents: UIControlEvents.TouchUpInside)
        
        self.view.addSubview(button)
        
    }
    
    
    func onClick(sender : UIButton){
    
        println("===== on click ======")
    
    }

}