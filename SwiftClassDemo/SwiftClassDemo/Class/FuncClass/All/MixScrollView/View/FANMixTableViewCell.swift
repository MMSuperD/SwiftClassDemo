//
//  FANMixTableViewCell.swift
//  SwiftClassDemo
//
//  Created by 王丹 on 2022/10/30.
//

import UIKit

class FANMixTableViewCell: UITableViewCell {

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addChildView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func addChildView() {
       let hh = FAN_FlowWaterViewController()
        contentView.addSubview(hh.view)
        hh.view.snp.makeConstraints({
            $0.edges.equalToSuperview()
        })
    }
}
