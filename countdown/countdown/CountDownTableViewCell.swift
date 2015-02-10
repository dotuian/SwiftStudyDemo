//
//  CountDownTableViewCell.swift
//  countdown
//
//  Created by 鐘紀偉 on 15/2/8.
//  Copyright (c) 2015年 鐘紀偉. All rights reserved.
//

import UIKit

class CountDownTableViewCell: UITableViewCell {
    
    var img : UIImageView!
    var name : UILabel!
    var content : UILabel!
    var days : UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    
    override init(style: UITableViewCellStyle, reuseIdentifier: String!) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        
        
        let image = UIImage(named: "list-25.png")
        self.imageView?.image = image
        
        name = UILabel(frame: CGRectMake(300, 0, 100, 44))
        name.backgroundColor = UIColor.clearColor()
        name.font = UIFont.systemFontOfSize(14)
        contentView.addSubview(name)
        
        days = UILabel(frame: CGRectMake(120, 0, 200, 20))
        days.backgroundColor = UIColor.clearColor()
        days.font = UIFont.systemFontOfSize(12)
        contentView.addSubview(days)
        
        content = UILabel(frame: CGRectMake(120, 20, 200, 20))
        content.backgroundColor = UIColor.clearColor()
        content.font = UIFont.systemFontOfSize(12)
        contentView.addSubview(content)
        
//        NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: "autoupdate", userInfo: nil, repeats: true)
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configueCell(model : CountDownModel?){
        if let m = model {
            self.name.text = m.name
            self.content.text = m.content
            self.days.text = m.days

        }
    }

}
