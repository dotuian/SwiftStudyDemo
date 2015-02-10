//
//  LineView.swift
//  countdown
//
//  Created by 鐘紀偉 on 15/2/8.
//  Copyright (c) 2015年 鐘紀偉. All rights reserved.
//

import UIKit

class LineView: UIView {
    
    var leftImageView : UIImageView!
    var textLabel : UILabel!
    var rightImageView : UIImageView?
    
    init(frame: CGRect, leftImageName:String, text:String, rightImageName:String) {
         super.init(frame:frame)
        
        leftImageView = UIImageView(frame: CGRectMake(10, 0, 25, 25))
        leftImageView.image = UIImage(named: leftImageName)
        self.addSubview(leftImageView)
        
        textLabel = UILabel(frame: CGRectMake(50, 0, 200, 30))
        textLabel.text = text
        self.addSubview(textLabel)
        
        rightImageView = UIImageView(frame: CGRectMake(300, 0, 25, 25))
        rightImageView!.image = UIImage(named: rightImageName)
        self.addSubview(rightImageView!)
        

    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
//    override func drawRect(rect: CGRect) {
//        // Drawing code
//        
//        
//        self.addSubview(leftImageView)
//        self.addSubview(textLabel)
//        self.addSubview(rig)
//        
//    }
    
    

    
}
