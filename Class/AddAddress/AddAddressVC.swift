//
//  AddAddressVC.swift
//  GreateSmart
//
//  Created by hailin on 2018/3/31.
//  Copyright © 2018年 Jerod. All rights reserved.
//

import UIKit

class AddAddressVC: BaseUIViewController {
    
    var noAdrsView : NoAddressView? = NoAddressView.loadFromXIB()
    
    var adrsCl : AddressControl? = AddressControl.init()
    var dataList : NSMutableArray = []

    deinit {
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name(rawValue: notifyReloadAddress), object: nil)
    }
    
    override func loadView() {
        super.loadView()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.naviBar.titleLab.text = "选择地址"
        NotificationCenter.default.addObserver(self, selector: #selector(realodAddress), name: NSNotification.Name(rawValue: notifyReloadAddress), object: nil)
        getAdres()
    }
    
    
    
    func getAdres() -> Void {
        dataList.removeAllObjects()
        //加载初始数据
        NetHttp.ins.getAddresses(pageNo: 1, pageSize: 10) { (res) in
            
            let pageList = (res as! NSDictionary)["list"] as! NSArray
            for i in 0...pageList.count-1 {
                let dict = pageList[i] as! NSDictionary
                let model : AddressModel = AddressModel.mj_object(withKeyValues: dict)
                self.dataList.add(model as AddressModel)
            }
            
            if self.dataList.count == 0 {
                //没有地址的view
//                self.noAdrsView = NoAddressView.loadFromXIB()
                self.noAdrsView!.frameXib = self.view?.bounds
                self.noAdrsView!.createNewAddressBtn.addTarget(self, action: #selector(self.createNewAddressAction), for: .touchUpInside)
                self.view.addSubview(self.noAdrsView!)
            } else {
                //有地址的view
//                self.adrsCl = AddressControl.init()
                self.adrsCl!.scene = self
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
    
    @objc func realodAddress() -> () {
        dataList.removeAllObjects()
        
        NetHttp.ins.getAddresses(pageNo: 1, pageSize: 10) { (res) in
            
            let pageList = (res as! NSDictionary)["list"] as! NSArray
            for i in 0...pageList.count-1 {
                let dict = pageList[i] as! NSDictionary
                let model : AddressModel = AddressModel.mj_object(withKeyValues: dict)
                self.dataList.add(model as AddressModel)
            }
            
            if self.dataList.count == 0 {
                if self.noAdrsView == nil {
                    //没有地址了
                    self.noAdrsView = NoAddressView.loadFromXIB()
                    self.noAdrsView!.frameXib = self.view?.bounds
                    self.noAdrsView!.createNewAddressBtn.addTarget(self, action: #selector(self.createNewAddressAction), for: .touchUpInside)
                    self.view.addSubview(self.noAdrsView!)
                }
                else{
                    
                }
            }
            else {
                //有地址的view
                if self.adrsCl?.view == nil {
                    self.adrsCl = AddressControl.init()
                    self.adrsCl!.scene = self
                    self.adrsCl!.initView(CGRect.init(x: 0, y: kNaviH+10, width: kScreenW, height: kScreenH-kNaviH-10))
                    self.adrsCl!.dataList = self.dataList
                    self.view.addSubview(self.adrsCl!.view!)
                }
                else {
                    self.adrsCl!.dataList = self.dataList
                    self.adrsCl!.view?.reloadData()
                }
            }
            
        }
    }
}
