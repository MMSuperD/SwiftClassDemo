//
//  FANCustomeFlowLayout.swift
//  SwiftClassDemo
//
//  Created by 王丹 on 2022/10/30.
//

import UIKit

class FANCustomeFlowLayout: UICollectionViewFlowLayout {

    override func prepare() {
        super.prepare()
        itemSize = CGSize(width: SCREEN_WIDTH_FAN, height: 50)
        minimumLineSpacing = 0
        minimumInteritemSpacing = 0
    }
    
}
