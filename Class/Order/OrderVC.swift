//
//  OrderVC.swift
//  GreateSmart
//
//  Created by hailin on 2018/3/28.
//  Copyright © 2018年 Jerod. All rights reserved.
//

import UIKit

class OrderVC: BaseUIViewController {

    var scrol : UIScrollView?
    var adrsCtrl : OrderAddressCtrl?
    var goodCtrl : OrderGoodlistCtrl?
    var payCtrl : OrderpayCtrl?
    
    override func loadView() {
        super.loadView()
        
        //数据
        scrol = UIScrollView.init(frame: CGRect.init(x: 0, y: kNaviH+60, width: kScreenW, height: kScreenH-kNaviH-60-kTabbarH))
        scrol?.contentSize = CGSize.init(width: 0, height: kScreenH * 2)

        //control初始化
        adrsCtrl = OrderAddressCtrl.init()
        adrsCtrl?.view!.frameXib = CGRect.init(x: 0, y: kNaviH, width: kScreenW, height: 60)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        naviBar.titleLab.text = "确认订单"
        view.addSubview(scrol!)
        view.addSubview(adrsCtrl!.view!)
        
        goodCtrl = OrderGoodlistCtrl.init()
        goodCtrl!.createView(frame: CGRect.init(x: 10, y: 15, width: kScreenW-20, height: 300))
        scrol!.addSubview(goodCtrl!.view!)
        
        payCtrl = OrderpayCtrl.init()
        payCtrl!.createView(frame: CGRect.init(x: 0, y: goodCtrl!.view!.bottom + 15, width: kScreenW, height: 200))
        scrol!.addSubview(payCtrl!.view!)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        UIView.animate(withDuration: 0.5) {
            self.tabBarController?.tabBar.y = kScreenH
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        UIView.animate(withDuration: 0.5) {
            self.tabBarController?.tabBar.y = kScreenH-kTabbarH
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
