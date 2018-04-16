//
//  AddToCartControl.swift
//  GreateSmart
//
//  Created by hailin on 2018/3/26.
//  Copyright © 2018年 Jerod. All rights reserved.
//

import UIKit

class AddToCartControl: BaseControl, UITableViewDelegate, UITableViewDataSource {
    
    /** 加入购物车视图 */
    var view : AddToCartView?
    /** 规格control */
    private var speciColectCtl : SpecificationColectionControl?
    /** 数据存储容器 */
    private var speciDataArr : NSArray = []
    /** 数量加减 */
    private var stepView : JIStepper?
    
    override init() {
        super.init()
        
        /* 先加载数据 */
        speciDataArr = ["asdfkkknqwl","fhgjghj","asdfkkw54yr5knqwl","1342546345","xvbdgfh","qwetreh","sdfh","ij';j","wtseghs","aaaa","sssss","ddddd"]
        
        view = AddToCartView.loadFromXIB()
        view?.frameXib = CGRect.init(x: 0, y: kScreenH, width: kScreenW, height: kScreenH)
        view?.configTableView.delegate = self
        view?.configTableView.dataSource = self
        view?.sureBtnCB = {
            /* 确定按钮的回调 */
            //delog(self.stepView?.number)
            
        }
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCell(withIdentifier: String.init(format: "addtocartConfigCellId"+"%d", indexPath.row))
        let configView = AddcartGoodConfigView.loadFromXIB()
        
        if cell == nil
        {
            cell = UITableViewCell.init(style: .default, reuseIdentifier: String.init(format: "addtocartConfigCellId"+"%d", indexPath.row))
            cell?.selectionStyle = .none
            configView.frameXib = cell!.bounds
            cell!.addSubview(configView)
            
            //MARK: 规格
            if indexPath.row == 0 {
                configView.nameLab.text = "规格"
                
                speciColectCtl = SpecificationColectionControl.init(
                    frame: CGRect.init(x: 0, y: 30 /*标题底部y*/, width: kScreenW, height: getColectHeightWith(array: speciDataArr)),
                    InteritemSpacing: 10,
                    LineSpacing: 10,
                    contentInset: UIEdgeInsets.init(top: 10, left: 20, bottom: 10, right: 20))
                speciColectCtl!.itemsArray = speciDataArr
                
                configView.addSubview(speciColectCtl!.view!)
            }
            
            //MARK:数量
            if indexPath.row == 1 {
                configView.nameLab.text = "数量"
                stepView = JIStepper.init(frame: CGRect.init(x: 20, y: configView.nameLab.bottom + 10, width: 146, height: 25))
                
                configView.addSubview(stepView!)
            }
            
        }
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.item == 0 {
            return 10 /* 上偏移10 */ + getColectHeightWith(array: speciDataArr) + 10 /* 下偏移10 */ + 30 /* 标题的高度 */
        }
        if indexPath.item == 1 {
            return 30 /*标题*/ + 10 /*顶部距离*/ + 25 /*stepView的高度*/ + 20 /*底部距离*/
        }
        return 0
    }
    
    func getColectHeightWith(array:NSArray) -> CGFloat {
        if array.count == 0  {
            return 10 + 10 /* 上下偏移10 */
        }
        return (CGFloat((array.count+1)/2) * CGFloat(25+10))  /* 单个cell高度25,竖直间距10 */
    }
    
    
}
