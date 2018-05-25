//
//  HomePageVC.swift
//  GreateSmart
//
//  Created by hailin on 2018/2/23.
//  Copyright © 2018年 Jerod. All rights reserved.
//

import UIKit

class HomePageVC: BaseUIViewController {

    private var tableCtrl  : ItemTableControl!
    private var homeData: NSArray = []
    private var itemModelArray: NSMutableArray = []
    
    override func loadView() {
        super.loadView()
        //MARK:获取首页数据
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default); /* 导航栏 设置透明 */
        self.navigationController?.navigationBar.shadowImage = UIImage(); /* 去掉黑线 */
        self.naviBar.isHidden = true
        
        configSubviews()
        configSearchButton()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
    }
    
    //MARK:-
    
    func configSubviews() -> () {
        tableCtrl = ItemTableControl.init(tableFrame: CGRect(x: 0, y: kStatusH, width: kScreenW, height: kScreenH-kStatusH-kTabbarH))
        
        self.homeData = NSArray.json_object(fromJSONString: testJsonStr) as! NSArray
        self.tableCtrl.handleHomeData(homeData: self.homeData)
        
        self.view.addSubview(tableCtrl.tableView!)
    }
    
    //MARK: 搜索按钮
    func configSearchButton() -> () {
        let ssBtn = UIButton.init(frame: CGRect.init(x: kScreenW-15-44, y: kStatusH, width: 44, height: 44))
        ssBtn.setImage(UIImage(named:"ss"), for: UIControlState.normal)
        ssBtn.addTarget(self, action: #selector(searchButtonAction), for: UIControlEvents.touchUpInside)
        self.view.addSubview(ssBtn)
    }
    @objc func searchButtonAction() -> () {
        let searchvc = SearchVC()
        self.navigationController?.pushViewController(searchvc, animated: true)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
