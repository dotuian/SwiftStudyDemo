//
//  AlertViewController.swift
//  TabBarUIDemo
//
//  Created by 鐘紀偉 on 15/1/30.
//  Copyright (c) 2015年 鐘紀偉. All rights reserved.
//

import Foundation
import UIKit

class AlertViewController : UIViewController, UIAlertViewDelegate {
    
    var loading : UIActivityIndicatorView!

    override func viewDidLoad() {
        
        loading = UIActivityIndicatorView(frame: CGRectMake(150, 200, 50, 50))
        loading.color = UIColor.redColor()
        loading.hidesWhenStopped = true
        self.view.addSubview(loading)
        
        var startButton = UIButton.buttonWithType(UIButtonType.System) as UIButton
        startButton.setTitle("start", forState: UIControlState.Normal)
        startButton.addTarget(self, action: "start:", forControlEvents: UIControlEvents.TouchUpInside)
        startButton.frame = CGRectMake(100, 300, 50, 30)
        
        var stopButton = UIButton.buttonWithType(UIButtonType.System) as UIButton
        stopButton.setTitle("stop", forState: UIControlState.Normal)
        stopButton.addTarget(self, action: "stop:", forControlEvents: UIControlEvents.TouchUpInside)
        stopButton.frame = CGRectMake(200, 300, 50, 30)
        
        self.view.addSubview(startButton)
        self.view.addSubview(stopButton)
        
    }
    
    
    func start(sender : UIButton){
        loading.startAnimating()
    }
    
    func stop(sender : UIButton) {
        

        var alert = UIAlertView(title: "确认", message: "确定要停止么？", delegate: self, cancelButtonTitle: "否",
            otherButtonTitles: "停止"
        )
        alert.show()
        
        //loading.stopAnimating()
    }
    
    
    func alertView(alertView: UIAlertView, clickedButtonAtIndex buttonIndex: Int) {
        
        if buttonIndex == 1 {
            loading.stopAnimating()
        }
    
    }

    
    
    
    
    
    


}