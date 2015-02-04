//
//  LabelViewController.swift
//  TabBarUIDemo
//
//  Created by 鐘紀偉 on 15/1/29.
//  Copyright (c) 2015年 鐘紀偉. All rights reserved.
//

import Foundation
import UIKit

class LabelViewController : UIViewController {
    override func loadView() {
        super.loadView()
        
        
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var label = UILabel(frame: CGRectMake(0, 100, self.view.bounds.size.width, 200))
        label.backgroundColor = UIColor.blackColor()
        label.textColor = UIColor.whiteColor()
        
        label.numberOfLines = 0
        label.lineBreakMode = NSLineBreakMode.ByWordWrapping
        label.text = "aasaaaaabbbbbxcasdfasdfasdjfalsdfasdlkjfalsdkfalsdfnalsdkjfalsdfjalsdasdflaksjdflajsdlfajsldfjasldfjalsdkjflaksdflaksdflasjdfoiaerjgoareijgalsdkfnlasdjfaksdjflasdfhoasdfhjlaksdhflasdhflakjsdflkajfoiewjfaksdhflashdflaksjdflaksdhflakhfgalsdkfjasldfjaldsfkadf"
        label.font = UIFont.italicSystemFontOfSize(20)
        
        self.view.addSubview(label)
        
        
    }

}