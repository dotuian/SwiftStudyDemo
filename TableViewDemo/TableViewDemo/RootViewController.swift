//
//  RootViewController.swift
//  TableViewDemo
//
//  Created by 鐘紀偉 on 15/2/3.
//  Copyright (c) 2015年 鐘紀偉. All rights reserved.
//

import Foundation
import UIKit


class RootViewController : UIViewController, UITableViewDataSource, UITableViewDelegate ,SaveDataProtocol{

    var dataSource = NSMutableArray()
    var currentIndexPath : NSIndexPath?
    
    var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.whiteColor()
        
        for index in 1...100 {
            let model = UserModel(userId: index, userName: "name " + String(index), email: "dotuian" + String(index) + "@outlook.com", phone: String(index))
            dataSource.addObject(model)
        }

        var rect = self.view.bounds
        tableView = UITableView(frame: rect)
        tableView.dataSource  = self
        tableView.delegate = self
        
        
        self.view.addSubview(tableView)
    }
    
    
    // 总行数
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    // 加载数据
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cellId = "cell id"
        var cell = tableView.dequeueReusableCellWithIdentifier(cellId) as? UserInfoCell
        
        if cell == nil {
            //cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: cellId)
            cell = UserInfoCell(style: UITableViewCellStyle.Default, reuseIdentifier: cellId)
        }
        
        let model = dataSource[indexPath.row] as? UserModel
        cell!.configueCell(model)
        
        return cell!
        
    }
    
    // 选中一行
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let model = dataSource[indexPath.row] as UserModel

        var detailController = DetailViewController()
        detailController.userModel = model
        detailController.delegate = self
        self.currentIndexPath = indexPath
        
        self.navigationController?.pushViewController(detailController, animated: true)
    }
    
    // 删除一行
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        var index = indexPath.row as Int
        self.dataSource.removeObjectAtIndex(index)
        self.tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Top)
        
        println("删除了一行数据")
    }
    
    
    func loadNewData(userModel : UserModel) {
        var index = 0
        for index = 0; index < dataSource.count; index++ {
            let model = dataSource[index] as UserModel
            if model.userId == userModel.userId {
                model.userName = userModel.userName
                model.phone = userModel.phone
                model.email = userModel.email
                tableView.reloadRowsAtIndexPaths([currentIndexPath!], withRowAnimation: UITableViewRowAnimation.Fade)
                break
            }
        }
        
    }
    
    
    
    
    
    
    
    
    


}