//
//  ActionSheetViewController.swift
//  TabBarUIDemo
//
//  Created by 鐘紀偉 on 15/1/30.
//  Copyright (c) 2015年 鐘紀偉. All rights reserved.
//

import Foundation
import UIKit


class ActionSheetViewController : UIViewController, UIActionSheetDelegate {

    override func viewDidLoad() {
        
        var button = UIButton.buttonWithType(UIButtonType.System) as UIButton
        button.frame = CGRectMake(100, 100, 50, 30)
        button.backgroundColor = UIColor.purpleColor()
        button.setTitle("aaaa", forState: UIControlState.Normal)
        button.addTarget(self, action: "onClick:", forControlEvents: UIControlEvents.TouchUpInside)
        
        self.view.addSubview(button)
        
    }
    
    func onClick(sender : UIButton) {
        let actionsheet = UIActionSheet(title: "选择一个你最喜欢的？", delegate: self, cancelButtonTitle: "😄", destructiveButtonTitle: "钟开益", otherButtonTitles: "胡丽", "钟继伟")
        
        actionsheet.showInView(self.view)
    }

    func actionSheet(actionSheet: UIActionSheet, clickedButtonAtIndex buttonIndex: Int) {
        var t = actionSheet.buttonTitleAtIndex(buttonIndex)
        println(t)
    }
    
    // Called when we cancel a view (eg. the user clicks the Home button). This is not called when the user clicks the cancel button.
    // If not defined in the delegate, we simulate a click in the cancel button
    func actionSheetCancel(actionSheet: UIActionSheet) {
        println(actionSheet.title)
    
    }

}