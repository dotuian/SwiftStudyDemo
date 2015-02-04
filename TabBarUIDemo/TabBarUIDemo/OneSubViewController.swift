//
//  OneSubViewController.swift
//  TabBarUIDemo
//
//  Created by 鐘紀偉 on 15/1/28.
//  Copyright (c) 2015年 鐘紀偉. All rights reserved.
//

import Foundation
import UIKit
import CoreData



class OneSubViewController : UIViewController {

    var memoFiled : UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.whiteColor()
        
        self.title = "Edit"
        
        let rect = CGRect(x: 100, y: 100, width: 200, height: 30)
        memoFiled = UITextField(frame: rect)
        memoFiled.borderStyle = UITextBorderStyle.RoundedRect
        self.view.addSubview(memoFiled)
        
        let writeBtn = UIButton(frame: CGRectMake(100, 150, 200, 30))
        writeBtn.backgroundColor = UIColor.magentaColor()
        writeBtn.setTitle("保存", forState: UIControlState.Normal)
        writeBtn.addTarget(self, action: "onClick:", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(writeBtn)
        
        
        
    }
    
    func onClick(sender : UIButton) {
        let appDelegate : AppDelegate = UIApplication.sharedApplication().delegate as AppDelegate
        let managedContext = appDelegate.managedObjectContext!
        
        let entity : NSEntityDescription! = NSEntityDescription.entityForName("ToDoStore", inManagedObjectContext: managedContext)
        
        var data = ToDoStore(entity: entity, insertIntoManagedObjectContext: managedContext)
        data.memo = memoFiled.text
        data.date = NSDate()
        
        memoFiled.text = nil
    
        managedContext.save(nil)
        
    }
    
    

}









