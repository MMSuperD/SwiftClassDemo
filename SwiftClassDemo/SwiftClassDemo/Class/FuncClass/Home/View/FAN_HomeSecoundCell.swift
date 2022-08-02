//
//  FAN_HomeSecoundCell.swift
//  SwiftClassDemo
//
//  Created by 王丹 on 2022/8/1.
//

import UIKit

class FAN_HomeSecoundCell: FAN_BaseTableViewCell {

    let  titleLabel: UILabel = UILabel(frame: CGRect.zero)
    
    
    override var data: Any?{
        set{
            super.data = newValue
            
            self.titleLabel.text = newValue as? String;
            
        }
        get{
            return super.data
        }
    }
    
    override func addChildView() {
        
        self.contentView.addSubview(self.titleLabel)
        self.titleLabel.setPropary_FAN(title: "I am very well", color: "#ff0000", fontsize: 15)
        self.titleLabel.snp.makeConstraints { make in
            make.center.equalTo(self.contentView.snp.center)
        }
    }

}
