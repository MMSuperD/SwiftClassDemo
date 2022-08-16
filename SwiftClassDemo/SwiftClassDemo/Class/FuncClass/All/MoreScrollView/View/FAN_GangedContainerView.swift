//
//  FAN_GangedContainerView.swift
//  SwiftClassDemo
//
//  Created by 王丹 on 2022/8/12.
//

import UIKit

class FAN_GangedContainerView: FAN_BaseView {

    
    let scrollView = UIScrollView()
    let contentView = UIView()
    
    
    
    override func initData() {
        
   
        
    }
    
    

    override func addChildView() {
    
        self.addSubview(self.scrollView)
        self.scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        
        self.scrollView.addSubview(self.contentView)
        self.contentView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.width.equalTo(self.frame.size.width + 1)
            make.height.equalToSuperview()
        }
        
    }
    
}
