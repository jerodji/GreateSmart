//
//  SelecBtnsView.swift
//  GreateSmart
//
//  Created by hailin on 2018/3/23.
//  Copyright © 2018年 Jerod. All rights reserved.
//

import UIKit

/**
 按钮view
 */
class SelecBtnsView: UIView {
    
    var rectFrame : CGRect!
    
    /* 每个按钮的尺寸 */
    private let btnWd = CGFloat((kScreenW-15-15-10*3)/4)
    private let btnHg = CGFloat(25)
    
    /* 水平间距,竖直间距 */
    private let HerDis = CGFloat(5)
    private let VerDis = CGFloat(10)
    
    /* 整体 上左下右 的距离 */
    private let EdgeTop    = CGFloat(10)
    private let EdgeLeft   = CGFloat(15)
    private let EdgeBottom = CGFloat(5)
    private let EdgeRight  = CGFloat(15)
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        rectFrame = frame
        self.layer.masksToBounds = true
    }
    
    func setFrame(_ frame : CGRect) -> Void {
        rectFrame = frame
        self.frame = rectFrame
        //self.backgroundColor = .black
    }
    
    /**
     布局按钮
     */
    func configSubveiws(SubMenuArray:NSArray, section:Int, row:Int) -> Void {
        
        var numbers = 0
        
        for index in 0...SubMenuArray.count-1 {
            numbers += 1
            let model = SubMenuArray[index] as! SubMenuModel
            
            let btn = UIButton.init(frame: CGRect.init(x: EdgeLeft + (btnWd+HerDis)*CGFloat(index%4), y: EdgeTop + (btnHg+VerDis)*CGFloat(index/4), width: btnWd, height: btnHg))
            btn.backgroundColor = UIColor.RGB(236, 236, 236)
            btn.layer.cornerRadius = 5
            btn.addTarget(self, action: #selector(btnAction(button:)), for: UIControlEvents.touchUpInside)
            self.addSubview(btn)
            //2种方案
            //btn.tag = section*10000 + row*100 + index
            /* 设置tag
             127703 / 10000 = 12
             ((127703 % 10000) = 7703) / 100 = 77
             ( 7703 % 100 ) = 3
             */
            
            btn.params = ["s":section,"r":row,"i":index]
            btn.setTitle(model.name, for: .normal)
            btn.setTitleColor(UIColor.RGB(183, 183, 183), for: .normal)
            btn.titleLabel?.font = UIFont.systemFont(ofSize: 12)
            
        }
    }
    
    @objc func btnAction(button:UIButton) -> Void {
        //delog("tag \(button.tag)")
        delog("\(button.titleLabel?.text) , \( button.params)")
    }
    
    func readIndexPath() -> Void {
        
    }
    
    /**
     计算按钮view的高度
     */
    func compHeight(list:NSArray, section:Int, row:Int) -> CGFloat {
        let line = CGFloat((list.count-1)/4 + 1)
        let lineHeight = CGFloat(btnHg + VerDis)
        return CGFloat(EdgeTop + line*lineHeight + EdgeBottom)
    }
    
}

