//
//  FAN_SudokuView.swift
//  SwiftClassDemo
//
//  Created by 王丹 on 2022/7/28.
//

import UIKit
import FANBaseConfig

class FAN_SudokuView: FAN_BaseView {
    
    var totalNum: NSInteger = 4
    var btnArray: [UIButton] = [];
    var currentSelectIndex = 10000
    
    
    override func addChildView() {
        
        //循环创建btn
        for i in 0..<titleArray.count {
            
            let btn = createBtn(title: titleArray[i], tagNum: i + 1)
            btn.tag = i + 100
            btnArray.append(btn)
            addSubview(btn)
            btn.addTarget(self, action: #selector(actionBtn(sender:)), for: UIControl.Event.touchUpInside)
        }
        
//        //初始化btn 样式
//        if self.btnArray.count > 0 {
//            self.btnArray[0].setTitleColor(UIColor.purple, for: UIControl.State.normal)
//            self.btnArray[0].backgroundColor = UIColor.green
//        }
      
        
        
        // 设置约束
        let itemWidth = (SCREEN_WIDTH_FAN - 40)/2.0
        let itemHeight = 50.0
        
        // 表示第几行
        var row = 0
        
        var column = 0
        
        let num = 2
        
        for i in 0..<btnArray.count {
            
            row = i / num
            column = i %  num
            
            btnArray[i].snp.makeConstraints { make in
                
                if row == 0 {
                    
                    make.top.equalTo(self)
                } else {
                    
                    make.top.equalTo(self.btnArray[row - 1].snp.bottom)
                }
                
                if column == 0 {
                    make.leading.equalTo(self)
                } else {
                    make.leading.equalTo(self.btnArray[i - 1].snp.trailing)
                }
                
                if row == 0 && i == num - 1 {
                    
                    make.trailing.equalTo(self.snp.trailing)
                }
                
             
                if i == btnArray.count - 1 {
                    
                    make.bottom.equalTo(self.snp.bottom)
                }
                make.size.equalTo(CGSize(width: itemWidth, height: itemHeight))
            }
        }
        
        
    }
    
   @objc func actionBtn(sender: UIButton) -> Void {
        
       
       // 选中的边颜色
       
       if self.currentSelectIndex < self.btnArray.count {
           if sender.tag == self.btnArray[self.currentSelectIndex].tag {
               return
           }
       }
       
       
       sender.setTitleColor(UIColor.purple, for: UIControl.State.normal)
       sender.backgroundColor = UIColor.green

       
       if self.currentSelectIndex < self.btnArray.count {
           
           self.btnArray[self.currentSelectIndex].setTitleColor(UIColor.white, for: UIControl.State.normal)
           self.btnArray[self.currentSelectIndex].backgroundColor = UIColor.gray
       }
 
       
       self.currentSelectIndex = sender.tag - 100;
    }
    
    
    
    func createBtn(title:String, tagNum:Int) -> UIButton {
        UIButton(title, UIColor.gray, CGFloat(15))
    }
    
    
    lazy var titleArray: [String] = {
        ["apple","popato","tangerine","watermelon"]
    }()
    
}
