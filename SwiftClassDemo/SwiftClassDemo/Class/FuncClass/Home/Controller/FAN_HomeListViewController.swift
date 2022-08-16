//
//  FAN_HomeListViewController.swift
//  SwiftClassDemo
//
//  Created by 王丹 on 2022/8/1.
//

import UIKit
import JXSegmentedView
import FANBaseConfig

class FAN_HomeListViewController: FAN_BaseTableViewController ,JXSegmentedListContainerViewListDelegate{
   
    // 当前tableView 能否滚动
    var canScroll = false
    
    weak var superVc: FAN_HomeViewController?
    
    func listView() -> UIView {
        
        self.view
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        addChildView()
    }
    
    override func initData() {
        
        // 注册cell
        tableView(registerCellArray: ["FAN_HomeFirstCell"], cellReuseIdentifier: nil)
        
    }

    override func addChildView() {
        
        self.nvView.removeFromSuperview()
        self.tableView.bounces = false
        self.tableView.snp.remakeConstraints { make in
            make.edges.equalTo(self.view.snp.edges)
        }
        
    }
    
}

extension FAN_HomeListViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 20
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "FAN_HomeFirstCell", for: indexPath) as! FAN_BaseTableViewCell
        cell.currentVc = self

        return cell
        
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 100
    }
    
    
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        
        let offsetY = self.tableView.contentOffset.y

        if !canScroll {
            
            self.tableView.contentOffset = CGPoint(x: 0, y: 0);
            self.superVc?.canScroll = true;
            
            
        } else {
            

            if offsetY <= 0 {
                self.tableView.contentOffset = CGPoint(x: 0, y: 0);
                self.canScroll = false;
                self.superVc?.canScroll = true;
            }
            
        }
        
    }
    
    
}
