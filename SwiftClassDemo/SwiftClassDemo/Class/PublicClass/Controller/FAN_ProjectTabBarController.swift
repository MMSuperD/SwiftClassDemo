//
//  FAN_ProjectTableBarController.swift
//  SwiftClassDemo
//
//  Created by 王丹 on 2022/7/26.
//

import UIKit

class FAN_ProjectTabBarController: FAN_BaseTabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tabBar.backgroundColor = UIColor.white
        
        ["Home","All","Addcart","Me"].forEach { (temp) in
            
            // 这个只是用来临时处理的
            let name = "Home";
            let str = "FAN_\(name)ViewController";
            let childVc = createChildController(title: name, imageName: "icon_tabbar_\(name.lowercased())", controllerClassName: str);
            addChild(childVc);
        };
        
    }
    
}
