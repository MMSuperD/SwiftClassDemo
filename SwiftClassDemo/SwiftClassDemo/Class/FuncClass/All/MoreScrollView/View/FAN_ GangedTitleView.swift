//
//  FAN_ GangedTitleView.swift
//  SwiftClassDemo
//
//  Created by 王丹 on 2022/8/12.
//

import UIKit
import FANBaseConfig

class FAN_StyleTitleCell: FAN_BaseCollectionViewCell {
    
    var lineView: UIView = {
        UIView()
    }()
    
    override func initData() {
        
        self.lineView.backgroundColor = UIColor.randomColor()
        self.lineView.radius_FAN = 2
        
    }
    
    
    override func addChildView() {
        super.addChildView()
        
        
        self.contentView.addSubview(self.lineView)
        self.lineView.snp.makeConstraints { make in
            make.bottom.equalTo(self.contentView)
            make.size.equalTo(CGSize(width: 20, height: 4))
            make.centerX.equalTo(self.contentView.snp.leading).offset(0)
        }
        
    }
}

class FAN_GandedScrollTitleView: FAN_BaseView {
    
    let scrollView = UIScrollView()
    let contentView = UIView()
    var titleArray: [String]? = nil
    var currentSelectIndex: Int = 0
    
    var lineView: UIView = {
        UIView()
    }()
    
    
    override func initData() {
        
    }
    
    override func addChildView() {
        
        self.addSubview(self.scrollView)
        self.scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.width.height.equalToSuperview()
        }
        
        self.scrollView.addSubview(self.contentView)
        self.contentView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.width.equalTo(1)
            make.height.equalTo(self.scrollView)
        }
        
    }
    
}

class FAN_GangedTitleView: FAN_BaseView {

    // 数据title
    var titleArray: [String]? = nil
   
    var ca_titleArray: [String]? {
        
        set{
            self.titleArray = newValue
            self.scrollTitleView.titleArray = titleArray
        }
        
        get{
            return self.titleArray
        }
    }
    
    // 容器View
    var containerView: FAN_GangedContainerView?
    let scrollTitleView = FAN_GandedScrollTitleView()
    
    override func initData() {
        
        
        
      
    }
    
    override func addChildView() {
        
        //创建组框架
        self.addSubview(self.scrollTitleView)
        self.scrollTitleView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
   
    }
}

