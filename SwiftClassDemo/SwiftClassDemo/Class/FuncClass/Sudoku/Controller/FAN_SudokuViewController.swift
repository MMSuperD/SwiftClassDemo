//
//  FAN_SudokuViewController.swift
//  SwiftClassDemo
//
//  Created by 王丹 on 2022/7/28.
//

import UIKit

class FAN_SudokuViewController: FAN_BaseViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()

        initData()
        addChildView()
        
        
    }
    
    override func initData() {
        self.title = "九宫格"
    }
    
    override func addChildView() {
        
        let hh = FAN_SudokuView(frame: CGRect.zero)
        view.addSubview(hh)
        
        hh.snp.makeConstraints { make in
            make.leading.equalTo(view.snp.leading).offset(20)
            make.trailing.equalTo(view.snp.trailing).offset(-20)
            make.top.equalTo(self.nvView.snp.bottom).offset(20)

        }

    }

}
