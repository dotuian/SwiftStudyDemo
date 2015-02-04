//
//  TwoViewController.swift
//  TabBarUIDemo
//
//  Created by 鐘紀偉 on 15/1/28.
//  Copyright (c) 2015年 鐘紀偉. All rights reserved.
//

import Foundation
import UIKit

class TwoViewController : UIViewController, UITableViewDelegate, UITableViewDataSource {

    var list: NSArray!
    var tableView: UITableView!
    
    override func loadView() {
        super.loadView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //self.title = "UI Demo"
        
        self.list = NSArray(contentsOfFile: NSBundle.mainBundle().pathForResource("List", ofType:"plist")!)
        println(self.list)
        
        self.tableView = UITableView(frame: self.view.frame, style:UITableViewStyle.Plain)
        self.tableView!.delegate = self
        self.tableView!.dataSource = self
        self.tableView!.registerClass(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        self.view?.addSubview(self.tableView)
        
    }
    
    

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.list.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as UITableViewCell
        cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        cell.textLabel?.text = self.list?.objectAtIndex(indexPath.row) as String?
        
        return cell
    }
    
    // UITableViewDelegate Methods
    //
    func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!)
    {
        self.tableView!.deselectRowAtIndexPath(indexPath, animated: true)
        
        var itemString = self.list?.objectAtIndex(indexPath.row) as String
        
        var view : UIViewController = WaitingVeiwController()
        
        switch itemString {
            case "XIB" :
                view = XibViewController()
            
            
            case "UIView":
                println("UIView")
                view = LabelViewController()
            
            case "UIButton":
                println("UIButton")
                view = ButtonViewController()
            
            case "UITextField" :
                view = TextFieldViewController()
            
            case "UISwitch" :
                view = SwitchViewController()
            
            case "UIActionSheet":
                view = ActionSheetViewController()
            
            case "UIAlertView" : 
                view = AlertViewController()
            
            
            default:
                println(" not found !");
        
        }

        
        self.navigationController?.pushViewController(view, animated: true)

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
}