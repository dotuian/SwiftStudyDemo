//
//  RepeatTypeViewController.swift
//  countdown
//
//  Created by 鐘紀偉 on 15/2/10.
//  Copyright (c) 2015年 鐘紀偉. All rights reserved.
//

import Foundation
import UIKit


class SelectValueViewController : UITableViewController {
    
    var delegate : UpdateValueProtocol?
    var updateCell : UITableViewCell?
    
    var cells =  Array<Array<UITableViewCell>>()

    var data = Array<Array<String>>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for var i = 0 ; i < data.count ; i++ {
            var temp = Array<UITableViewCell>()
            
            for var j=0; j<data[i].count; j++ {
                var cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "reuseIdentifier")
                
                if updateCell!.detailTextLabel?.text == data[i][j] {
                    cell.accessoryType = UITableViewCellAccessoryType.Checkmark
                }
                
                cell.textLabel?.text = data[i][j]

                temp.append(cell)
            }
            
            cells.append(temp)
        }
        
    }
    
    // 组的个数
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return cells.count
    }
    
    // 当前组中元素的个数
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cells[section].count
    }
    
    // 当前组当前Cell中的对象
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        return cells[indexPath.section][indexPath.row] as UITableViewCell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        // 获取当前选中的UITableViewCell
        var cell = self.tableView(tableView, cellForRowAtIndexPath: indexPath)

        // 取消对TableViewCell的选择
        self.tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        // 修改重复类型的值
        var value = data[indexPath.section][indexPath.row]
        delegate!.updateCell(updateCell!, value: value)
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return " "
    }
    
    override func tableView(tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return " "
    }

}