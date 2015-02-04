//
//  SwtichViewController.swift
//  TabBarUIDemo
//
//  Created by 鐘紀偉 on 15/1/29.
//  Copyright (c) 2015年 鐘紀偉. All rights reserved.
//

import Foundation
import UIKit

class SwitchViewController : UIViewController {

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        var s = UISwitch(frame: CGRectMake(100, 100, 80, 30))
        s.on = true
        s.addTarget(self, action: "switchAction:", forControlEvents: UIControlEvents.ValueChanged)
        
        self.view.addSubview(s)
        
    }
    
    func switchAction(sender : UISwitch) {
        println(" ==  switch action == ")
    }


}



