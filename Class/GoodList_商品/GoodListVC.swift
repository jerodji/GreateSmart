//
//  GoodListVC.swift
//  GreateSmart
//
//  Created by hailin on 2018/2/24.
//  Copyright © 2018年 Jerod. All rights reserved.
//

import UIKit

let heightSortView = CGFloat(40)

class GoodListVC: BaseUIViewController {

    let sortView : SortingView = SortingView.loadFromXIB()
    let leftCtl = LeftControl.init()
    let rightCtl = RightControl.init()
    
    
    override func loadView() {
        super.loadView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.naviBar.titleLab.text = "全部商品"
        self.naviBar.leftItemBtn.isHidden = true
        self.naviBar.rightItemBtn.isHidden = true
        
        self.view.addSubview(sortView)
        self.view.addSubview(leftCtl.view)
        self.view.addSubview(rightCtl.view)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        sortView.frame = CGRect.init(x: 0, y: kNaviH, width: kScreenW, height: heightSortView)
        
        let Y = kNaviH+heightSortView+4
        let W = kScreenW/2
        let H = kScreenH-kNaviH-kTabbarH-heightSortView-4
        leftCtl.view.frame  = CGRect(x: 0, y:Y , width:W , height:H )
        rightCtl.view.frame = CGRect(x: W, y: Y, width: W, height: H)
    }
    
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
