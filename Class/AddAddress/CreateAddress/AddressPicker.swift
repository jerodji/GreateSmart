//
//  AddressPicker.swift
//  GreateSmart
//
//  Created by hailin on 2018/4/10.
//  Copyright © 2018年 Jerod. All rights reserved.
//

import UIKit



class AddressPicker: BaseControl,UIPickerViewDelegate,UIPickerViewDataSource {

    var scene : UIViewController?
    
    ///省
    var view : UIPickerView?
    
    override init() {
        super.init()
    }
    
    func initView(frame:CGRect) -> Void {
        
        view = UIPickerView.init(frame: CGRect(x: frame.origin.x, y: kScreenH, width: frame.size.width, height: frame.size.height))
        view!.backgroundColor = UIColor.white
        view!.delegate = self
        view!.dataSource = self
        
        UIView.animate(withDuration: 0.3) {
            self.view!.origin = CGPoint(x: 0, y: frame.origin.y)
        }
        
    }
    
    
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 20
    }
    
}
