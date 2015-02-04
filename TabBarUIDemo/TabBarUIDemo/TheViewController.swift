//
//  TheViewController.swift
//  TabBarUIDemo
//
//  Created by 鐘紀偉 on 15/1/29.
//  Copyright (c) 2015年 鐘紀偉. All rights reserved.
//

import Foundation
import UIKit

class TheView : UIView {
    override func drawRect(rect: CGRect) {
        UIColor.redColor().setFill()
        UIRectFill(CGRectMake(0, 100, 100, 100))

    }

}


class TheViewController : UIViewController {

    override func loadView() {
        let theView = TheView()
        theView.backgroundColor = UIColor.brownColor()
        theView.layer.cornerRadius = 3
        theView.layer.borderWidth = 5
        theView.layer.borderColor = UIColor.darkGrayColor().CGColor
        
        self.view = theView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        let rec = UITapGestureRecognizer(target: self, action: "tapAction")
        rec.numberOfTapsRequired = 2
        rec.numberOfTouchesRequired = 1
        self.view.addGestureRecognizer(rec)
        
    
    }
    
    func tapAction(){
        println("=== tapAction ===");
    
    }
    
    
    

}