//
//  FAN_HomeFirstCell.swift
//  SwiftClassDemo
//
//  Created by 王丹 on 2022/7/29.
//

import UIKit

class FAN_HomeFirstCell: FAN_BaseTableViewCell {
    
    let  titleLabel: UILabel = UILabel(frame: CGRect.zero)
    
    
    override func addChildView() {
        
        self.contentView.addSubview(self.titleLabel)
        self.titleLabel.setPropary_FAN(title: "I am very well", color: "#ff0000", fontsize: 15)
        
        self.titleLabel.snp.makeConstraints { make in
            make.center.equalTo(self.contentView.snp.center)
        }
    }
    

}
