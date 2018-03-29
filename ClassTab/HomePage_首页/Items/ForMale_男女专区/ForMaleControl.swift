//
//  ForMaleControl.swift
//  GreateSmart
//
//  Created by hailin on 2018/3/13.
//  Copyright © 2018年 Jerod. All rights reserved.
//

import UIKit

class ForMaleControl: BaseControl {

    var view: ForMaleView!
    var model: ForMaleModel!
    
    override init() {
        super.init()
        view = ForMaleView.loadFromXIB()
    }
    
//    init(viewFrame:CGRect) {
//        super.init()
//        view = ForMaleView.loadFromXIB()
//        view.frame = viewFrame
//    }
    
    func handleData(typeInfo:Any!) -> ForMaleModel {
        model = ForMaleModel.dataReader(typeInfo: typeInfo)
        
        view.leftImgView.kf.setImage(with: URL.init(string: (model.data.block[0] as! ForMaleBlockElemModel).imageUrl))
        view.rightImgView.kf.setImage(with: URL.init(string: (model.data.block[1] as! ForMaleBlockElemModel).imageUrl))
        
        return model
    }
    
}
