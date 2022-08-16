//
//  FAN_MoreScrollviewCell.swift
//  SwiftClassDemo
//
//  Created by 王丹 on 2022/8/14.
//

import UIKit

class FAN_MoreScrollviewCell: FAN_BaseTableViewCell {

   lazy var titleView:FAN_GangedTitleView = {
        
        let titleView = FAN_GangedTitleView()
        return titleView
    }()
    
    lazy var containerView:FAN_GangedContainerView = {
         
         let containerView = FAN_GangedContainerView()
         return containerView
     }()
    
  
    override func initData() {
        
        // 这句话是绑定 titleView  和 containerView
        self.titleView.containerView = self.containerView;
        
    }
    
    override func addChildView() {
        
        self.contentView.addSubview(self.titleView)
        self.titleView.snp.makeConstraints { make in
            make.leading.trailing.top.equalToSuperview()
            make.height.equalTo(40)
        }
        
        self.contentView.addSubview(self.containerView)
        self.containerView.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview()
            make.top.equalTo(self.titleView.snp.bottom)
        }
        
    }
}
