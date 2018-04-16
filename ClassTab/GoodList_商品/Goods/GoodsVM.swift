//
//  LeftGoodsVM.swift
//  GreateSmart
//
//  Created by Jerod on 2018/4/13.
//  Copyright © 2018年 Jerod. All rights reserved.
//

import UIKit

/**
 * viewModel 业务层逻辑
 */

class GoodsViewModel: NSObject {
    
    var letfList : Array<GoodModel> = []
    var rightList : Array<GoodModel> = []
    
    private var pageNumber : Int = 1
    private var pageSize : Int = 10
    
    
    override init() {
        super.init()
    }
    
    //加载初始数据
    func loadItemList(complete:@escaping ()->() ) -> Void {
        
        weak var wkself = self
        
        NetHttp.ins.loadItemList(pageNo: 1, pageSize: 20) { (res) in
            
            if res is NSDictionary
            {
                let dict = res as! NSDictionary
                let arr : Array = dict.object(forKey: "list") as? Array ?? []
                
                //左右数据分流
                for i in 0...arr.count-1
                {
                    let objModel = GoodModel.modelFromDict(arr[i] as! NSDictionary)
                    if i%2 == 0 {
                        wkself?.letfList.append(objModel)
                    } else {
                        wkself?.rightList.append(objModel)
                    }
                }
            }
            
            wkself?.pageNumber += 1
            complete()
        }
        
    }
    
    //刷新加载更多数据
    func loadMoreData(complete: @escaping ()->() ) -> Void {
        
        weak var wkself = self
        
        NetHttp.ins.loadItemList(pageNo: pageNumber, pageSize: pageSize) { (res) in
            
            if res is NSDictionary
            {
                let dict = res as! NSDictionary
                let arr : Array = dict.object(forKey: "list") as? Array ?? []
                
                //左右数据分流
                for i in 0...arr.count-1
                {
                    let objModel = GoodModel.modelFromDict(arr[i] as! NSDictionary)
                    if i%2 == 0 {
                        wkself?.letfList.append(objModel)
                    } else {
                        wkself?.rightList.append(objModel)
                    }
                }
            }
            
            wkself?.pageNumber += 1
            complete()
        }
    }
    
    
    func clickSales() -> Void {
        
    }
    
    func clickPrice() -> Void {
        
    }
    
    func clickNewGood() -> Void {
        
    }
    
    
}
