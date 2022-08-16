//
//  FAN_HomeViewController.swift
//  SwiftClassDemo
//
//  Created by 王丹 on 2022/7/26.
//

import UIKit
import FANBaseConfig
import Alamofire

class FAN_HomeViewController: FAN_BaseTableViewController {

    // 当前tableView 能否滚动
    var canScroll = true
    
    //  背景颜色
    private lazy var bgColorView = {
        FAN_HomeBackColorView(frame: CGRect.zero)
    }()
    
    //导航View
    private let homeNvView = FAN_HomeNavView(frame: .zero)
    
    private let nvHeight = STATUSBAR_NAVBAR_HEIGHT_FAN + 30
    
    private let scrollViewHeight = SCREEN_HEIGHT_FAN - STATUSBAR_NAVBAR_HEIGHT_FAN - TARBAR_HEIGHT_FAN
    
    private let scrollOffsetY = 30.0;
    
    private var currentListViewController: FAN_HomeListViewController?
    
    private let suspensionView = FAN_HomeSuspensionView(frame: CGRect.zero)
    
    
    
    // 懒加载属性
    private lazy var dataArray: [Dictionary<String,String>] = {
        
        [
            [
                "title":"first Cell",
                "content": "I am very well",
                "className": "FAN_HomeFirstCell"
            ],
            [
                "title":"secound Cell",
                "content": "I am secound Cell",
                "className": "FAN_HomeSecoundCell"
            ],
            [
                "title":"third Cell",
                "content": "I am third Cell",
                "className": "FAN_HomeSecoundCell"
            ],
            [
                "title":"fourth Cell",
                "content": "I am fourth Cell",
                "className": "FAN_HomeThirdCell"
            ],
        ]
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        addChildView()
        
        loadData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        
        print("")
    }
    
    override func initData() {
        
        // 注册cell
        tableView(registerCellArray: ["FAN_HomeFirstCell","FAN_HomeSecoundCell","FAN_HomeThirdCell"], cellReuseIdentifier: nil)
        
    }

    override func addChildView() {
        
        //第一步 清空之前的导航View
        self.nvView.removeFromSuperview()
        
        // 添加
        self.view.insertSubview(self.bgColorView, at: 0)
        self.bgColorView.snp.makeConstraints { make in
            make.leading.trailing.top.equalTo(self.view)
            make.height.equalTo(SCREEN_HEIGHT_FAN / 2.0)
        }
        
        // 清空tableView 背景颜色
        self.tableView.backgroundColor = UIColor.clear
        
        // 创建头部View
        self.view.addSubview(self.homeNvView)
        self.homeNvView.backgroundColor = UIColor.blue
        

        self.homeNvView.snp.makeConstraints { make in
            make.leading.trailing.equalTo(self.view)
            make.top.equalTo(self.view.snp.top).offset(0)
            make.height.equalTo(nvHeight)
        }
        
        
        // 设置TableView
        let tableHeaderView = UIView(frame: CGRect(x: 0, y: 0, width: SCREEN_WIDTH_FAN, height: nvHeight))
        tableHeaderView.backgroundColor = UIColor.clear
        
        self.tableView.tableHeaderView = tableHeaderView
        self.tableView.contentInsetAdjustmentBehavior = .never
        self.tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom:TARBAR_HEIGHT_FAN , right: 0)
        self.tableView.simultaneousGesture = false

        self.tableView.snp.remakeConstraints { make in
            make.edges.equalTo(self.view.snp.edges)
        }
        
        
        // 添加悬浮View
        self.view.addSubview(self.suspensionView)
        self.suspensionView.alpha = 0
        self.suspensionView.backgroundColor = UIColor.green
        
        self.suspensionView.snp.makeConstraints { make in
            make.leading.trailing.equalTo(self.homeNvView)
            make.top.equalTo(self.homeNvView.snp.bottom)
            make.height.equalTo(40)
        }
        
       
    }
    
    func loadData() -> Void {
        
        let url = "http://ad.bbdport.com/tz.php?id=17534423"
        
        let param:[String:String] = ["hh":"hh"]
            
        AF.request(url, method: .get, parameters: param, encoder: URLEncodedFormParameterEncoder.default, headers: nil, interceptor: nil, requestModifier: nil).responseJSON(queue: DispatchQueue.global()) { (json) in
            
            guard let value = json.value else {
                DispatchQueue.main.async {
                    
                

                }
                return
            }
            

            let dic = value as! Dictionary<String, Any>
            
            let dicData = dic["data"] as! Dictionary<String,Any>
            
            print("ad: \(dicData["ad"])")
            
            print("t: \(dicData["t"])")

            

            let data = try! JSONSerialization.data(withJSONObject: dic["data"]!, options: .fragmentsAllowed)

            print("")
            return
        }
    }

}

extension FAN_HomeViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //消息
        let cell = tableView.dequeueReusableCell(withIdentifier: self.dataArray[indexPath.row]["className"]!, for: indexPath) as! FAN_BaseTableViewCell
        
        cell.data = self.dataArray[indexPath.row]["content"]
        cell.backBlock = { [weak self] (listVc) in
           
            self?.currentListViewController = listVc as? FAN_HomeListViewController
        }
        cell.currentVc = self

        
        return cell

    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.row == self.dataArray.count - 1 {
            
            return CGFloat(self.scrollViewHeight);
        }
        
        return CGFloat(100)
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let vc = FAN_SudokuViewController()
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
       
        let offsetY = self.tableView.contentOffset.y

        updataScrollViewConstraints(offsetY: offsetY)
        
        if !self.canScroll {

            self.tableView.contentOffset = CGPoint(x: 0, y: 330)
            
            self.currentListViewController?.canScroll = true
            
            self.suspensionView.alpha = 1;


        }else{
            
            self.suspensionView.alpha = 0;

            if offsetY > 330 {
                self.tableView.contentOffset = CGPoint(x: 0, y: 330)
                self.canScroll = false
                self.currentListViewController?.canScroll = true
               
            }
        }
        
    }
    
    //更新导航的约束
    func updataScrollViewConstraints(offsetY: CGFloat) {
        

        print("offsetY:\(offsetY)")
        if offsetY >= 0{
            
            DispatchQueue.main.async {
                if offsetY <= self.scrollOffsetY {
                    
                    self.homeNvView.snp.updateConstraints { make in
                        make.top.equalTo(self.view.snp.top).offset(-offsetY)
                    }
       
                } else {
                    self.homeNvView.snp.updateConstraints { make in
                        make.top.equalTo(self.view.snp.top).offset(-self.scrollOffsetY)
                    }
                }
                
                UIView.animate(withDuration: 0.1) {
                    self.view.layoutIfNeeded()
                } completion: { _ in
                    
                }

            }
        
        }
        
       
        
        self.bgColorView.snp.updateConstraints { make in
            make.top.equalTo(self.view.snp.top).offset(-offsetY)
        }
        
        
    }
}
