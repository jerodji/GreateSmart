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
    
    override func loadView() {
        super.loadView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.naviBar.titleLab.text = "选择地址"
        
        noAdrsView = NoAddressView.loadFromXIB()
        noAdrsView!.frameXib = view.bounds
        view.addSubview(noAdrsView!)
        noAdrsView!.createNewAddressBtn.addTarget(self, action: #selector(createNewAddressAction), for: .touchUpInside)
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
