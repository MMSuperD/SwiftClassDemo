//
//  FAN_MoreNaView.swift
//  SwiftClassDemo
//
//  Created by 王丹 on 2022/8/12.
//

import UIKit
import FANBaseConfig

class FAN_MoreNaView: FAN_BaseView {
    
    enum FAN_MoreNavViewType {
        case normal
        case scrolling
        case suspend
    }
    
    var type:FAN_MoreNavViewType = .normal
    
    let searchLabel: UILabel = {
        return UILabel(frame: .zero)
    }()
    
    let addressLabel: UILabel = {
        return UILabel(frame: .zero)
    }()
    

    
    override func initData() {
        
        self.searchLabel.setPropary_FAN(title: "search", color: "#000000", fontsize: 15)
        self.searchLabel.textAlignment = .center
        self.searchLabel.radius_FAN = 15
        self.searchLabel.backgroundColor = .randomColor()
        
        self.addressLabel.setPropary_FAN(title: "江川北二村", color: "#ff0000", fontsize: 18)
        self.addressLabel.textAlignment = .left
        
    }
    
    
    override func addChildView() {
        
        addSubview(self.addressLabel)
        self.addressLabel.snp.makeConstraints { make in
            make.leading.equalTo(self.snp.leading).offset(20)
            make.top.equalTo(self.snp.top).offset(STATUSBAR_HEIGHT_FAN)
            make.height.equalTo(30)
        }
        
        addSubview(self.searchLabel)
        self.searchLabel.snp.makeConstraints { make in
            make.leading.equalTo(self.snp.leading).offset(20)
            make.top.equalTo(self.addressLabel.snp.bottom).offset(10)
            make.trailing.equalTo(self.snp.trailing).offset(-20)
            make.height.equalTo(30)
            make.bottom.equalTo(self.snp.bottom).offset(-10)
        }
        
    }
}
