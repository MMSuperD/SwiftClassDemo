//
//  FAN_LocalizableTestViewController.swift
//  SwiftClassDemo
//
//  Created by 王丹 on 2022/8/7.
//

import UIKit

class FAN_LocalizableTestViewController: FAN_BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        addChildView()
    }
    

    override func addChildView() {
        
        let button = UIButton("defaultButtonTitle".localizedString_FAN(), UIColor.red, 12)
        
        self.view.addSubview(button)
        
        
        button.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.size.equalTo(CGSize(width: 100, height: 100))
        }
        
        
    }

}
