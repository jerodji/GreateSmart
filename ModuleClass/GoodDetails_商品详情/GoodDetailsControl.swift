//
//  GoodDetailsControl.swift
//  GreateSmart
//
//  Created by hailin on 2018/3/19.
//  Copyright © 2018年 Jerod. All rights reserved.
//

import UIKit

private let heightHeaderBanner = CGFloat(375)

class GoodDetailsControl: BaseControl,UITableViewDelegate,UITableViewDataSource {

    var scene : GoodDetailsVC!
    var view : GoodDetailsTableView!
    var dataArray : NSMutableArray! //
    
    private var cellNibNames : NSMutableArray = []
    private var cellIDs : NSMutableArray = []
    
    override init() {
        super.init()
        cellNibNames = ["GoodIntroduceCell","StoreCell","StoreIntroduceCell","EvaluationCell","HotRecommendCell"]
        cellIDs = ["GoodIntroduceCellid","StoreCellid","StoreIntroduceCellid","EvaluationCellid","HotRecommendCellid","detailsDefaultid"]
    }
    
    func initView(frame:CGRect) -> Void {
        view = GoodDetailsTableView.init(frame: frame, style: .grouped)
        view.delegate = self
        view.dataSource = self
        view.register(UITableViewCell.self, forCellReuseIdentifier: "detailsDefaultid")
        for index in 0...cellNibNames.count-1 {
            view.register(UINib.init(nibName: cellNibNames[index] as! String, bundle: nil), forCellReuseIdentifier: cellIDs[index] as! String)
        }
    }
    
//    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        if (scrollView.contentOffset.y >= 0) && (scrollView.contentOffset.y <= 375) {
//            let al = scrollView.contentOffset.y/heightHeaderBanner
//            scene.naviBar.backgroundColor = UIColor.white.withAlphaComponent(al)
//        }
//    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell : UITableViewCell?
        let CELLID = cellIDs[indexPath.section] as! String
        cell = tableView.dequeueReusableCell(withIdentifier: CELLID)
        cell?.selectionStyle = .none
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        var rowHeight :CGFloat = 0
        switch indexPath.section {
            case 0: rowHeight = CGFloat(200)
            case 1: rowHeight = CGFloat(50)
            case 2: rowHeight = CGFloat(225)
            case 3: rowHeight = CGFloat(260)
            case 4: rowHeight = CGFloat(240)
            case 5: rowHeight = CGFloat(999)
            default:rowHeight = CGFloat(0.01)
        }
        return rowHeight
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let v = UIView.init(frame: CGRect.init(x: 0, y: 0, width: kScreenW, height: 10))
        v.backgroundColor = UIColor.RGB(245,245,245)
        return v
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return nil
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section==0 {
            return heightHeaderBanner
        }
        return 10
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0
    }
    
    
    
    
    
}
