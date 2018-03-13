//
//  LTCControl.swift
//  GreateSmart
//
//  Created by hailin on 2018/3/13.
//  Copyright © 2018年 Jerod. All rights reserved.
//

import UIKit

class LTCControl: BaseControl {
    
    var view: LTCView!
    var model:LTCModel!
    
    
    override init() {
        super.init()
        view = LTCView.loadFromXIB()
    }
    
//    init(viewFrame:CGRect) {
//        super.init()
//        view = LTCView.loadFromXIB()
//
//        view.frame = viewFrame
//    }
    
    func handleData(typeInfo:Any!) -> LTCModel {
        model = LTCModel.dataReader(typeInfo:typeInfo)
        view.image(model.data.imageUrl)
        return model
    }

    

}
