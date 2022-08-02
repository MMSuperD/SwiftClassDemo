//
//  FAN_HomeBackColorView.swift
//  SwiftClassDemo
//
//  Created by 王丹 on 2022/7/31.
//

import UIKit

class FAN_HomeBackColorView: FAN_BaseView {

//    let colorLayer = CAGradientLayer()
    
    
    override func addChildView() {
        
        self.backgroundColor = UIColor.randomColor()
       
    }
    
    
    override func layoutSublayers(of layer: CALayer) {
        super.layoutSublayers(of: layer)
        
        
    }

}
