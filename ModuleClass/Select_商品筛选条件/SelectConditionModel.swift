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
//    @objc var layer : Int = 0
    
    func dataReader(_ array:NSArray) -> NSArray {
        let lis = readNextModel(data: array)
        return lis
    }
    
    /**
     递归解析
     */
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
    
    //MARK:-
    /**
     按钮view的高度
     */
    class func heigtForList(_ list:NSArray, section: Int, row: Int) -> CGFloat {

        let tempView = SelecBtnsView()
        let h = tempView.compHeight(list: list, section: section, row: 0)
        return h
    }
    
    /**
     全部展开状态下,所有的高度集合,以字典形式返回
     [key] - section
     [value] - 数组(元素为高度),每个元素与section下的cell对应
     */
    class func getfullHeightsWithArray(_ list:NSArray) -> NSDictionary {
        
        let dict : NSMutableDictionary = [:]
        
        for index in 0...list.count-1 {
            
            //var arr : NSMutableArray = []
            let model1 = list.object(at: index) as! SelectConditionModel
            
            if model1.subMenuList[0] is SubMenuModel {
                
                let arr : NSMutableArray = []
                let h = heigtForList(model1.subMenuList, section: index, row: -1)
                arr.add(h)
                dict.setObject(arr, forKey: index as NSCopying)
            }
            else {
                
                let arr : NSMutableArray = []
                for i in 0...model1.subMenuList.count-1 {
                    
                    let mode2 = model1.subMenuList[i] as! SelectConditionModel
                    if mode2.subMenuList[0] is SubMenuModel {
                        let h = heigtForList(mode2.subMenuList, section: index, row: i)
                        arr.add(h + 70)
                    }
                }
                
                dict.setObject(arr, forKey: index as NSCopying)
            }
            
        }
        
        return dict
        
//        return [
//            0 : [200],
//            1 : [70,70],
//            2 : [66]
//        ]
        
    }
    
    /**
     所有分类的初始展开状态 - 全部默认为false
     */
    class func getfullIsZKStatus(_ list:NSArray) -> NSDictionary  {
        
        let dict : NSMutableDictionary = [:]

        for index in 0...list.count-1 {
            let obj = list[index]
            if obj is SelectConditionModel { /* 最外面一层 */
                let arr = menuListHeight(list: (obj as! SelectConditionModel).subMenuList)
                dict.setObject(arr, forKey: index as NSCopying)
            }
        }
        
        return dict
        
//        return [
//            0 : [false],
//            1 : [false,false],
//            2 : [false]
//        ]
    }
    
    class func menuListHeight(list: NSArray) -> NSMutableArray {
        
        var arr : NSMutableArray = []
        if list[0] is SelectConditionModel {
            // 2层
            arr = [false,false]
        } else {
            // 1层
            arr = [false]
        }
        
        return arr
    }
    
}


//MARK:- 模拟数据
/**
 模拟数据
 */
let testSelectConditionData : String = "[\n" +
    "    {\n" +
    "        \"name\": \"品牌\",\n" +
    "        \"subMenuList\": [\n" +
    "            {\n" +
    "                \"name\": \"测试商店\",\n" +
    "                \"callBack\": \"store_123123112\"\n" +
    "            },\n" +
    "            {\n" +
    "                \"name\": \"大聪明合伙人\",\n" +
    "                \"callBack\": \"store_132423423\"\n" +
    "            },\n" +
    "            {\n" +
    "                \"name\": \"老挝海林野生特产\",\n" +
    "                \"callBack\": \"store_878979239\"\n" +
    "            }\n" +
    "        ]\n" +
    "    },\n" +
    "    {\n" +
    "        \"name\": \"类型\",\n" +
    "        \"subMenuList\": [\n" +
    "            {\n" +
    "                \"name\": \"养生\",\n" +
    "                \"subMenuList\": [\n" +
    "                    {\n" +
    "                        \"name\": \"灵芝\",\n" +
    "                        \"callBack\": 2\n" +
    "                    },\n" +
    "                    {\n" +
    "                        \"name\": \"灵芝\",\n" +
    "                        \"callBack\": 2\n" +
    "                    },\n" +
    "                    {\n" +
    "                        \"name\": \"灵芝\",\n" +
    "                        \"callBack\": 2\n" +
    "                    },\n" +
    "                    {\n" +
    "                        \"name\": \"灵芝\",\n" +
    "                        \"callBack\": 2\n" +
    "                    }\n" +
    "                ]\n" +
    "            },\n" +
    "            {\n" +
    "                \"name\": \"美颜\",\n" +
    "                \"subMenuList\": [\n" +
    "                    {\n" +
    "                        \"name\": \"面膜\",\n" +
    "                        \"callBack\": 12\n" +
    "                    },\n" +
    "                    {\n" +
    "                        \"name\": \"面膜\",\n" +
    "                        \"callBack\": 12\n" +
    "                    },\n" +
    "                    {\n" +
    "                        \"name\": \"面膜\",\n" +
    "                        \"callBack\": 12\n" +
    "                    }\n" +
    "                ]\n" +
    "            }\n" +
    "        ]\n" +
    "    },\n" +
    "    {\n" +
    "        \"name\": \"价格\",\n" +
    "        \"subMenuList\": [\n" +
    "            {\n" +
    "                \"name\": \"100以下\",\n" +
    "                \"callBack\": {\n" +
    "                    \"minPrice\": 0,\n" +
    "                    \"maxPrice\": 100\n" +
    "                }\n" +
    "            },\n" +
    "            {\n" +
    "                \"name\": \"100～500\",\n" +
    "                \"callBack\": {\n" +
    "                    \"minPrice\": 100,\n" +
    "                    \"maxPrice\": 500\n" +
    "                }\n" +
    "            },\n" +
    "            {\n" +
    "                \"name\": \"500~1000\",\n" +
    "                \"callBack\": {\n" +
    "                    \"minPrice\": 500,\n" +
    "                    \"maxPrice\": 1000\n" +
    "                }\n" +
    "            },\n" +
    "            {\n" +
    "                \"name\": \"1000~5000\",\n" +
    "                \"callBack\": {\n" +
    "                    \"minPrice\": 1000,\n" +
    "                    \"maxPrice\": 5000\n" +
    "                }\n" +
    "            },\n" +
    "            {\n" +
    "                \"name\": \"5000~10000\",\n" +
    "                \"callBack\": {\n" +
    "                    \"minPrice\": 5000,\n" +
    "                    \"maxPrice\": 10000\n" +
    "                }\n" +
    "            }\n" +
    "        ]\n" +
    "    }\n" +
"]"

