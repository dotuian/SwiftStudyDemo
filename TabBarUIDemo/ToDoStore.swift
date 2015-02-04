//
//  Entity.swift
//  TabBarUIDemo
//
//  Created by 鐘紀偉 on 15/1/28.
//  Copyright (c) 2015年 鐘紀偉. All rights reserved.
//

import Foundation
import CoreData

class ToDoStore: NSManagedObject {

    @NSManaged var memo: String
    @NSManaged var date: NSDate

}
