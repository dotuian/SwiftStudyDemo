//
//  CountDownModel.swift
//  countdown
//
//  Created by 鐘紀偉 on 15/2/8.
//  Copyright (c) 2015年 鐘紀偉. All rights reserved.
//

import UIKit

class CountDownModel: NSObject {
   
    var id : Int
    var image : String?
    var name : String
    var content : String
    var days: String
    
    
    init(id: Int, image:String?, name:String? , content: String, days:String) {

        self.id = id
        self.image = image
        self.name = name!
        self.content = content
        self.days = days
        
        super.init()
        
    }
}
