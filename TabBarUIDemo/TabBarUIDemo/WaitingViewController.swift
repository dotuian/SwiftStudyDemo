//
//  WaitingViewController.swift
//  TabBarUIDemo
//
//  Created by 鐘紀偉 on 15/1/30.
//  Copyright (c) 2015年 鐘紀偉. All rights reserved.
//

import Foundation
import UIKit

class WaitingVeiwController : UIViewController{
    
    
    override func viewDidLoad() {
        
        var activity = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.Gray)
        activity.frame = CGRectMake(50, 50, 100, 100)
        activity.startAnimating()
        activity.hidesWhenStopped = true
        
        self.view.addSubview(activity)

        
        
        var slider = UISlider(frame: CGRectMake(50, 100, 300, 30))
        slider.addTarget(self, action: "slider:", forControlEvents: UIControlEvents.ValueChanged)
        self.view.addSubview(slider)
        
        
        var progress = UIProgressView(progressViewStyle: UIProgressViewStyle.Default)
        progress.progressTintColor = UIColor.blackColor()
        progress.trackTintColor = UIColor.redColor()
        progress.frame = CGRectMake(50, 200, 300, 30)
        progress.setProgress(0.9, animated: true)
       
        self.view.addSubview(progress)
        
        
        var datepicker = UIDatePicker(frame: CGRectMake(0, 300, 400, 50))
        datepicker.datePickerMode = UIDatePickerMode.DateAndTime
        //datepicker.minimumDate =
        datepicker.minuteInterval = 1
        datepicker.addTarget(self, action: "datepicker:", forControlEvents: UIControlEvents.ValueChanged)
        self.view.addSubview(datepicker)
        
        
        
        
        
        
        
        
        
    }
    
    func datepicker(sender: UIDatePicker){
        println(sender.date)
    }
    
    func slider(sender: UISlider) {
    
        println(sender.value)
    }
    
    

}