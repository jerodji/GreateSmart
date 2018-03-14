//
//  HotSaleControl.swift
//  GreateSmart
//
//  Created by hailin on 2018/3/13.
//  Copyright © 2018年 Jerod. All rights reserved.
//

import UIKit

class HotSaleControl: BaseControl,iCarouselDelegate, iCarouselDataSource {

    var view : HotSaleView!
    var model: HotSaleModel!
    
    override init() {
        super.init()
    }
    
    
    func handleData(typeInfo:Any!) -> HotSaleModel {
        model = HotSaleModel.dataReader(typeInfo: typeInfo)
        return model
    }
    
    func initView(frame:CGRect) -> Void {
        view = HotSaleView.init(frame: frame)
        view.delegate = self
        view.dataSource = self
    }
    
    func numberOfItems(in carousel: iCarousel) -> Int {
        return model.data.block.count
    }
    
    func carousel(_ carousel: iCarousel, viewForItemAt index: Int, reusing view: UIView?) -> UIView {
        <#code#>
    }
    
}
