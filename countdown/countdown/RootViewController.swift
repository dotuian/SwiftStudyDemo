//
//  RootViewController.swift
//  countdown
//
//  Created by 鐘紀偉 on 15/2/5.
//  Copyright (c) 2015年 鐘紀偉. All rights reserved.
//

import Foundation
import UIKit


class RootViewController : UIViewController, UITableViewDataSource, UITableViewDelegate {

    var dataSource = NSMutableArray()
    var currentIndexPath : NSIndexPath?
    var tableView: UITableView!
    
    
    override func viewDidLoad() {
        
        self.view.backgroundColor = UIColor.whiteColor()
        
        // 页面标题
        self.navigationItem.title = NSLocalizedString("VIEW_ROOT_TITLE", comment: "")

        // 编辑按钮
        var editItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Edit, target: self, action: "editItemClicked:")
        self.navigationItem.rightBarButtonItem = editItem
        
        // 创建按钮
        var createItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Add, target: self, action: "createItemClicked")
        // 自适应宽度ITEM
        var flexibleItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.FlexibleSpace, target: nil, action: nil)
        // 设置按钮
        var setttingItem  = UIBarButtonItem(image: UIImage(named: "settings-25.png"), style: UIBarButtonItemStyle.Plain, target: self, action: "settingItemClicked")
        // 页面底端工具条
        self.toolbarItems = [createItem, flexibleItem, setttingItem]
        self.navigationController?.toolbarHidden = false
        
        
        
        for index in 1...9 {
            let model = CountDownModel(id: index, image: "image" + String(index), name: String(index), content: String(index), days: String(index))
            dataSource.addObject(model)
        }

        // TABLEVIEW的属性设置
        var rect = self.view.bounds
        tableView = UITableView(frame: rect)
        tableView.dataSource  = self
        tableView.delegate = self
        
        // 将TABLEVIEW添加到页面
        self.view.addSubview(tableView)
    }
    
    var editMode = true
    func editItemClicked(sender : UIBarButtonItem){
        
        // 开启关闭TableView的编辑模式
        if editMode {
            tableView.setEditing(true, animated: true)
        } else {
            tableView.setEditing(false, animated: true)
        }
        
        editMode = !editMode
    }
    
    func createItemClicked(){
        let create = UINavigationController(rootViewController: CreateViewController())
        self.navigationController?.presentViewController(create, animated: true, completion: {})
    }
    
    func settingItemClicked() {
        let setting = UINavigationController(rootViewController: SettingViewController())
        self.navigationController?.presentViewController(setting, animated: true, completion: {})
    }
    
    
    
    
    // 当前组中元素的个数
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    // 加载数据
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var indexRow = "\(indexPath.section) | \(indexPath.row)"
        
        
        let reuseIdentifier = "reuseIdentifier"
        var cell = tableView.dequeueReusableCellWithIdentifier(reuseIdentifier) as? UITableViewCell
        
        if cell == nil {
            cell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: reuseIdentifier)
        }
        
        
        //cell?.imageView?.image = UIImage(named: "bullish-25.png")
        
        cell?.textLabel?.text = "Title"
        cell?.detailTextLabel?.text = "Detail Content"
        
        var view = UILabel(frame: CGRectMake(0, 0, 40, 25))
        view.text = "aa"
        
//        view.backgroundColor = UIColor.redColor()
//        cell?.accessoryView = view
        
        // 设置
//        cell?.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
//        cell?.selectionStyle = UITableViewCellSelectionStyle.Blue

        
        //let model = dataSource[indexPath.row] as? UITableViewCell
        //cell!.configueCell(model)
        
        
        self.tableView.deselectRowAtIndexPath(indexPath, animated: true)

        return cell!
        
    }

    // TableView编辑模式样式
    func tableView(tableView: UITableView, editingStyleForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCellEditingStyle {
        return UITableViewCellEditingStyle.Delete
    }
    
    // 是否可以进行行的移动操作
    func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    // 行的移动操作
    func tableView(tableView: UITableView, moveRowAtIndexPath sourceIndexPath: NSIndexPath, toIndexPath destinationIndexPath: NSIndexPath) {
        
        
    }
    
    
    func uiswitch (){
        println("==== open close ====")
    
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return " "
    }
    
//    组的个数
//    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
//        return 5
//    }
    
    // 选中一行
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let model = dataSource[indexPath.row] as CountDownModel
        
        var detailController = DetailViewController()

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
    
    
    func loadNewData(model : CountDownModel) {
        var index = 0
        for index = 0; index < dataSource.count; index++ {
            let record = dataSource[index] as CountDownModel
            if record.id == model.id {
                record.name  = model.name
                record.content = model.content
                record.days = model.days
                
                tableView.reloadRowsAtIndexPaths([currentIndexPath!], withRowAnimation: UITableViewRowAnimation.Fade)
                break
            }
        }
        
    }
    
    
    
    
    
}