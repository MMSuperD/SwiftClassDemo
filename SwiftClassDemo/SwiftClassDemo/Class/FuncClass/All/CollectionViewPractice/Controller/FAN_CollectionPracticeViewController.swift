//
//  FAN_CollectionPracticeViewController.swift
//  SwiftClassDemo
//
//  Created by 王丹 on 2022/10/30.
//

import UIKit

class FAN_CollectionPracticeViewController: FAN_BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        addChildView()
    }
    
    override func addChildView() {
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints({
            $0.leading.trailing.bottom.equalToSuperview()
            $0.top.equalTo(self.nvView.snp.bottom)
        })
    }
    
    lazy var layout = FANCustomeFlowLayout()
    
    lazy var collectionView: UICollectionView = {
        let cv = UICollectionView(frame: .zero, collectionViewLayout: self.layout)
        cv.delegate = self
        cv.dataSource = self
        cv.register(UICollectionViewCell.classForCoder(), forCellWithReuseIdentifier: UICollectionViewCell.description())
        return cv
    }()
}

extension FAN_CollectionPracticeViewController: UICollectionViewDelegate,UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        10
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: UICollectionViewCell.description(), for: indexPath)
        cell.backgroundColor = .randomColor()
        return cell
    }
    
    
    
}
