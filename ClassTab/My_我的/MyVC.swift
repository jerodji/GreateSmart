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
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "UserOrderCellid")
            cell?.selectionStyle = .none
            return cell!
            
        } else if indexPath.section==1 {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "UserServceCellid")
            cell?.selectionStyle = .none
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
    
    
}
