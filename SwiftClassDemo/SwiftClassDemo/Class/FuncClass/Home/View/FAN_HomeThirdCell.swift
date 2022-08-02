//
//  FAN_HomeThirdCell.swift
//  SwiftClassDemo
//
//  Created by 王丹 on 2022/8/1.
//

import UIKit
import JXSegmentedView
class FAN_HomeThirdCell: FAN_BaseTableViewCell, JXSegmentedViewDelegate, JXSegmentedListContainerViewDataSource {

    
    let segmentedView = JXSegmentedView()
    let segmentedDataSource = JXSegmentedTitleDataSource()
    var listContainerView: JXSegmentedListContainerView?
    var currentChildVc: FAN_HomeListViewController?
    
    var vcArray:[FAN_HomeListViewController] = Array()
    

    override var currentVc: UIViewController?{
        set{
            
            super.currentVc = newValue;
            
            self.segmentedView.reloadData()
        }
        get{
            return super.currentVc
        }
    }
    
    override func addChildView() {
        
        self.backgroundColor = UIColor.randomColor();
                
        self.contentView.addSubview(segmentedView)
        segmentedView.delegate = self
        //配置数据源相关配置属性
        segmentedDataSource.titles = ["猴哥", "青蛙王子", "旺财"]
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
        
        self.listContainerView = JXSegmentedListContainerView(dataSource: self)
        self.contentView.addSubview(self.listContainerView!)
        //关联listContainer
        segmentedView.listContainer = listContainerView
        listContainerView?.scrollView.bounces = false

        
        self.listContainerView?.snp.makeConstraints({ make in
            make.leading.trailing.bottom.equalToSuperview()
            make.top.equalTo(segmentedView.snp.bottom)
        })

    }
    
    //MARK:JXSegmentedViewDelegate
    func segmentedView(_ segmentedView: JXSegmentedView, didSelectedItemAt index: Int) {
        
        
    }
    
    func segmentedView(_ segmentedView: JXSegmentedView, didClickSelectedItemAt index: Int) {
        
        
    }
    
    func segmentedView(_ segmentedView: JXSegmentedView, didScrollSelectedItemAt index: Int) {
        
        // 这里我们就需要回调了
        self.currentChildVc = self.vcArray[index];
        if let backBlock = self.backBlock {
            backBlock(self.currentChildVc!);
        }
    }
    
    func segmentedView(_ segmentedView: JXSegmentedView, scrollingFrom leftIndex: Int, to rightIndex: Int, percent: CGFloat) {
        
        
        
    }
    
    func segmentedView(_ segmentedView: JXSegmentedView, canClickItemAt index: Int) -> Bool {
        
        return true
        
    }
    
    //MARK:JXSegmentedListContainerViewDataSource
    func numberOfLists(in listContainerView: JXSegmentedListContainerView) -> Int {
        return self.segmentedDataSource.titles.count
    }
    
    func listContainerView(_ listContainerView: JXSegmentedListContainerView, initListAt index: Int) -> JXSegmentedListContainerViewListDelegate {
        
        var listVc: FAN_HomeListViewController? = nil;
        if index >= self.vcArray.count {
            listVc = FAN_HomeListViewController()
            self.vcArray.append(listVc!)
        }
        
        listVc = self.vcArray[index]
        
        self.currentChildVc = listVc!
        self.currentChildVc?.superVc = self.currentVc as? FAN_HomeViewController;
        
        if let backBlock = self.backBlock {
            backBlock(listVc!);
        }
        
        return listVc!
    }

}
