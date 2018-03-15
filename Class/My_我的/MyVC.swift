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
//        self.naviBar.titleLab.text = "MY"
//        self.view.backgroundColor = .blue
        self.naviBar.leftItemBtn.isHidden = true
        self.naviBar.rightItemBtn.backgroundColor = .red
        self.naviBar.backgroundColor = UIColor.red.withAlphaComponent(0.5)
//        self.naviBar.titleLab.backgroundColor = UIColor.brown
//        self.naviBar.alpha = 0
//        self.naviBar.isHidden = true
        
        tableView = BaseUITableView.init(frame: CGRect.init(x: 0, y: kStatusH, width: kScreenW, height: kScreenH-kStatusH-kTabbarH), style: UITableViewStyle.plain)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
//        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "muid")
        tableView.register(UINib.init(nibName: "UserOrderCell", bundle: nil), forCellReuseIdentifier: "UserOrderCellid")
        tableView.register(UINib.init(nibName: "UserServceCell", bundle: nil), forCellReuseIdentifier: "UserServceCellid")
        self.view.addSubview(tableView)
        
        tableView.contentInset = UIEdgeInsetsMake(heightUserHeadView, 0, 0, 0)
        userHeadView = UserHeaderView.loadFromXIB()
        userHeadView.frame = CGRect.init(x: 0, y: -heightUserHeadView, width: kScreenW, height: heightUserHeadView)
        tableView.addSubview(userHeadView)
        
        bringNaviToFront()
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section==0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "UserOrderCellid")
//        cell?.frame = CGRect.init(x: 0, y: 0, width: kScreenW, height: heightUserOrderCell)
            return cell!
        } else {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "UserServceCellid")
            return cell!
            
        }
        
//        let cell = tableView.dequeueReusableCell(withIdentifier: "muid")
//        cell?.backgroundColor = UIColor.purple
//        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section==0 {
            return heightUserOrderCell
        } else if indexPath.section==1 {
            return 240
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
