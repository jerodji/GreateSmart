//
//  ItemTableCcontrl.swift
//  GreateSmart
//
//  Created by hailin on 2018/3/6.
//  Copyright © 2018年 Jerod. All rights reserved.
//

import UIKit

class ItemTableControl: BaseControl,UITableViewDelegate,UITableViewDataSource {
    
    var tableView: ItemTableView!
    var dataArray: NSArray!
    var dataHeights: NSMutableArray = []
    var dataTitleHeights: NSMutableArray = []
    var dataControls: NSMutableArray = []
    var dataModels: NSMutableArray = []
    
//    var sortTypeCtrl : SortTypeControl!
//    var LTCCtrl : LTCControl!
    
    
    override init() {
        super.init()
    }
    
    convenience init(tableFrame: CGRect) {
        self.init()
        tableView = ItemTableView.init(frame: tableFrame)
        tableView.contentInset = UIEdgeInsetsMake(heightBanner, 0, 0, 0)
        tableView.separatorStyle = .none
        tableView.delegate = self
        tableView.dataSource = self
        //self.showsVerticalScrollIndicator = false
        //self.showsHorizontalScrollIndicator = false
    }
    
    func handleHomeData(homeData:NSArray!) -> Void {
        
        dataArray = homeData!
        
        for index in 0...homeData.count-1 {
            
            let obj = homeData.object(at: index)
            
            if obj is NSDictionary {
                
                let itemDict = obj as! NSDictionary
                let type = itemDict.object(forKey: "showType") as! String
                
                switch (type) {
                    
                    case ShowTypeENUM.NewBanner.rawValue :  do {
                        tableView.banner.handleData(typeInfo: itemDict)
                    }; break
                    
                    case ShowTypeENUM.SortType.rawValue: do {
                        let sortTypeCtrl = SortTypeControl.init(frame: CGRect(x: 0, y: 0, width: tableView.width, height: heightSortType))
                        let model = sortTypeCtrl.handleData(typeInfo: itemDict)
                        dataModels.add(model)
                        dataHeights.add(heightSortType)
                        dataTitleHeights.add(heightTitle)
                        dataControls.add(sortTypeCtrl)
                    };
                    break
                    
                    case ShowTypeENUM.HotInStore.rawValue: do {
//                        dataHeights.add(CGFloat(10))
//                        dataTitleHeights.add(heightTitle)
                    }; break
                    
                    case ShowTypeENUM.ForMale.rawValue: do {
//                        dataHeights.add(CGFloat(20))
//                        dataTitleHeights.add(heightTitle)
                    }; break
                    
                    case ShowTypeENUM.HotSale.rawValue: do {
//                        dataHeights.add(CGFloat(30))
//                        dataTitleHeights.add(heightTitle)
                    }; break

                    case ShowTypeENUM.Nature.rawValue: do {
//                        dataHeights.add(CGFloat(50))
//                        dataTitleHeights.add(heightTitle)
                    }; break
                    
                    case ShowTypeENUM.TimeReC.rawValue: do {
//                        dataHeights.add(5)
//                        dataTitleHeights.add(heightTitle)
                    }; break
                    
                    case ShowTypeENUM.Boutique.rawValue: do {
//                        dataHeights.add(CGFloat(60))
//                        dataTitleHeights.add(heightTitle)
                    }; break
                    
                    case ShowTypeENUM.LTC.rawValue: do {
                        let LTCCtrl = LTCControl.init()
                        let model = LTCCtrl.handleData(typeInfo:itemDict)
                        dataHeights.add(CGFloat(heightLTC))
                        dataTitleHeights.add(heightTitle)
                        dataModels.add(model)
                        dataControls.add(LTCCtrl)
                    }; break
                    
                    case ShowTypeENUM.Nature2.rawValue: do {
//                        dataHeights.add(CGFloat(40))
//                        dataTitleHeights.add(heightTitle)
                    }; break
                    
                    case ShowTypeENUM.NewBlock1.rawValue: do {
//                        dataHeights.add(CGFloat(80))
//                        dataTitleHeights.add(heightTitle)
                    }; break
                    
                    default: do {
                        dataHeights.add(CGFloat(0))
                        dataTitleHeights.add(0)
                    };break
                }
                
            }
            
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        tableView.banner.y = scrollView.contentOffset.y
        let offsetY = scrollView.contentOffset.y + heightBanner
        if offsetY < 0 {
            tableView.banner.height = heightBanner-offsetY
        }
    }
    
    //MARK:-

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let dequeueID = String.init(format: "homeItemCellId_%i", arguments: [indexPath.section])
        
        var cell = tableView.dequeueReusableCell(withIdentifier: dequeueID)
        if nil == cell {
            cell = ItemCell.init(style: .default, reuseIdentifier: dequeueID)
            cell?.selectionStyle = .none
            
            if indexPath.section <= dataControls.count-1 {
                let obj = dataControls.object(at: indexPath.section)
                
                if obj is SortTypeControl {
                    let control = obj as! SortTypeControl
                    control.collectionView.frame = CGRect.init(x: 0, y: 0, width: kScreenW, height: heightSortType)
                    cell!.addSubview(control.collectionView)
                }
                if obj is HotInStoreControl {
                    let control = obj as! HotInStoreControl
                }
                if obj is ForMaleControl {
                    let control = obj as! ForMaleControl
                }
                if obj is HotSaleControl {
                    let control = obj as! HotSaleControl
                }
                if obj is NatureControl {
                    let control = obj as! NatureControl
                }
                if obj is TimeReCControl {
                    let control = obj as! TimeReCControl
                }
                if obj is BoutiqueControl {
                    let control = obj as! BoutiqueControl
                }
                if obj is LTCControl {
                    let control = obj as! LTCControl
                    control.view.frame = CGRect.init(x: 0, y: 0, width: kScreenW, height: heightLTC)
                    cell!.contentView.addSubview(control.view)
                }
                //...
            }
        }
        
        
        
        return cell!
    }
    
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let header = ItemTitleView.loadFromXIB()
        header.frame = CGRect.init(x: 0, y: 0, width: kScreenW, height: heightTitle)
        
        if section <= dataModels.count-1 {
            let obj = dataModels.object(at: section)
            
            if obj is SortTypeModel {
                let model = obj as! SortTypeModel
                header.titleLab.text = model.data.title
                header.smailTitleLab.text = model.data.smallTitle
            }
            if obj is HotInStoreModel {
                let model = obj as! HotInStoreModel
                header.titleLab.text = model.data.title
                header.smailTitleLab.text = model.data.smallTitle
            }
            if obj is ForMaleModel {
                let model = obj as! ForMaleModel
                header.titleLab.text = model.data.title
                header.smailTitleLab.text = model.data.smallTitle
            }
            if obj is HotSaleModel {
                let model = obj as! HotSaleModel
                header.titleLab.text = model.data.title
                header.smailTitleLab.text = model.data.smallTitle
            }
            if obj is NatureModel {
                let model = obj as! NatureModel
                header.titleLab.text = model.data.title
                header.smailTitleLab.text = model.data.smallTitle
            }
            if obj is TimeReCModel {
                let model = obj as! TimeReCModel
                header.titleLab.text = model.data.title
                header.smailTitleLab.text = model.data.smallTitle
            }
            if obj is BoutiqueModel {
                let model = obj as! BoutiqueModel
                header.titleLab.text = model.data.title
                header.smailTitleLab.text = model.data.smallTitle
            }
            if obj is LTCModel {
                let model = obj as! LTCModel
                header.titleLab.text = model.data.title
                header.smailTitleLab.text = model.data.smallTitle
            }
            //...
        }
        else {
            header.titleLab.text = "暂未开放"
            header.smailTitleLab.text = "敬请期待"
        }
        
        return header
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return nil
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        //return dataArray.count - 1 /* 减去banner */
        return dataControls.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delog("\(indexPath)")
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if (indexPath.row + 1) <= dataHeights.count {
            return dataHeights.safe_object(at: indexPath.section) as! CGFloat
        }
        return 0
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section <= dataTitleHeights.count-1 {
            return dataTitleHeights.safe_object(at: section) as! CGFloat
        }
        return 0
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.01
    }
    

}
