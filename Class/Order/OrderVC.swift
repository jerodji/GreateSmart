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
    var orderAdrsCtrl : OrderAddressCtrl?
    var orderGoodCtrl : OrderGoodlistCtrl?
    var payCtrl : OrderpayCtrl?
    var allpriceBar : OrderAllPriceBar?
    var alldistance : CGFloat = 0
    
    override func loadView() {
        super.loadView()
        
        //数据...
        
        //地址control初始化
        orderAdrsCtrl = OrderAddressCtrl.init()
        orderAdrsCtrl?.view!.frameXib = CGRect.init(x: 0, y: kNaviH, width: kScreenW, height: 60)
        //商品信息列表
        orderGoodCtrl = OrderGoodlistCtrl.init()
        let listH = h_OrderGoodlistCell*6 + h_orderGoodlistCellHead*2 + h_orderGoodlistCellFoot*2
        orderGoodCtrl!.createView(frame: CGRect.init(x: 10, y: 15, width: kScreenW-20, height: listH))
        alldistance += 15 + listH
        //支付信息
        payCtrl = OrderpayCtrl.init()
        payCtrl!.createView(frame: CGRect.init(x: 0, y: orderGoodCtrl!.view!.bottom + 15, width: kScreenW, height: 450))
        alldistance += (15+450)
        // scroll view
        scrol = UIScrollView.init(frame: CGRect.init(x: 0, y: kNaviH+60, width: kScreenW, height: kScreenH-kNaviH-60-kTabbarH))
        scrol?.contentSize = CGSize.init(width: 0, height: alldistance)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        naviBar.titleLab.text = "确认订单"
        hideTabbar = true
        view.addSubview(scrol!)
        view.addSubview(orderAdrsCtrl!.view!)
        scrol!.addSubview(orderGoodCtrl!.view!)
        scrol!.addSubview(payCtrl!.view!)
        
        // bar
        allpriceBar = OrderAllPriceBar.loadFromXIB()
        allpriceBar!.frameXib = CGRect.init(x: 0, y: kScreenH-kTabbarH, width: kScreenW, height: kTab49)
        view.addSubview(allpriceBar!)
        
        //地址事件
        orderAdrsCtrl?.setScene(vc: self, viewTapSel: #selector(addressAction))
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        orderAdrsCtrl?.configView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }
    
    //MARK:-
    
    @objc func addressAction () -> Void {
        let vc = AddAddressVC()
        vc.naviBar.titleLab.text = "选择地址"
        
        weak var wkVC = vc
        weak var wkself = self
        vc.adrsCl?.selecCb = { model in
            wkself?.orderAdrsCtrl?.adrsModel = model
            wkVC?.navigationController?.popViewController(animated: true)
        }
        
        self.navigationController?.pushViewController(vc, animated: true)
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
