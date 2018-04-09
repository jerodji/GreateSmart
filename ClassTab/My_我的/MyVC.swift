//
//  MyVC.swift
//  GreateSmart
//
//  Created by hailin on 2018/2/24.
//  Copyright © 2018年 Jerod. All rights reserved.
//

import UIKit

let heightUserHeadView = CGFloat(125)

class MyVC: BaseUIViewController,UITableViewDelegate,UITableViewDataSource {
    
    private var tableView: BaseUITableView!
    private var userHeadView: UserHeaderView!
    
    override func loadView() {
        super.loadView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.naviBar.leftItemBtn.isHidden = true
        self.naviBar.rightItemBtn.setImage(UIImage.init(named: "xiaoxi"), for: .normal)
        self.naviBar.backgroundColor = UIColor.black.withAlphaComponent(0.0)
        self.naviBar.line.backgroundColor = UIColor.black.withAlphaComponent(0.0)
        //self.naviBar.isUserInteractionEnabled = false
        
        /**
         tableView
         */
        tableView = BaseUITableView.init(frame: CGRect.init(x: 0, y: kStatusH, width: kScreenW, height: kScreenH-kStatusH-kTabbarH), style: UITableViewStyle.plain)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.register(UINib.init(nibName: "UserOrderCell", bundle: nil), forCellReuseIdentifier: "UserOrderCellid")
        tableView.register(UINib.init(nibName: "UserServceCell", bundle: nil), forCellReuseIdentifier: "UserServceCellid")
        self.view.addSubview(tableView)
        tableView.contentInset = UIEdgeInsetsMake(heightUserHeadView, 0, 0, 0)
        
        /**
         userHeadView
         */
        userHeadView = UserHeaderView.loadFromXIB()
        userHeadView.frame = CGRect.init(x: 0, y: -heightUserHeadView, width: kScreenW, height: heightUserHeadView)
        tableView.addSubview(userHeadView)
        //bringNaviToFront()
        view.bringSubview(toFront: naviBar)
        userHeadView.iconClickCB = {
            self.present(LoginVC(), animated: true, completion: nil)
        }
        
    }
    
    //MARK:-
//    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        if scrollView.contentOffset.y < -heightUserHeadView {
//            scrollView.contentOffset.y = -heightUserHeadView
//        } else {
//            let alp = CGFloat(1.0 - (-scrollView.contentOffset.y)/heightUserHeadView)
//            self.naviBar.backgroundColor = UIColor.black.withAlphaComponent(alp)
//        }
//    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section==0 {
            //我的订单
            let cell = tableView.dequeueReusableCell(withIdentifier: "UserOrderCellid")
            cell?.selectionStyle = .none
            return cell!
            
        } else if indexPath.section==1 {
            //我的服务
            let cell = tableView.dequeueReusableCell(withIdentifier: "UserServceCellid") as? UserServceCell
            cell?.selectionStyle = .none
            cell?.btnActionCB = { (tag) in
                self.ServceAction(btnTag: tag)
            }
            
            
            return cell!
            
        } else {
            var cell = tableView.dequeueReusableCell(withIdentifier: "userCenterDefaultId")
            if cell == nil {
                cell = UITableViewCell.init(style: .default, reuseIdentifier: "userCenterDefaultId")
                cell?.selectionStyle = .none
            }
            return cell!
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section==0 {
            return heightUserOrderCell
        } else if indexPath.section==1 {
            return heightUserServceCell
        }
        return 0
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    //MARK:-
    
    func ServceAction(btnTag:Int) -> Void {
        switch btnTag {
            
            case 0: do{
                delog("我的服务-优惠券")
            }; break
            
            case 1: do{
                delog("我的服务-聪明比")
            }; break
            
            case 2: do{
                delog("我的服务-我的积分")
            }; break
            
            case 3: do{
                delog("我的服务-我的消息")
            }; break
            
            case 4: do{
                delog("我的服务-商品收藏")
            }; break
            
            case 5: do{
                delog("我的服务-店铺收藏")
            }; break
            
            case 6: do{
                delog("我的服务-资讯收藏")
            }; break
            
            case 7: do{
                delog("我的服务-浏览记录")
            }; break
            
            case 8: do{
                //地址管理
                delog("我的服务-地址管理")
                let advc = AddAddressVC()
                advc.naviBar.titleLab.text = "地址管理"
                advc.hidesBottomBarWhenPushed = true
                self.navigationController?.pushViewController(advc, animated: true)
            }; break
            
            case 9: do{
                delog("我的服务-意见反馈")
            }; break
            
            case 10: do{
                delog("我的服务-我的会员")
            }; break
            
            case 11: do{
                delog("我的服务-二维码")
            }; break
            
            default: do{
                delog("我的服务-default:do")
            }
        }
    }
    
    
}
