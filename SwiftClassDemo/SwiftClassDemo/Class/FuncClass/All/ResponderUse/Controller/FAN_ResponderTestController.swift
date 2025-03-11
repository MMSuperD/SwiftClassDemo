//
//  FAN_ResponderTestController.swift
//  SwiftClassDemo
//
//  Created by 王丹 on 2022/11/26.
//

import UIKit

class FAN_ResponderTestController: FAN_BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        addChildView()
        // Do any additional setup after loading the view.
    }
    
    override func addChildView() {
        
        view.addSubview(aView)
        aView.snp.makeConstraints({
            $0.center.equalToSuperview()
            $0.width.height.equalTo(CGSize(width: 300, height: 400))
        })
    }
    
   

    lazy var aView:FAN_TestResponderView = {
        let view = FAN_TestResponderView()
        view.backgroundColor = .red
        return view
    }()
    
  

}


extension FAN_ResponderTestController: TS_UserInteraction_DataTransition {
    
    func ts_userInteraction(info: AnyObject) {
           //处理push/present逻辑
        print("\(info)")
       }
    
}
