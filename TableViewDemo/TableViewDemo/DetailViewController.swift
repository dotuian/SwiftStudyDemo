//
//  DetailViewController.swift
//  TableViewDemo
//
//  Created by 鐘紀偉 on 15/2/3.
//  Copyright (c) 2015年 鐘紀偉. All rights reserved.
//

import Foundation
import UIKit


protocol SaveDataProtocol : NSObjectProtocol {
    func loadNewData(userModel : UserModel)
}


class DetailViewController : UIViewController {
    var delegate : SaveDataProtocol?
    
    var userId : Int!
    var userNameFiled : UITextField!
    var phoneFiled : UITextField!
    var emailFiled : UITextField!
    
    var userModel : UserModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userNameFiled = UITextField(frame: CGRectMake(10, 80, 300, 30))
        userNameFiled.borderStyle = UITextBorderStyle.RoundedRect
        self.view.addSubview(userNameFiled)
        
        phoneFiled = UITextField(frame: CGRectMake(10, 130, 300, 30))
        phoneFiled.borderStyle = UITextBorderStyle.RoundedRect
        self.view.addSubview(phoneFiled)
        
        emailFiled = UITextField(frame: CGRectMake(10, 180, 300, 30))
        emailFiled.borderStyle = UITextBorderStyle.RoundedRect
        self.view.addSubview(emailFiled)
        
        var saveItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Save, target: self, action: "saveData")
        self.navigationItem.rightBarButtonItem = saveItem
        
    }

    
    override func viewWillAppear(animated: Bool) {
        
        if let model = userModel {
            self.navigationItem.title = model.userName
            userId = model.userId
            userNameFiled.text = model.userName
            phoneFiled.text = model.phone
            emailFiled.text = model.email
        }
        
    }
    
    func saveData() {
        let model = UserModel(userId: userId, userName: userNameFiled.text, email: emailFiled.text, phone: phoneFiled.text)
        delegate?.loadNewData(model)
        
        self.navigationController?.popToRootViewControllerAnimated(true)
        
    }
    
}