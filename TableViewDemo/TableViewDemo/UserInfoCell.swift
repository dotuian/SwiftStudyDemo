//
//  File.swift
//  TableViewDemo
//
//  Created by 鐘紀偉 on 15/2/3.
//  Copyright (c) 2015年 鐘紀偉. All rights reserved.
//

import Foundation
import UIKit

class UserInfoCell : UITableViewCell {

    var userNameLabel : UILabel!
    var phoneLabel : UILabel!
    var emailLabel : UILabel!
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String!) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        
        userNameLabel = UILabel(frame: CGRectMake(30, 0, 100, 44))
        userNameLabel.backgroundColor = UIColor.clearColor()
        userNameLabel.font = UIFont.systemFontOfSize(14)
        contentView.addSubview(userNameLabel)
        
        phoneLabel = UILabel(frame: CGRectMake(120, 0, 200, 20))
        phoneLabel.backgroundColor = UIColor.clearColor()
        phoneLabel.font = UIFont.systemFontOfSize(12)
        contentView.addSubview(phoneLabel)
        
        emailLabel = UILabel(frame: CGRectMake(120, 20, 200, 20))
        emailLabel.backgroundColor = UIColor.clearColor()
        emailLabel.font = UIFont.systemFontOfSize(12)
        contentView.addSubview(emailLabel)
        
        NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: "autoupdate", userInfo: nil, repeats: true)
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configueCell(userModel : UserModel?){
        if let model = userModel {
            userNameLabel.text = model.userName
            phoneLabel.text = model.phone
            emailLabel.text=model.email
        }
    }
    
    
    func autoupdate(){
        println(" autoupdate ")
        var format = NSDateFormatter()
        format.dateFormat = "yyyy-MM-dd hh:mm:ss"
        phoneLabel.text = format.stringFromDate(NSDate())
    
    }
    

}
