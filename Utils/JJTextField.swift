//
//  JJTextField.swift
//  GreateSmart
//
//  Created by hailin on 2018/2/27.
//  Copyright © 2018年 Jerod. All rights reserved.
//

import UIKit

class JJTextField: UITextField,UITextFieldDelegate {
    
    // return 回调的block
    typealias ReturnBLK = (_ text:String) -> ()
    var returnCB: ReturnBLK?
    
    
    private let leftImageW = CGFloat(18)
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupTextfield()
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupTextfield()
    }
    
    func setupTextfield() -> () {
        self.delegate = self
        self.borderStyle = UITextBorderStyle.roundedRect
        self.backgroundColor = UIColor.init(hex: "F1F1F1")
        self.returnKeyType = UIReturnKeyType.search
        /* 右边清除按钮
         never 从不
         whileEditing 编辑时出现清除按钮
         unlessEditing 编辑时不出现，编辑后才出现清除按钮
         always 一直显示清除按钮 */
        self.clearButtonMode = UITextFieldViewMode.whileEditing  //编辑时出现清除按钮
        /* 左边的搜索图标 */
        let leftview = UIImageView(image: UIImage(named: "ss"))
        leftview.frame = CGRect.init(x: 10, y: 0, width: leftImageW, height: leftImageW)
        self.leftViewMode = UITextFieldViewMode.always
        self.leftView = leftview
        /* 光标的颜色 */
        self.tintColor = UIColor.black
    }
    
    //return事件
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        returnCB?(textField.text!)
        return true
    }
    
    //复写 设置leftView的位置
    override func leftViewRect(forBounds bounds: CGRect) -> CGRect {
        var rect = super.leftViewRect(forBounds: bounds)
        rect.origin.x += 10
        return rect
    }

}
