//
//  GoodDetailsVC.swift
//  GreateSmart
//
//  Created by hailin on 2018/3/19.
//  Copyright © 2018年 Jerod. All rights reserved.
//

import UIKit

class GoodDetailsVC: BaseUIViewController {

    let detailCtl = GoodDetailsControl.init()
    
    override func loadView() {
        super.loadView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        naviBar.jj_backgroundColor = UIColor.white.withAlphaComponent(0)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        navigationController?.interactivePopGestureRecognizer?.isEnabled = false /* 左侧返回手势 */
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.interactivePopGestureRecognizer?.isEnabled = true /* 左侧返回手势 */
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        naviBar.jj_backgroundColor = UIColor.white.withAlphaComponent(1)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.RGB(183, 183, 183)
        
        detailCtl.scene = self
        detailCtl.initView(frame: CGRect(x: 0, y: kStatusH, width: kScreenW, height: kScreenH-kStatusH-kTabbarH))
        view.addSubview(detailCtl.view)
        
        naviBar.leftItemBtn.frame = CGRect.init(x: 15, y: kStatusH + (44-35)/2, width: 35, height: 35)
        naviBar.leftItemBtn.setImage(UIImage.init(named: ""), for: .normal)
        naviBar.leftItemBtn.setBackgroundImage(UIImage.init(named: "bfanhui"), for: .normal)
        naviBar.rightItemBtn.setImage(UIImage.init(named: "xiangqinggouwuche"), for: .normal)
        //view.bringSubview(toFront: naviBar)
        naviBar.leftCallback = { ()->() in
            self.navigationController?.popViewController(animated: true)
        }
        naviBar.rightCallback = { ()->() in
            delog("right click")
        }
        
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
