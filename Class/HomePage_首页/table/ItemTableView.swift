//
//  HomeTableView.swift
//  GreateSmart
//
//  Created by hailin on 2018/3/5.
//  Copyright © 2018年 Jerod. All rights reserved.
//

import UIKit

class ItemTableView: BaseUITableView,UITableViewDelegate,UITableViewDataSource {
    
    var dataArray: NSMutableArray!
    var banner  : BannerView!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configTableview()
    }
    
    override init(frame: CGRect, style: UITableViewStyle) {
        super.init(frame: frame, style: style)
        //configSeparator()
        configTableview()
    }
    
    init(frame: CGRect) {
        super.init(frame: frame, style: UITableViewStyle.grouped)
        configTableview()
    }
    
    func configTableview() -> Void {
        
        banner = BannerView.init(frame: CGRect(x: 0, y: -ItemHeight_banner, width: kScreenW, height: ItemHeight_banner))
        banner.layer.zPosition = -1 /* 将view插入到队列最前端 */
        self.addSubview(banner)
        self.contentInset = UIEdgeInsetsMake(ItemHeight_banner, 0, 0, 0)
        
        self.separatorStyle = .none
//        self.showsVerticalScrollIndicator = false
//        self.showsHorizontalScrollIndicator = false
        self.delegate = self
        self.dataSource = self
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        delog("\(scrollView.contentOffset.y)")
        banner.y = scrollView.contentOffset.y
        let offsetY = scrollView.contentOffset.y + ItemHeight_banner
        if offsetY < 0 {
            banner.frame = CGRect.init(x: 0, y: scrollView.contentOffset.y, width: kScreenW, height: ItemHeight_banner-offsetY)
        }
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
        delog("\(indexPath)")
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.01
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView.init(frame: CGRect(x: 0, y: 0, width: kScreenW, height: 20))
        view.backgroundColor = .red
        return view
    }
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return nil
    }
    
    
}
