//
//  FAN_HomeNavView.swift
//  SwiftClassDemo
//
//  Created by 王丹 on 2022/7/31.
//

import UIKit
import FANBaseConfig

class FAN_HomeSearchView: FAN_BaseControl {
    
    
    let textArray = ["apple","purple","pototo","watermanent"]
    
    var count  = 0
    
    
    override func addChildView() {
        
        // 添加一个滚动的文字
        self.addSubview(self.titleLabel)
        self.titleLabel.text = "search_text"
        
        self.titleLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        
        // 添加动画效果
        
        let timer = Timer(timeInterval: 2, repeats: true) { [self] timer in
            
            
            if self.count == 4 {
                self.count = 0
            }
            
            self.titleLabel.text = self.textArray[self.count]
            self.titleLabel.layer.add(self.createAnimation(), forKey: "transition")
            self.count = self.count + 1
            
        }
        
        RunLoop.current.add(timer, forMode: RunLoop.Mode.common)
        
    }
    
    func createAnimation() -> CATransition {
        
        if layer.animation(forKey: "transition") != nil {
            layer.removeAnimation(forKey: "transition")
        }
        
        let animation = CATransition()
        animation.duration = CFTimeInterval(0.5)
        animation.type = CATransitionType(rawValue: "push")
        animation.subtype = CATransitionSubtype(rawValue: "fromBottom")
        
        return animation
        
    }
    
    override func clickControl(control: UIControl) {
        
        // 点击了
        print("click:\(self.textArray[self.count])")
    }
    

}

class FAN_HomeNavView: FAN_BaseView {

    override func addChildView() {
        
        //第一步分 头部View 第二部分 导航View
        self.addSubview(self.titleLabel)
        self.titleLabel.text = "地理位置"
        
        self.titleLabel.snp.makeConstraints { make in
            make.leading.equalTo(self.snp.leading).offset(20)
            make.top.equalTo(self.snp.top).offset(STATUSBAR_HEIGHT_FAN + 10)
        }
        
        self.addSubview(self.defaultBtn)
        self.defaultBtn.snp.makeConstraints { make in
            make.trailing.equalTo(self.snp.trailing).offset(-20)
            make.centerY.equalTo(self.snp.centerY)
        }
        
        // 第二部分
        let searchView = FAN_HomeSearchView(frame: CGRect.zero)
        self.addSubview(searchView)
        searchView.radius_FAN = 15
        searchView.backgroundColor = UIColor.white
        
        searchView.snp.makeConstraints { make in
            make.leading.equalTo(self.snp.leading).offset(20)
            make.trailing.equalTo(self.snp.trailing).offset(-20)
            make.top.equalTo(self.titleLabel.snp.bottom).offset(15)
            make.height.equalTo(30)
        }
        
    }
}
