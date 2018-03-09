//
//  HomePageVC.swift
//  GreateSmart
//
//  Created by hailin on 2018/2/23.
//  Copyright © 2018年 Jerod. All rights reserved.
//

import UIKit

class JJKit: NSObject {
    @objc var num:NSNumber = 9
    @objc let doub:Double = 2.2
    @objc var list:NSArray = [3,4,5,6,7]
}

class Test1: NSObject {
    @objc var testInteger: Int = 0
    @objc var str:String = ""
    @objc var flo:CGFloat = 0.0
    @objc var jjkits:NSMutableArray? = NSMutableArray()
}

class TestEntity: NSObject {
    @objc var testString: String!
    @objc var intValue:Int = 0
    @objc var test1 = Test1()
}

class HomePageVC: BaseUIViewController {

    private var tableCtrl  : ItemTableControl!
    private var homeData: NSArray = []
    private var itemModelArray: NSMutableArray = []
    
    override func loadView() {
        super.loadView()
//        //MARK:获取首页数据
//        NetworkManage.instance.requestHomePageData { (info) in
//            if info is NSArray {
//                self.homeData = info as! NSArray
////                delog(self.homeData)
//                self.tableCtrl.handleHomeData(homeData: self.homeData)
//            }
//        }
        

        
//        let test1 = Test1()
//        test1.testInteger = 1111
//        test1.str = "teststr"
//        test1.flo = 6.66
//        test1.jjkits?.add(JJKit())
//
//        let j = JJKit()
//        j.num = 90999
//        j.list = [0,0,1,2,1]
//
//        test1.jjkits?.add(j)
//
//        let test = TestEntity()
//        test.testString = "kklo"
//        test.test1 = test1
//        test.intValue = 3
//
//        NetworkManage.instance.testEntityParamsRequest(entity: test)
        
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default); /* 导航栏 设置透明 */
        self.navigationController?.navigationBar.shadowImage = UIImage(); /* 去掉黑线 */
        self.naviBar.isHidden = true
        
        configSubviews()
        configSearchButton()
    }
    
    //MARK:-

    func configSubviews() -> () {
        tableCtrl = ItemTableControl.init(tableFrame: CGRect(x: 0, y: kStatusH, width: kScreenW, height: kScreenH-kStatusH-kTabbarH))
        self.view.addSubview(tableCtrl.tableView!)
        
        self.homeData = [
            [
                "showType":"NewBanner",
                "data":[
                    ["imageUrl" : "http://pic.laopdr.cn:80/home_page_image/cdd087fc906b41f4990094dff3cccbfc.png",
                     "jumpUrl" : "localhost://www.laopdr.cn/app/itemTypeDetail?id=banjia"],
                    ["imageUrl" : "http://pic.laopdr.cn:80/home_page_image/e514ab8543db49ad929dc54cb3fc9649.png",
                     "jumpUrl" : "localhost://www.laopdr.cn/app/itemTypeDetail?id=004"],
                    ["imageUrl" : "http://pic.laopdr.cn:80/home_page_image/6d2893cea7eb4ce7acdacaf4751dbc56.png",
                     "jumpUrl" : "localhost://www.laopdr.cn/app/itemTypeDetail?id=002"]
                ]
            ]
            
        ]
        
        
        self.tableCtrl.handleHomeData(homeData: self.homeData)
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
