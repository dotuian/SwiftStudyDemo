//
//  CustomTableViewController.swift
//  countdown
//
//  Created by 鐘紀偉 on 15/2/10.
//  Copyright (c) 2015年 鐘紀偉. All rights reserved.
//

import UIKit

protocol UpdateValueProtocol : NSObjectProtocol {

    func updateCell(cell:UITableViewCell, value: String)
}


class CreateViewController: UITableViewController, UpdateValueProtocol {
    var cells:NSArray = []
    
    var paddingView = UIView(frame: CGRectMake(0, 0, 15, 20))
    
    var _titleTextField: UITextField!
    
    var _calendarTypeSwitch : UISwitch!
    var _calendarTypeCell: UITableViewCell!
    
    
    var _repeatTypeCell: UITableViewCell!
    
    var _eventTypeCell: UITableViewCell!
    
    override func viewDidLoad() {
        
        self.navigationItem.title = NSLocalizedString("VIEW_ROOT_TITLE", comment: "")
        
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.estimatedRowHeight = 44
        
        
        // 导航栏按钮
        var createButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Save, target: self, action: "create:")
        var cancelButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Cancel, target: self, action: "cancel:")
        self.navigationItem.rightBarButtonItem = createButton
        self.navigationItem.leftBarButtonItem = cancelButton
        
        
        
        
        // 标题
        _titleTextField = UITextField(frame: CGRectMake(0, 0, self.view.bounds.width, 45))
        _titleTextField.placeholder = "标题"
        _titleTextField.contentVerticalAlignment = UIControlContentVerticalAlignment.Center
        _titleTextField.contentHorizontalAlignment = UIControlContentHorizontalAlignment.Left
        _titleTextField.leftView = paddingView
        _titleTextField.leftViewMode = UITextFieldViewMode.Always
        
        var titleCell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: nil)
        titleCell.contentView.addSubview(_titleTextField)

        // 开始日期
        var startDateCell = DVDatePickerTableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: nil)
        startDateCell.leftLabel.text = "开始日期"
        
        // 日历种类
        _calendarTypeSwitch = UISwitch()
        _calendarTypeSwitch.addTarget(self, action: "calendarTypeSwitch", forControlEvents: UIControlEvents.ValueChanged)
        _calendarTypeSwitch.setOn(true, animated: false)
        
        _calendarTypeCell = UITableViewCell(style: UITableViewCellStyle.Value1, reuseIdentifier: nil)
        _calendarTypeCell.textLabel?.text = "日历种类"
        _calendarTypeCell.detailTextLabel?.text = "公历"
        _calendarTypeCell.accessoryView = _calendarTypeSwitch
        
        // 重复
        _repeatTypeCell = UITableViewCell(style: UITableViewCellStyle.Value1, reuseIdentifier: nil)
        _repeatTypeCell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        _repeatTypeCell.textLabel?.text = "重复"
        _repeatTypeCell.detailTextLabel?.text = "永不"
        var repeatTypeControl = UIControl(frame: CGRectMake(0, 0, self.view.bounds.width, 40))
        _repeatTypeCell.contentView.addSubview(repeatTypeControl)
        repeatTypeControl.addTarget(self, action: "repeatTypeClicked", forControlEvents: UIControlEvents.TouchUpInside)
        
        // 事件类型
        _eventTypeCell = UITableViewCell(style: UITableViewCellStyle.Value1, reuseIdentifier: nil)
        _eventTypeCell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        _eventTypeCell.textLabel?.text = "事件类型"
        _eventTypeCell.detailTextLabel?.text = "生日"
        var eventTypeControl = UIControl(frame: CGRectMake(0, 0, self.view.bounds.width, 40))
        _eventTypeCell.contentView.addSubview(eventTypeControl)
        eventTypeControl.addTarget(self, action: "eventTypeClicked", forControlEvents: UIControlEvents.TouchUpInside)

        // Cells is a 2D array containing sections and rows.
        cells = [
            [titleCell],
            [startDateCell, _calendarTypeCell, _repeatTypeCell, _eventTypeCell]
        ]
    }
    
    // 协议方法，实现当前页面值的更新
    func updateCell(cell:UITableViewCell, value: String) {
        cell.detailTextLabel?.text = value
    }
    
    func create(sender : AnyObject){
        println("=== create ===")
        self.navigationController?.dismissViewControllerAnimated(true, completion: {})
    }
    
    func cancel(sender : AnyObject){
        println("=== cancel ===")
        self.navigationController?.dismissViewControllerAnimated(true, completion: {})
    }
    
    func eventTypeClicked(){
        println(" repeatTypeClicked ")
        var vc = SelectValueViewController()
        vc.data = [["生日", "工作", "纪念日", "倒计时"]]
        vc.delegate = self
        vc.updateCell = _eventTypeCell
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func repeatTypeClicked(){
        var vc = SelectValueViewController()
        vc.data = [["永不", "每天", "每周", "每两周", "每月", "每年"]]
        vc.delegate = self
        vc.updateCell = _repeatTypeCell
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    func calendarTypeSwitch(){
        if _calendarTypeSwitch.on {
            _calendarTypeCell.detailTextLabel?.text = "公历"
        } else {
            _calendarTypeCell.detailTextLabel?.text = "农历"
        }
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        var cell = self.tableView(tableView, cellForRowAtIndexPath: indexPath)
        if (cell.isKindOfClass(DVDatePickerTableViewCell)) {
            return (cell as DVDatePickerTableViewCell).datePickerHeight()
        }
        
        return super.tableView(tableView, heightForRowAtIndexPath: indexPath)
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
        println("clicked cell ")
        var cell = self.tableView(tableView, cellForRowAtIndexPath: indexPath)
        if (cell.isKindOfClass(DVDatePickerTableViewCell)) {
            var datePickerTableViewCell = cell as DVDatePickerTableViewCell
            datePickerTableViewCell.selectedInTableView(tableView)
        }
        // 取消对TableViewCell的选择
        self.tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        
        
        
    }
    

    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return " "
    }
    
}
