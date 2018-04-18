//
//  InformationVC.swift
//  GreateSmart
//
//  Created by hailin on 2018/2/27.
//  Copyright © 2018年 Jerod. All rights reserved.
//

import UIKit

class InformationVC: BaseUIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.naviBar.titleLab.text = "资讯"
        self.naviBar.leftItemBtn.isHidden = true
        self.naviBar.rightItemBtn.isHidden = true
    }

    
    
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
