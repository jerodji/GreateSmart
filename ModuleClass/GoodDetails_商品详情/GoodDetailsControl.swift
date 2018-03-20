//
//  GoodDetailsControl.swift
//  GreateSmart
//
//  Created by hailin on 2018/3/19.
//  Copyright © 2018年 Jerod. All rights reserved.
//

import UIKit

private let height_GoodDetails_HeaderBanner = CGFloat(375*kSizeScale)
private var height_GoodDetails_GoodIntroduceCell = CGFloat(200) //0
private let height_GoodDetails_StoreCell = CGFloat(50) // 1
private let height_GoodDetails_StoreIntroduceCell = CGFloat(225) // 2
private let height_GoodDetails_EvaluationCell = CGFloat(260) // 3
private let height_GoodDetails_HotRecommendCell = CGFloat(240) // 4
private let height_GoodDetails_h5 = CGFloat(999) // 5

private var zkStatus : Bool = true

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
        for index in 0...cellNibNames.count-1 {
            view.register(UINib.init(nibName: cellNibNames[index] as! String, bundle: nil), forCellReuseIdentifier: cellIDs[index] as! String)
        }
        view.register(UITableViewCell.self, forCellReuseIdentifier: "detailsDefaultid")
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delog("GoodDetails-select \(indexPath.section)")
        switch indexPath.section {
            case 0: do {}; break
            case 1: do {}; break
            case 2: do {}; break
            case 3: do {}; break
            case 4: do {}; break
            case 5: do {}; break
            default:do {}; break
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell : UITableViewCell?
        let CELLID = cellIDs[indexPath.section] as! String
        cell = tableView.dequeueReusableCell(withIdentifier: CELLID)
        cell?.selectionStyle = .none
        
        if CELLID=="GoodIntroduceCellid" {
            (cell as! GoodIntroduceCell).zhankaiCB = { () -> Void in
                
                if zkStatus {
                    zkStatus = false
                    height_GoodDetails_GoodIntroduceCell = 400
                } else {
                    zkStatus = true
                    height_GoodDetails_GoodIntroduceCell = 200
                }
                //tableView.reloadRows(at: [indexPath], with: UITableViewRowAnimation.top)
                tableView.reloadData()
            }
        }
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        var rowHeight :CGFloat = 0
        switch indexPath.section {
            case 0: rowHeight = height_GoodDetails_GoodIntroduceCell; break
            case 1: rowHeight = height_GoodDetails_StoreCell; break
            case 2: rowHeight = height_GoodDetails_StoreIntroduceCell; break
            case 3: rowHeight = height_GoodDetails_EvaluationCell; break
            case 4: rowHeight = height_GoodDetails_HotRecommendCell; break
            case 5: rowHeight = height_GoodDetails_h5; break
            default:rowHeight = CGFloat(0.01); break
        }
        return rowHeight
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return cellNibNames.count + 1 // +1 test
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
            return height_GoodDetails_HeaderBanner
        }
        return 10
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0
    }
    
    //    func scrollViewDidScroll(_ scrollView: UIScrollView) {
    //        if (scrollView.contentOffset.y >= 0) && (scrollView.contentOffset.y <= 375) {
    //            let al = scrollView.contentOffset.y/heightHeaderBanner
    //            scene.naviBar.backgroundColor = UIColor.white.withAlphaComponent(al)
    //        }
    //    }
    
}
