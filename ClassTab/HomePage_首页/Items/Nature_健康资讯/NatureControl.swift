//
//  NatureControl.swift
//  GreateSmart
//
//  Created by hailin on 2018/3/13.
//  Copyright © 2018年 Jerod. All rights reserved.
//

import UIKit

class NatureControl: BaseControl {
    
    var view :NatureView!
    var model:NatureModel!
    private var cellWidth : CGFloat = kScreenW - itemcellLeft - itemcellRight
    
    override init() {
        super.init()
    }
    
//    init(frame:CGRect) {
//        super.init()
//    }
    
    func handleData(typeInfo:Any!) -> NatureModel {
        model = NatureModel.dataReader(typeInfo: typeInfo)
        return model
    }
    
    func setViewWithFrame(_ frame:CGRect) -> Void {
        view = NatureView.init(frame: frame)
        cellWidth = frame.size.width - itemcellLeft - itemcellRight
    }
    
    func setCells(natureModel:NatureModel) -> Void {
     
        for i in 0...natureModel.data.block.count-1 {
            let cellView = NatureCell.loadFromXIB()
            cellView.frame = CGRect.init(x: itemcellLeft, y: itemcellTop + CGFloat(i) * (elemHeightNature + distanceNature), width: cellWidth, height: elemHeightNature)
            
            cellView.imgView.jj_setImage(url: (model.data.block[i] as! NatureBlockElemModel).img)
            cellView.titleLabel.text = (model.data.block[i] as! NatureBlockElemModel).title
            
            view.addSubview(cellView)
        }

    }
    
}
