//
//  SelectConditionModel.swift
//  GreateSmart
//
//  Created by hailin on 2018/3/21.
//  Copyright © 2018年 Jerod. All rights reserved.
//

import UIKit


/**
 
 "callBack": "store_878979239"
 
 "callBack": 2
 
 "callBack": {
 "minPrice": 0,
 "maxPrice": 100
 }
 
 */

class SubMenuModel: BaseModel {
    
    @objc var name : String = ""
    @objc var callBack : Any?
    
}



class SelectConditionModel: BaseModel {
    
    @objc var name : String = ""
    @objc var subMenuList : NSMutableArray = []
    @objc var layer : Int = 0
    
    func dataReader(_ array:NSArray) -> NSArray {
        let lis = readNextModel(data: array)
        return lis
    }
    
    
    func getNewConditionModel(dict:NSDictionary) -> SelectConditionModel {
        let model = SelectConditionModel()
        model.name = dict.object(forKey: "name") as! String
        model.subMenuList = readNextModel(data: dict.object(forKey: "subMenuList") as! NSArray)
        return model
    }
    
    func getNewSubMenuModel(dict:NSDictionary) -> SubMenuModel {
        let model = SubMenuModel()
        model.name = dict.object(forKey: "name") as! String
        model.callBack = dict.object(forKey: "callBack")
        return model
    }
    
    func readNextModel(data:NSArray) -> NSMutableArray {
    
        let list : NSMutableArray = []
        
        for obj in data {
            
            if obj is NSDictionary {
                let dict = obj as! NSDictionary
                
                for key in dict.allKeys {
                    if key as! String == "subMenuList" {
                        
                        let model = getNewConditionModel(dict: dict)
                        list.add(model)
                    }
                    else if key as! String == "callBack" {
                        
                        let m = getNewSubMenuModel(dict: dict)
                        list.add(m)
                    }
                    
                }
            }
            
        }
    
        return list
    }
    
}


