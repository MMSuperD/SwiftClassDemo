//
//  FAN_HomeSuspensionView.swift
//  SwiftClassDemo
//
//  Created by 王丹 on 2022/8/2.
//

import UIKit
import JXSegmentedView

class FAN_HomeSuspensionView: FAN_BaseView,JXSegmentedViewDelegate {

    let segmentedView = JXSegmentedView()
    let segmentedDataSource = JXSegmentedTitleDataSource()
   
    override func addChildView() {
        
        self.addSubview(segmentedView)
        segmentedView.delegate = self
        //配置数据源相关配置属性
        segmentedDataSource.titles = ["猴sdf哥", "青蛙王sds子", "旺sdfs财"]
        segmentedDataSource.isTitleColorGradientEnabled = true
        //关联dataSource
        segmentedView.dataSource = self.segmentedDataSource
        
        segmentedView.snp.makeConstraints { make in
            make.leading.trailing.top.equalToSuperview()
            make.height.equalTo(40)
        }
        
        let indicator = JXSegmentedIndicatorLineView()
        indicator.indicatorWidth = 20
        segmentedView.indicators = [indicator]
    }

}
