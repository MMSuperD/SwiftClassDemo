//
//  FAN_TestResponderView.swift
//  SwiftClassDemo
//
//  Created by 王丹 on 2022/11/26.
//

import UIKit

class FAN_TestResponderView: FAN_BaseView {

    
    override func addChildView() {
        self.addSubview(bButton)
        bButton.snp.makeConstraints({
            $0.leading.top.equalToSuperview()
            $0.size.equalTo(CGSize(width: 100, height: 40))
        })
        
        self.addSubview(cButton)
        cButton.snp.makeConstraints({
            $0.leading.top.equalToSuperview().inset(100)
            $0.size.equalTo(CGSize(width: 100, height: 40))
        })
    }
    
    @objc func actionButton(sender: UIButton) {
        self.next?.ts_transitionInfo(info:sender.tag as AnyObject )
    }

   
    lazy var bButton:UIButton = {
        let view = UIButton()
        view.backgroundColor = .green
        view.setTitle("bButton", for: .normal)
        view.addTarget(self, action: #selector(actionButton(sender:)), for: .touchUpInside)
        view.tag = 101
        return view
    }()
    
    lazy var cButton:UIButton = {
        let view = UIButton()
        view.backgroundColor = .green
        view.setTitle("cButton", for: .normal)
        view.addTarget(self, action: #selector(actionButton(sender:)), for: .touchUpInside)
        view.tag = 100
        return view
    }()

}
