//
//  HomeTableView.swift
//  GreateSmart
//
//  Created by hailin on 2018/3/5.
//  Copyright © 2018年 Jerod. All rights reserved.
//

import UIKit

class ItemTableView: BaseUITableView /* ,UITableViewDelegate,UITableViewDataSource  */{
    
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
        
        self.backgroundColor = UIColor.white
        
        banner = BannerView.init(frame: CGRect(x: 0, y: -heightBanner, width: kScreenW, height: heightBanner))
        banner.layer.zPosition = -1 /* 将view插入到队列最前端 */
        self.addSubview(banner)
    }
    
}
