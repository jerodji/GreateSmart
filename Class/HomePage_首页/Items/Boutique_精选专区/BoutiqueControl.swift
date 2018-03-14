//
//  BoutiqueControl.swift
//  GreateSmart
//
//  Created by hailin on 2018/3/13.
//  Copyright © 2018年 Jerod. All rights reserved.
//

import UIKit

class BoutiqueControl: BaseControl {

    var view : BoutiqueView!
    var model: BoutiqueModel!
    
    override init() {
        super.init()
    }
    
    func setView(frame:CGRect) -> Void {
        view = BoutiqueView.init(frame: frame, count: model.data.block.count)
        
        if model == nil {
            delog("需要实现 handleData")
        }
        view.setModel(model: model)
    }
    
    func handleData(typeInfo:Any!) -> BoutiqueModel {
        
        model = BoutiqueModel.dataReader(typeInfo: typeInfo)
        //view.setModel(model: model)
        
        return model
    }
    
    
}
