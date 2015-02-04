//
//  Category.swift
//  TabBarUIDemo
//
//  Created by 鐘紀偉 on 15/1/29.
//  Copyright (c) 2015年 鐘紀偉. All rights reserved.
//

import Foundation
import CoreData


@objc(Category)
class Category: NSManagedObject {

    @NSManaged var name: String
    @NSManaged var relationship: Event

}
