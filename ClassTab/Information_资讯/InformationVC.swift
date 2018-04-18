//
//  InformationVC.swift
//  GreateSmart
//
//  Created by hailin on 2018/2/27.
//  Copyright © 2018年 Jerod. All rights reserved.
//

import UIKit

class InformationVC: SYATopScrollViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
//        self.naviBar.titleLab.text = "资讯"
//        self.naviBar.leftItemBtn.isHidden = true
//        self.naviBar.rightItemBtn.isHidden = true
        self.title = "资讯"
        
        setUpAllViewController()
        self.setupTitleGradient(with: kTitleColorStyleRGB, norColor: UIColor.gray, selColor: UIColor.black)
        self.setupTitleScale(withTitleScale: 1.2)
        self.titleScrollView.backgroundColor = UIColor.white
        self.setupTitleScrollViewShadow(with: UIColor.RGB(83, 83, 83), opacity: 0.5, radius: 2, offset: CGSize(width: 0, height: 0))
    }
    
    func setUpAllViewController() -> () {
        let vc0 = UIViewController()
        vc0.title = "精品推荐"
        vc0.view.backgroundColor = .clear
        self.addChildViewController(vc0)
        
        let vc1 = UIViewController()
        vc1.title = "健康误区"
//        vc1.view.backgroundColor = UIColor.red
        self.addChildViewController(vc1)
        
        let vc2 = UIViewController()
        vc2.title = "异国健康"
//        vc2.view.backgroundColor = UIColor.yellow
        self.addChildViewController(vc2)
        
        let vc3 = UIViewController()
        vc3.title = "奇闻异事"
//        vc3.view.backgroundColor = UIColor.blue
        self.addChildViewController(vc3)
        
        let vc4 = UIViewController()
        vc4.title = "药膳搭配"
//        vc4.view.backgroundColor = UIColor.green
        self.addChildViewController(vc4)
        
        let vc5 = UIViewController()
        vc5.title = "sad"
        vc5.view.backgroundColor = UIColor.gray
        self.addChildViewController(vc5)
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
