//
//  TabbarController.swift
//  GreateSmart
//
//  Created by hailin on 2018/2/24.
//  Copyright © 2018年 Jerod. All rights reserved.
//

import UIKit

class TabbarController: UITabBarController {
    
    let names = ["首页","商品","资讯","购物车","我的"]
    let icons = ["shouye","all","zixun","gouwuche","wode"]
    let selectIcons = ["shouye2","all2","zixun2","gouwuche2","wode2"]
    let vcs = [HomePageVC(),GoodListVC(),InformationVC(),ShopCartVC(),MyVC()]
    var Navs:[UIViewController] = [UIViewController]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for i in 0..<names.count {
            let vc = vcs[i]
            let nav = BaseUINavigationController.init(rootViewController: vc)
            
            vc.tabBarItem.image = UIImage.init(named: icons[i])
            vc.tabBarItem.selectedImage = UIImage.init(named: selectIcons[i])
            
            vc.tabBarItem.title = names[i]
            vc.tabBarItem.titlePositionAdjustment = UIOffset.init(horizontal: 0, vertical: -2.5)
            vc.tabBarItem.setTitleTextAttributes([NSAttributedStringKey.foregroundColor:UIColor.lightGray], for: .normal)
            vc.tabBarItem.setTitleTextAttributes([NSAttributedStringKey.foregroundColor:kColorTheme], for: .selected)
            
            Navs.append(nav)
        }
        
        self.viewControllers = Navs
        self.tabBar.barTintColor = kColorTabbar
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
