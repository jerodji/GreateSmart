//
//  GoodListVC.swift
//  GreateSmart
//
//  Created by hailin on 2018/2/24.
//  Copyright © 2018年 Jerod. All rights reserved.
//

import UIKit

let heightSortView = CGFloat(40)

/**
 *  view 视图层逻辑
 */

class GoodListVC: BaseUIViewController {

    var sortView : SortingView?
    var leftView : LeftGoodsView?
    var rightView: RightGoodsView?
    var viewModel : GoodsViewModel?
    
    override func loadView() {
        super.loadView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.naviBar.titleLab.text = "全部商品"
        self.naviBar.leftItemBtn.isHidden = true
        self.naviBar.rightItemBtn.isHidden = true
        
        weak var wkself = self
        
        sortView = SortingView.loadFromXIB()
        sortView?.clickCB = { (tag) in
            switch tag {
                case 0: do {
                    delog("点击了 全部 按钮")
                };break
                case 1: do {
                    delog("点击了 销量 按钮")
                    wkself?.viewModel?.clickSales()
                };break
                case 2: do {
                    delog("点击了 价格 按钮")
                    wkself?.viewModel?.clickPrice()
                };break
                case 3: do {
                    delog("点击了 新品 按钮")
                    wkself?.viewModel?.clickNewGood()
                };break
                case 4: do {
                     delog("点击了 筛选 按钮")
                    let selecVC = SelectConditionVC()
                    self.navigationController?.pushViewController(selecVC, animated: true)
                };break
               
            default:
                delog("1")
            }
        }
        
        
        let Y = kNaviH+heightSortView+4
        let W = kScreenW/2
        let H = kScreenH-kNaviH-kTabbarH-heightSortView-4
        sortView?.frame = CGRect.init(x: 0, y: kNaviH, width: kScreenW, height: heightSortView)
        leftView = LeftGoodsView.init(frame:  CGRect(x: 0, y:Y , width:W , height:H))
        rightView = RightGoodsView.init(frame: CGRect(x: W, y: Y, width: W, height: H))
        self.view.addSubview(sortView!)
        self.view.addSubview(leftView!)
        self.view.addSubview(rightView!)
        
        leftView?.showsVerticalScrollIndicator = false
        rightView?.showsVerticalScrollIndicator = false
        
        viewModel = GoodsViewModel.init()
        viewModel!.loadItemList(complete: {
            //wkself?.reloadData()
            wkself?.leftView?.viewModel = wkself?.viewModel
            wkself?.leftView?.reloadData()
            wkself?.rightView?.viewModel = wkself?.viewModel
            wkself?.rightView?.reloadData()
        })
        
        leftView?.mj_footer = MJRefreshBackNormalFooter.init(refreshingTarget: self, refreshingAction: #selector(loadMoreLeft))
        rightView?.mj_footer = MJRefreshBackNormalFooter.init(refreshingTarget: self, refreshingAction: #selector(loadMoreRight))
    }
    
    @objc func loadMoreLeft()->() {
        weak var wkself = self
        viewModel?.loadMoreData(complete: {
            wkself?.leftView?.reloadData()
            wkself?.rightView?.reloadData()
            wkself?.leftView?.mj_footer.endRefreshingWithNoMoreData()
        })
    }
    
    @objc func loadMoreRight()->() {
        weak var wkself = self
        viewModel?.loadMoreData(complete: {
            wkself?.leftView?.reloadData()
            wkself?.rightView?.reloadData()
            wkself?.rightView?.mj_footer.endRefreshingWithNoMoreData()
        })
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
