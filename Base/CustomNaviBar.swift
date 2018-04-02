//
//  CustomNaviBar.swift
//  GreateSmart
//
//  Created by hailin on 2018/2/26.
//  Copyright © 2018年 Jerod. All rights reserved.
//

import UIKit

class BackButton: UIButton {
    override func imageRect(forContentRect contentRect: CGRect) -> CGRect {
        return CGRect.init(x: 15, y: (44-18)/2, width: 10, height: 18)
    }
}

class CustomNaviBar: UIView {
    
    let statusbar = UIView()
    let leftItemBtn = BackButton()
    let rightItemBtn = UIButton()
    let titleLab = UILabel()
    let line = UIView()
    
    private var _jj_backgroundColor : UIColor?
    var jj_backgroundColor : UIColor? {
        get {
            return _jj_backgroundColor
        }
        set {
            _jj_backgroundColor = newValue
            self.backgroundColor = _jj_backgroundColor
            self.line.backgroundColor = _jj_backgroundColor
        }
    }
    
    
    //声明闭包
    typealias LEFTBLOCK = () -> ()
    var leftCallback: LEFTBLOCK?
    
    typealias RIGHTBLOCK = ()->()
    var rightCallback: RIGHTBLOCK?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configNaviBar()
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        configNaviBar()
    }
    
    func configNaviBar() -> () {
        
        let dis = CGFloat(0)
        let itemW = CGFloat(44)
        
        statusbar.frame    = CGRect.init(x: 0, y: 0, width: kScreenW, height: kStatusH)
        leftItemBtn.frame  = CGRect.init(x: dis, y: kStatusH, width: itemW, height: kNavi44)
        rightItemBtn.frame = CGRect.init(x: kScreenW-dis-itemW, y: kStatusH, width: itemW, height: kNavi44)
        titleLab.frame     = CGRect.init(x: leftItemBtn.right, y: kStatusH, width: rightItemBtn.left - leftItemBtn.right, height: kNavi44)
        line.frame         = CGRect.init(x: 0, y: kNaviH-1, width: kScreenW, height: 1)
        
        self.backgroundColor         = UIColor.white
        statusbar.backgroundColor    = UIColor.white
        leftItemBtn.backgroundColor  = UIColor.clear
        rightItemBtn.backgroundColor = UIColor.clear
        titleLab.backgroundColor     = UIColor.clear
        line.backgroundColor         = UIColor.init(hex: "F1F1F1")
        
        titleLab.textAlignment = NSTextAlignment.center
        titleLab.textColor     = UIColor.black
        leftItemBtn.setImage(UIImage.init(named: "fh"), for: UIControlState.normal)
        leftItemBtn.addTarget(self, action: #selector(leftAction), for: UIControlEvents.touchUpInside)
        rightItemBtn.addTarget(self, action: #selector(rightAction), for: UIControlEvents.touchUpInside)
        
        rightItemBtn.setTitleColor(UIColor.RGB(39, 39, 39), for: .normal)
        
        self.addSubview(statusbar)
        self.addSubview(leftItemBtn)
        self.addSubview(rightItemBtn)
        self.addSubview(titleLab)
        self.addSubview(line)
    }
    
    @objc func leftAction() {
        if (leftCallback != nil) {
            leftCallback!()
        }
    }
    
    @objc func rightAction() {
        if rightCallback != nil {
            rightCallback!()
        }
    }
    
//    func jj_backgroundColor(_ color:UIColor) -> Void {
//        self.backgroundColor = color
//        self.line.backgroundColor = color
//    }
    
}
