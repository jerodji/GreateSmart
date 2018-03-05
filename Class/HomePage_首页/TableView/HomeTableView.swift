//
//  HomeTableView.swift
//  GreateSmart
//
//  Created by hailin on 2018/3/5.
//  Copyright © 2018年 Jerod. All rights reserved.
//

import UIKit

class HomeTableView: BaseUITableView,UITableViewDelegate,UITableViewDataSource {
    
    var dataArray: NSMutableArray!
    
    private var STOPY:CGFloat!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        //configSeparator()
        configTableview()
    }
    
    override init(frame: CGRect, style: UITableViewStyle) {
        super.init(frame: frame, style: style)
        //configSeparator()
        STOPY = frame.origin.y
        configTableview()
    }
    
    func configTableview() -> Void {
        self.separatorStyle = .none
        self.delegate = self
        self.dataSource = self;
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        delog("\(scrollView.contentOffset)")
       
        if scrollView.contentOffset.y > CGFloat(0) {
            //MARK: 在上方
            if (STOPY - self.y) > 0 {
                //向上
                self.y = STOPY - scrollView.contentOffset.y
                if self.y <= kStatusH {
                    self.y = kStatusH
                }
            }
            
            //向下
            
        }
        else {
            //MARK: 在下方
            //向上
            

            //向下
            
        }
        
//            self.y = STOPY - scrollView.contentOffset.y
//            if self.y <= kStatusH {
//                self.y = kStatusH
////                STOPY = kStatusH
//            }
//            if self.y >= HeightBanner {
//                self.y = HeightBanner
////                STOPY = HeightBanner
//            }
        
        
    }
    
    func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
//        if ((kStatusH <= self.y) && (self.y <= HeightBanner)) {
            STOPY = scrollView.contentOffset.y
//        }
        
    }
    
    
    //MARK:-
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 8
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let dequeueID = String.init(format: "homeItemCellId_%i", arguments: [indexPath.row])
        var cell = tableView.dequeueReusableCell(withIdentifier: dequeueID)
        if nil == cell {
            cell = ItemCell.init(style: .default, reuseIdentifier: dequeueID)
        }
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //delog("\(indexPath)")
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 330
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 100
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView.init(frame: CGRect(x: 0, y: 0, width: kScreenW, height: 20))
        view.backgroundColor = .red
        return view
    }
    
    
}
