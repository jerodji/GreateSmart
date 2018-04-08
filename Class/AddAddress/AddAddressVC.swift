//
//  AddAddressVC.swift
//  GreateSmart
//
//  Created by hailin on 2018/3/31.
//  Copyright © 2018年 Jerod. All rights reserved.
//

import UIKit

class AddAddressVC: BaseUIViewController {
    
    var noAdrsView : NoAddressView?
    
    var adrsCl : AddressControl?
    var dataList : NSMutableArray = []

    override func loadView() {
        super.loadView()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.naviBar.titleLab.text = "选择地址"
        
        dataList.removeAllObjects()
        //加载初始数据
        NetHttp.ins.getAddresses(pageNo: 1, pageSize: 10) { (res) in
            
            let pageList = (res as! NSDictionary)["list"] as! NSArray
            for i in 0...pageList.count-1 {
                let dict = pageList[i] as! NSDictionary
                let model : AddressModel = AddressModel.mj_object(withKeyValues: dict)
                self.dataList.add(model as AddressModel!)
            }
            
            if self.dataList.count == 0 {
                //没有地址的view
                self.noAdrsView = NoAddressView.loadFromXIB()
                self.noAdrsView!.frameXib = self.view?.bounds
                self.noAdrsView!.createNewAddressBtn.addTarget(self, action: #selector(self.createNewAddressAction), for: .touchUpInside)
                self.view.addSubview(self.noAdrsView!)
            } else {
                //有地址的view
                self.adrsCl = AddressControl.init()
                self.adrsCl!.initView(CGRect.init(x: 0, y: kNaviH+10, width: kScreenW, height: kScreenH-kNaviH-10))
                self.adrsCl!.dataList = self.dataList
                self.view.addSubview(self.adrsCl!.view!)
            }
            
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    

    
    
    @objc func createNewAddressAction() -> Void {
        let createVC = CreateNewAdresVC.init(nibName: "CreateNewAdresVC", bundle: nil)
        self.navigationController?.pushViewController(createVC, animated: true)
    }
    
    
}
