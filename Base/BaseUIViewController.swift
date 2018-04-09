//
//  BaseUIViewController.swift
//  GreateSmart
//
//  Created by Jerod on 2018/2/23.
//  Copyright © 2018年 Jerod. All rights reserved.
//

import UIKit

class BaseUIViewController: UIViewController {
    
    //MARK: 自定义的导航栏bar
    let naviBar = CustomNaviBar.init(frame: CGRect.init(x: 0, y: 0, width: kScreenW, height: kNaviH))
    var hideTabbar : Bool = false
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    //dealloc
//    deinit {
//
//    }
    
//    override func loadView() {
//        super.loadView()
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        customNavigationBar()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        view.bringSubview(toFront: naviBar) /** 推至最前端 */
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
//        if hideTabbar {
//            UIView.animate(withDuration: 0.5) {
//                self.tabBarController?.tabBar.y = kScreenH-kTabbarH
//            }
//        }
        
    }
    
   
    func customNavigationBar() -> () {
        /* 隐藏系统导航栏bar */
        self.navigationController?.navigationBar.isHidden = true
        /* 添加自定义的bar */
        naviBar.backgroundColor = kColorNavi
        self.view.addSubview(naviBar)
        /* 左边按钮事件回调 */
        naviBar.leftCallback = {
            if self.navigationController != nil {
                self.navigationController?.popViewController(animated: true)
            } else {
                self.dismiss(animated: true, completion: nil)
            }
        }
        
    }
    
//    func bringNaviToFront() -> Void {
//        naviBar.layer.zPosition = 200 //推到前端..
//    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        delog("内存不足")
    }
}
