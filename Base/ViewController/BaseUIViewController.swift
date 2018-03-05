//
//  BaseUIViewController.swift
//  GreateSmart
//
//  Created by Jerod on 2018/2/23.
//  Copyright © 2018年 Jerod. All rights reserved.
//

import UIKit

class BaseUIViewController: UIViewController {
    
    //MARK: 自定义导航栏bar
    let naviBar = CustomNaviBar.init(frame: CGRect.init(x: 0, y: 0, width: kScreenW, height: kNaviH))
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        customNavigationBar()
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
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        delog("内存不足")
    }
}
