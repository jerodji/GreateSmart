//
//  HotSaleControl.swift
//  GreateSmart
//
//  Created by hailin on 2018/3/13.
//  Copyright © 2018年 Jerod. All rights reserved.
//

import UIKit

class HotSaleControl: BaseControl,iCarouselDelegate, iCarouselDataSource {

    var view : HotSaleView?
    var model: HotSaleModel?
//    private var rect:CGRect!
    
    override init() {
        super.init()
    }
    
    
    func handleData(typeInfo:Any!) -> HotSaleModel {
        model = HotSaleModel.dataReader(typeInfo: typeInfo)
        return model!
    }
    
    func initView(frame:CGRect) -> Void {
//        rect = frame
        view = HotSaleView.init(frame: frame)
        view!.delegate = self
        view!.dataSource = self
    }
    
    func numberOfItems(in carousel: iCarousel) -> Int {
        return model!.data.block.count
    }
    
    func carousel(_ carousel: iCarousel, viewForItemAt index: Int, reusing view: UIView?) -> UIView {
        let mod = model!.data.block[index] as! HotSaleBlockElemModel
        let cell = HotSaleCell.loadFromXIB()
//        cell.setFrame(rect)
        cell.imageView.kf.setImage(with: URL.init(string: mod.itemTitleImage))
        cell.priceLabel.text = mod.price + " " + mod.originalPrice
        cell.nameLabel.text = mod.itemName
        cell.decsLabel.text = mod.publicity
        
        return cell
    }
    
}
