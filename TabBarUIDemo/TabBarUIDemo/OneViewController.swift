//
//  OneViewController.swift
//  TabBarUIDemo
//
//  Created by 鐘紀偉 on 15/1/28.
//  Copyright (c) 2015年 鐘紀偉. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class OneViewController : UIViewController , UITableViewDelegate, UITableViewDataSource {
    
    var addBtn: UIBarButtonItem!
    
    var table : UITableView!
    
    var memos : [String] = []
    
    
    override func viewDidLoad(){
        super.viewDidLoad()
        //self.title = "One"
        
        self.view.backgroundColor = UIColor.whiteColor()
        
        
        addBtn = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: "onClick")
        self.navigationItem.rightBarButtonItem = addBtn
        
        table = UITableView(frame: self.view.bounds)
        table.registerClass(UITableViewCell.self, forCellReuseIdentifier: "data")
        table.dataSource = self
        table.delegate = self
        
        self.view.addSubview(table)
    }
    
    
    // viewDidLoadは最初の一回しか呼ばれないので、viewWillAppearを使うよ
    override func viewWillAppear(animated: Bool) {
        
        // CoreDataからデータを読み込んで配列memosに格納する
        let appDel: AppDelegate = UIApplication.sharedApplication().delegate as AppDelegate
        let toDoContext: NSManagedObjectContext = appDel.managedObjectContext!
        
        let toDoRequest: NSFetchRequest = NSFetchRequest(entityName: "ToDoStore")
        
        // 並び順をdateの、昇順としてみる
        toDoRequest.sortDescriptors = [NSSortDescriptor(key: "date", ascending: true)]
        toDoRequest.returnsObjectsAsFaults = false
        var results = toDoContext.executeFetchRequest(toDoRequest, error: nil) as [ToDoStore]!
        memos = []
        for data in results {
            memos.append(data.memo)
        }
        
        // テーブル情報を更新する
        self.table.reloadData()
        
    }

    
    func onClick(){
        let view = OneSubViewController()
        self.navigationController?.pushViewController(view, animated: true)
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return memos.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("data", forIndexPath: indexPath) as UITableViewCell
        cell.textLabel?.text = memos[indexPath.row]
        
        return cell
    }

    
    // 点击TableView时，触发的事件
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        println(indexPath.row);
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        NSLog("delete")
        var index = indexPath.row as Int
        self.memos.removeAtIndex(index)
        self.table.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Top)    }
    


}













