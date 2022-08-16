//
//  FAN_WaterfallFlowViewController.swift
//  SwiftClassDemo
//
//  Created by 王丹 on 2022/8/15.
//

import UIKit


private let collectionHeaderKind = "Header"


protocol FAN_WaterfallFlowLayoutProtocol: NSObjectProtocol {
    
    func collectionView(layout: FAN_WaterfallFlowLayout, heightForItemAtIndexPath indexpath: IndexPath) -> Float
    
    func collectionView(layout: FAN_WaterfallFlowLayout, heightForSupplementaryViewAtIndexPath indexpath: IndexPath) -> Float
}

class FAN_WaterfallFlowLayout: UICollectionViewLayout {
    
    weak var delegate: FAN_WaterfallFlowLayoutProtocol?
    
    var columns: Int = 1
    var columnSpacing: Float = 10.0
    var itemSpacing: Float = 10.0
    var inserts: UIEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    
    private var attributesArray = [UICollectionViewLayoutAttributes]()
   
    private var columnHeights = [Float]()
    
    override var collectionViewContentSize: CGSize{
        
        get{
            let mostColumn = self.columnOfMostHeight()
            
            let mostHeight = self.columnHeights[mostColumn]
            
            return CGSize(width: CGFloat(self.collectionView!.bounds.width), height: CGFloat(mostHeight) + inserts.top + inserts.bottom)
            
        }
    }
    
    
    override init() {
        super.init()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func prepare() {
        super.prepare()
        
        //初始化
        for i in 0..<columns {
            self.columnHeights.append(Float(0))
        }
        
        //返回 有几组
        var numSections = self.collectionView?.numberOfSections
        
        guard let numSections = numSections else { return }
        
        for section in 0..<numSections {
            
            
            if let numItems = self.collectionView?.numberOfItems(inSection: section) {
               
                for item in 0..<numItems {
                    
                    let indexPath = IndexPath(item: item, section: section)
                    
                    if let attributes = self.layoutAttributesForItem(at: indexPath) {
                        self.attributesArray.append(attributes)
                    }
                }
            }
       
            
        }
        
        
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        
//        let attributesArray = self.attributesArray
        
        
        return self.attributesArray
    }
    
    
    override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        
        let attributes = UICollectionViewLayoutAttributes(forCellWith: indexPath)
        
        //返回外部 item 高度
        let itemHeight = self.delegate?.collectionView(layout: self, heightForItemAtIndexPath: indexPath)
        
        guard let itemHeight  = itemHeight else { return attributes }

        // headeView 的高度
        let headerHeight = self.delegate?.collectionView(layout: self, heightForSupplementaryViewAtIndexPath: indexPath)
        
        guard let headerHeight  = headerHeight else { return attributes }
        
        let columnIndex = self.columnOfLessHeight()
        let lessHeight = self.columnHeights[columnIndex]
        
        let width = (Float(self.collectionView!.bounds.size.width) - (Float(self.inserts.left + self.inserts.right) - self.columnSpacing * Float(self.columns - 1))) / Float(self.columns)
        
        let height = itemHeight
        
        let x = Float(self.inserts.left) + (width + self.columnSpacing)*Float(columnIndex)
       
        let y = lessHeight == 0 ? headerHeight + Float(self.inserts.top) : lessHeight + self.itemSpacing
        
        attributes.frame = CGRect.init(x: CGFloat(x), y: CGFloat(y), width: CGFloat(width), height: CGFloat(height))
        
        //更新高度
        self.columnHeights[columnIndex] = y + height
        

        return attributes
    }
    

    
    
    
    /// 找出最大的长度的 index
    /// - Returns: index
    func columnOfMostHeight() -> Int {
        
        var mostIndex = 0
        if self.columnHeights.count > 1 {
            
            for item in 0..<self.columnHeights.count {
                
                if self.columnHeights[item] > self.columnHeights[mostIndex] {
                    mostIndex = item;
                }
            }
            
        }
        
        return mostIndex
    }
    
    /// 找出最小的长度的 index
    /// - Returns: index
    func columnOfLessHeight() -> Int {
        var lessIndex = 0
        if self.columnHeights.count > 1 {
            
            for item in 0..<self.columnHeights.count {
                
                if self.columnHeights[item] < self.columnHeights[lessIndex] {
                    lessIndex = item;
                }
            }
            
        }
        
        return lessIndex
    }
    
    
    func indexPathForItemsIn(ract: CGRect) -> [IndexPath] {
        
        let array = [IndexPath]()
        
        return array
    }
    
    func indexPathForSupplementaryViewsOf(kind: String, in rect: CGRect) -> [IndexPath] {
        var array = [IndexPath]()

        if kind == collectionHeaderKind {
            
            
            let indexPath = IndexPath(item: 0, section: 0)
           
            array.append(indexPath)
        }
        
        return array
        
    }

}



class FAN_WaterfallFlowViewController: FAN_BaseViewController,UICollectionViewDelegate,UICollectionViewDataSource,FAN_WaterfallFlowLayoutProtocol {

    

    lazy var dataList: [Float] = {
        
        var tempArray = [Float]()
        
        for i in 0..<20 {
            
            // 随机数
            let random = Float.random(in: 50..<130)
            
            tempArray.append(random)

        }
        
        return tempArray
    }()
    
    
    lazy var collectionView: UICollectionView = {
        
        let layout = FAN_WaterfallFlowLayout()
        
        layout.delegate = self
        layout.columns = 2
        layout.columnSpacing = 10.0
        layout.inserts = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        initData()
        addChildView()

        // Do any additional setup after loading the view.
    }


    override func initData() {
        
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        
        self.collectionView.register(UICollectionViewCell.classForCoder(), forCellWithReuseIdentifier: "UICollectionViewCell")
        self.collectionView.register(UICollectionReusableView.classForCoder(), forSupplementaryViewOfKind: collectionHeaderKind, withReuseIdentifier: "UICollectionReusableView")
    }
    override func addChildView() {
        
        self.view.addSubview(self.collectionView)
        
        self.collectionView.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview()
            make.top.equalTo(self.nvView.snp.bottom)
        }
        
        
    }

}


extension FAN_WaterfallFlowViewController {
 
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
       return self.dataList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "UICollectionViewCell", for: indexPath)
        
        cell.backgroundColor = UIColor.randomColor()
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        if kind == collectionHeaderKind {
            
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "UICollectionReusableView", for: indexPath)
            
            return header
            
        }
        
        return UICollectionReusableView()
    }
    
    func collectionView(layout: FAN_WaterfallFlowLayout, heightForItemAtIndexPath indexpath: IndexPath) -> Float {
        
        self.dataList[indexpath.row]
    }
    
    func collectionView(layout: FAN_WaterfallFlowLayout, heightForSupplementaryViewAtIndexPath indexpath: IndexPath) -> Float {
        300.0
    }
}
