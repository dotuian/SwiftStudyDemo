//
//  UserModel.swift
//  TableViewDemo
//
//  Created by 鐘紀偉 on 15/2/3.
//  Copyright (c) 2015年 鐘紀偉. All rights reserved.
//

import Foundation


class UserModel : NSObject{

    var userId : Int
    var userName : String
    var email : String?
    var phone : String?
    
    init(userId: Int, userName:String, email:String?, phone:String?) {
        self.userId = userId
        self.userName = userName
        self.email = email
        self.phone  = phone
        
        super.init()
        
    }
    
    
}