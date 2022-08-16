//
//  FAN_AllViewController.swift
//  SwiftClassDemo
//
//  Created by 王丹 on 2022/8/7.
//

import UIKit
import FANBaseConfig

class FAN_AllViewController: FAN_BaseTableViewController {

    let dataArray = [
    
        [
            "className":"FANBaseConfig.FAN_BaseTableViewCell",
            "content":"全球化字符串",
        ],
        [
            "className":"FANBaseConfig.FAN_BaseTableViewCell",
            "content":"MoreScrollView",
            "action": "FAN_MoreScrollViewController"
        ],
        [
            "className":"FANBaseConfig.FAN_BaseTableViewCell",
            "content":"字典转模型",
            "action": "FAN_DictionaryModelViewController"
        ],
        [
            "className":"FANBaseConfig.FAN_BaseTableViewCell",
            "content":"瀑布流",
            "action": "FAN_WaterfallFlowViewController"
        ],
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initData()
        addChildView()
    }
    
    override func initData() {
        self.title = "功能View"
    }
    
    override func addChildView() {
        
        tableView(registerCellDict:[
            "FANBaseConfig":[
            "FAN_BaseTableViewCell"
            ]
        ])
        
        self.tableView.snp.remakeConstraints { make in

            make.leading.trailing.bottom.equalToSuperview()
            make.top.equalTo(self.nvView.snp.bottom)
        }
        
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int{
        1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.dataArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: self.dataArray[indexPath.row]["className"]!, for: indexPath)
        
        cell.textLabel?.text = self.dataArray[indexPath.row]["content"]!
        
        
        return cell
    }

  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //
        
        let action = self.dataArray[indexPath.row]["action"]
        
        guard let action = action else { return }
        
        // 这里需要做 跳转
        
        var classType = NSClassFromString(Bundle.nameplace + "." + action) as? UIViewController.Type
        
        if let type = classType {
            
            guard let vc = type.init() as? UIViewController else { return }
            vc.title = self.dataArray[indexPath.row]["content"]
            self.navigationController?.pushViewController(vc, animated: true)
            
        }

        
        
    }

}
