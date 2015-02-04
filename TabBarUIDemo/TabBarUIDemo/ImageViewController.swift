//
//  ImageViewController.swift
//  TabBarUIDemo
//
//  Created by 鐘紀偉 on 15/1/29.
//  Copyright (c) 2015年 鐘紀偉. All rights reserved.
//

import Foundation
import UIKit

class ImageViewController : UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var imageView = UIImageView(frame:CGRectMake(100, 100, 50, 50))
        imageView.backgroundColor = UIColor.whiteColor()
            
        //var images:[UIImage] = [
        //    UIImage(named: "001.png"),
        //    UIImage(contentsOfFile: NSBundle.mainBundle().pathForResource("002", ofType: "png")!),
        //    UIImage(contentsOfFile: NSBundle.mainBundle().pathForResource("003", ofType: "png")!)
        //]
        //imageView.animationImages = images
        imageView.contentMode = UIViewContentMode.ScaleAspectFill
        imageView.animationDuration = 1
        imageView.startAnimating()
        

        
        
    }


}