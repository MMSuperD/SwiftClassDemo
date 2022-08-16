//
//  FAN_MoreScrollViewController.swift
//  SwiftClassDemo
//
//  Created by 王丹 on 2022/8/10.
//

import UIKit

class FAN_MoreScrollViewController: FAN_BaseTableViewController {
    
    let nvViewMaxHeight = STATUSBAR_HEIGHT_FAN + 80
    
    let moreNvView: FAN_MoreNaView = {
        return FAN_MoreNaView(frame: .zero)
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        let str:String = "字符串"
        print(str)
        print(str.self)
        print(String.Type.self)
        print(type(of: str))
        print(String.self)
        let stringMetatype: Int.Type = Int.self
        print(stringMetatype)
        
        initData()
        addChildView()
    }
    
    override func initData() {
        
        self.moreNvView.backgroundColor = UIColor.green
        // 这个是放弃自动调整
        self.tableView.contentInsetAdjustmentBehavior = .never
        self.tableView.contentInset = UIEdgeInsets(top: nvViewMaxHeight, left: 0, bottom: 0, right: 0)
        self.tableView.contentOffset = CGPoint(x: 0, y: -nvViewMaxHeight)
        
        self.tableView.isScrollEnabled = false
        self.tableView.register(FAN_MoreScrollviewCell.classForCoder(), forCellReuseIdentifier: "FAN_MoreScrollviewCell")
    }
    
    override func addChildView() {
        
        self.view.addSubview(self.moreNvView)
        self.moreNvView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(self.view.snp.top).offset(0)
        }
        
        self.tableView.snp.remakeConstraints { make in
            make.leading.trailing.bottom.top.equalToSuperview()
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "FAN_MoreScrollviewCell", for: indexPath)
        cell.backgroundColor = UIColor.red
        
        return cell
        
        
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 400
    }
    

    
}

extension FAN_MoreScrollViewController {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
     
        // update moreNvView frame
        updateMoreNvView()
        
    }
    
    
    //update nvView
    
    func updateMoreNvView() -> Void {
        
        let offsetY = self.tableView.contentOffset.y + nvViewMaxHeight;
        
        let offsetMax = nvViewMaxHeight - STATUSBAR_NAVBAR_HEIGHT_FAN
        
        print("offsetY:\(offsetY) offsetMax:\(offsetMax)")
        
        
        
        if offsetY >= 0  {

            DispatchQueue.main.async {
                if offsetY <= offsetMax {
                    self.moreNvView.snp.updateConstraints { make in
                        make.top.equalTo(self.view.snp.top).offset(-offsetY)
                    }
                }else {
                    self.moreNvView.snp.updateConstraints { make in
                        make.top.equalTo(self.view.snp.top).offset(-offsetMax)
                    }
                }
                
                UIView.animate(withDuration: 0.1) {
                    self.view.layoutIfNeeded()

                } completion: { _ in
                }

            }
        }
    }
    
}
