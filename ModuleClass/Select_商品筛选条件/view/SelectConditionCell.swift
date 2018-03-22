//
//  SelectConditionCell.swift
//  GreateSmart
//
//  Created by hailin on 2018/3/22.
//  Copyright © 2018年 Jerod. All rights reserved.
//

import UIKit

//MARK:SelecBtnsView
/**
 按钮view
 */
class SelecBtnsView: UIView {
    
    var rectFrame : CGRect!
    
    /* 每个按钮的尺寸 */
    private let btnWd = CGFloat((kScreenW-15-15-10*3)/4)
    private let btnHg = CGFloat(25)
    
    /* 水平间距,竖直间距 */
    private let HerDis = CGFloat(10)
    private let VerDis = CGFloat(10)
    
    /* 整体 上左下右 的距离 */
    private let EdgeTop    = CGFloat(10)
    private let EdgeLeft   = CGFloat(15)
    private let EdgeBottom = CGFloat(10)
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
    }
    
    /**
     布局按钮
     */
    func configSubveiws(SubMenuArray:NSArray, section:Int, row:Int) -> Void {
        
        var numbers = 0
        
        for index in 0...SubMenuArray.count-1 {
            
            numbers += 1
            let btn = UIButton.init(frame: CGRect.init(x: EdgeLeft + (btnWd+HerDis)*CGFloat(index%4), y: EdgeTop + (btnHg+VerDis)*CGFloat(index/4), width: btnWd, height: btnHg))
            btn.backgroundColor = UIColor.RGB(236, 236, 236)
            btn.layer.cornerRadius = 5
            btn.tag = section*10000 + row*100 + index
            btn.addTarget(self, action: #selector(btnAction(button:)), for: UIControlEvents.touchUpInside)
            self.addSubview(btn)

        }
    }
    
    /**
     计算按钮view的高度
     */
    func compHeight(list:NSArray, section:Int, row:Int) -> CGFloat {
        
        let line = CGFloat((list.count-1)/4 + 1)
        let lineHeight = CGFloat(btnHg + VerDis)
        
        return CGFloat(EdgeTop + line*lineHeight + EdgeBottom)
    }
    
    @objc func btnAction(button:UIButton) -> Void {
        delog("tag \(button.tag)")
    }
    
}

//MARK:- SelectConditionCell

class SelectConditionCell: UITableViewCell {

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupSubviews()
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupSubviews()
    }
    
    func setupSubviews() -> Void {
        //self.backgroundColor = .blue
    }
    
    /**
     布局cell
     */
    func setModelWithArray(_ menuList:NSArray, section:Int, row:Int) -> Void {
        
        if menuList[0] is SubMenuModel {
            let btnsView = SelecBtnsView() /* SubMenuModel */
            let h = btnsView.compHeight(list: menuList, section: section, row: row)
            btnsView.setFrame(CGRect.init(x: 0, y: 0, width: kScreenW, height: h))
            btnsView.configSubveiws(SubMenuArray:menuList, section: section, row: row)
            self.contentView.addSubview(btnsView)
        }
        
        
        
        
//        for i in 0...menuList.count-1 {
//
//            let model = menuList.object(at: i)
//            if model is SelectConditionModel {
//                let mod = model as! SelectConditionModel /* SelectConditionModel */
//
//                let secondHeadBtn = SelecHeaderButton.init(frame: CGRect.init(x: 0, y: 0, width: kScreenW, height: 70))
//                secondHeadBtn.backgroundColor = .yellow
//                self.addSubview(secondHeadBtn)
//
//                let btnsView = SelecBtnsView()
//                let h = btnsView.compHeight(list: mod.subMenuList, section: section, row: row)
//                btnsView.setFrame(CGRect.init(x: 0, y: 70, width: kScreenW, height: h))
//                btnsView.configSubveiws(SubMenuArray: mod.subMenuList, section: section, row: row)
//                self.addSubview(btnsView)
//
//            } else {
//
//                let btnsView = SelecBtnsView() /* SubMenuModel */
//
//                let h = btnsView.compHeight(list: menuList, section: section, row: row)
//                btnsView.setFrame(CGRect.init(x: 0, y: 0, width: kScreenW, height: h))
//                btnsView.configSubveiws(SubMenuArray:menuList, section: section, row: row)
//                self.addSubview(btnsView)
//            }
//        }
        
    }
    

}
