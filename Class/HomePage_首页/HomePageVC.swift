//
//  HomePageVC.swift
//  GreateSmart
//
//  Created by hailin on 2018/2/23.
//  Copyright © 2018年 Jerod. All rights reserved.
//

import UIKit

class HomePageVC: BaseUIViewController {

    var banerModel = BannerModel()
    let banerCtrl  = BannerControl()
    let tableCtrl  = HomeTableControl()
    
    override func loadView() {
        super.loadView()
        //MARK:获取首页数据
        let responseDic = NetworkManage.instance.requestHomePageData(index: 1)
        delog(responseDic)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default); /* 导航栏 设置透明 */
        self.navigationController?.navigationBar.shadowImage = UIImage(); /* 去掉黑线 */
        self.naviBar.isHidden = true
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        configBannerView()
        configTableview()
        configSearchButton()
    }
    
    //MARK:-
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
    
    //MARK: banner
    func configBannerView() -> () {
        banerCtrl.bannerView.frame = CGRect.init(x: 0, y: 0, width: kScreenW, height: 315*kSizeScale)
//        banerCtrl.bannerView.mas_makeConstraints { (make) in
//           _ = make?.left.mas_equalTo()(self.view.mas_left)?.setOffset(0)
//           _ = make?.top.mas_equalTo()(self.view.mas_top)?.setOffset(0)
//           _ = make?.width.mas_equalTo()(kScreenW)
//           _ = make?.height.mas_equalTo()(315*kSizeScale)
//        }
        
        self.view.addSubview(banerCtrl.bannerView)
        
    }
    
    //MARK: tableView
    func configTableview() -> () {
        tableCtrl.tableView.frame = CGRect.init(x: 0, y: banerCtrl.bannerView.bottom, width: kScreenW, height: kScreenH-banerCtrl.bannerView.height-49)
        self.view.addSubview(tableCtrl.tableView)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
}
