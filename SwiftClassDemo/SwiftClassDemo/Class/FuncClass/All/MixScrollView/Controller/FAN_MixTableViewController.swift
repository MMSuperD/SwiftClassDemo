//
//  FAN_MixTableViewController.swift
//  SwiftClassDemo
//
//  Created by 王丹 on 2022/10/30.
//

import UIKit

class FAN_MixTableViewController: FAN_BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        addChildView()
    }
    
    override func addChildView() {
        view.addSubview(tableView)
        tableView.snp.makeConstraints({
            $0.leading.trailing.bottom.equalToSuperview()
            $0.top.equalTo(self.nvView.snp.bottom)
        })
        
    }
    
    lazy var tableView:UITableView = { [weak self] in
        let tableV = UITableView(frame: .zero, style: .grouped)
        tableV.dataSource = self
        tableV.delegate = self
        tableV.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: UITableViewCell.description())
        tableV.register(FANMixTableViewCell.classForCoder(), forCellReuseIdentifier: FANMixTableViewCell.description())
        return tableV
    }()
 
}

extension FAN_MixTableViewController: UITableViewDelegate,UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 5
        case 1:
            return 1
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: FANMixTableViewCell.description(), for: indexPath)
            cell.backgroundColor = .randomColor()
            return cell
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: UITableViewCell.description(), for: indexPath)
        cell.backgroundColor = .randomColor()

        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.section == 1 {
            return SCREEN_HEIGHT_FAN - 88
        }
        
        return 44.0
    }
    
    
}
