//
//  SelectConditionCell.swift
//  GreateSmart
//
//  Created by hailin on 2018/3/22.
//  Copyright © 2018年 Jerod. All rights reserved.
//

import UIKit

class SelectConditionCell: UITableViewCell {
    
    /** 按钮view */
    var btnsView : SelecBtnsView?
    
    typealias SecondHeadBLK = () -> ()
    /// 标题按钮的点击回调
    var cellHeadBtnClickCB : SecondHeadBLK?
    
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
        
        if menuList[0] is SubMenuModel
        {
            /* SubMenuModel */
            btnsView = SelecBtnsView()
            let h = btnsView!.compHeight(list: menuList, section: section, row: row)
            btnsView!.setFrame(CGRect.init(x: 0, y: 0, width: kScreenW, height: h))
            btnsView!.configSubveiws(SubMenuArray:menuList, section: section, row: row)
            self.contentView.addSubview(btnsView!)
        }
        else
        {
            /* SelectConditionModel */
            let mod = menuList[row] as! SelectConditionModel
            
            let secondHeadBtn = SelecHeaderButton.init(frame: CGRect.init(x: 30, y: 0, width: kScreenW-60, height: 70))
            //secondHeadBtn.setImage(UIImage.init(named: "<#T##String#>"), for: .normal)
            secondHeadBtn.setImage(UIImage.init(named: "xia2"), for: .normal)
            secondHeadBtn.setTitle(mod.name, for: .normal)
            secondHeadBtn.setTitleColor(UIColor.black, for: .normal)
            secondHeadBtn.titleLabel?.font = UIFont.systemFont(ofSize: 15)
            secondHeadBtn.addTarget(self, action: #selector(cellHeadbtnClickAction), for: .touchUpInside)
            self.addSubview(secondHeadBtn)
            
            btnsView = SelecBtnsView()
            let h = btnsView!.compHeight(list: mod.subMenuList, section: section, row: row)
            btnsView!.setFrame(CGRect.init(x: 0, y: 70, width: kScreenW, height: h))
            btnsView!.configSubveiws(SubMenuArray: mod.subMenuList, section: section, row: row)
            self.addSubview(btnsView!)
        }
        
    }
    
    @objc func cellHeadbtnClickAction() -> Void {
        if cellHeadBtnClickCB != nil {
            cellHeadBtnClickCB!()
        }
    }
    

}
