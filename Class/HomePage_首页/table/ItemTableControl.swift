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
                        let cl = HotInStoreControl()
                        let model = cl.handleData(typeInfo: itemDict)
                        cl.initView(frame: CGRect(x: itemcellLeft, y: itemcellTop, width: kScreenW-itemcellLeft-itemcellRight, height: heightHotInStore-itemcellTop-itemcellBottom))
                        dataHeights.add(heightHotInStore)
                        dataTitleHeights.add(heightTitle)
                        dataModels.add(model)
                        dataControls.add(cl)
                    }; break
                    
                    case ShowTypeENUM.ForMale.rawValue: do {
                        let ForMaleCtrl = ForMaleControl.init()
                        let model = ForMaleCtrl.handleData(typeInfo: itemDict)
                        dataHeights.add(heightForMale)
                        dataTitleHeights.add(heightTitle)
                        dataModels.add(model)
                        dataControls.add(ForMaleCtrl)
                    }; break
                    
                    case ShowTypeENUM.HotSale.rawValue: do {
                        let cl = HotSaleControl()
                        let model = cl.handleData(typeInfo: itemDict)
                        cl.initView(frame: CGRect(x: itemcellLeft, y: itemcellTop, width: kScreenW-itemcellLeft-itemcellRight, height: heightHotSale-itemcellTop-itemcellBottom))
                        dataHeights.add(heightHotSale)
                        dataTitleHeights.add(heightTitle)
                        dataModels.add(model)
                        dataControls.add(cl)
                    }; break

                    case ShowTypeENUM.Nature.rawValue: do {
                        let ctrl = NatureControl.init()
                        let model = ctrl.handleData(typeInfo: itemDict)
                        ctrl.setViewWithFrame(CGRect(x: 0, y: 0, width: kScreenW, height: heightNature(elemCount: model.data.block.count)))
                        dataHeights.add(heightNature(elemCount: model.data.block.count))
                        dataTitleHeights.add(heightTitle)
                        dataModels.add(model)
                        dataControls.add(ctrl)
                        ctrl.setCells(natureModel: model)
                    }; break
                    
                    case ShowTypeENUM.TimeReC.rawValue: do {
                        let cl = TimeReCControl()
                        let model = cl.handleData(typeInfo: itemDict)
                        cl.initView(frame: CGRect.init(x: 0, y: 0, width: kScreenW, height: heightTimeRec))
                        dataHeights.add(heightTimeRec)
                        dataTitleHeights.add(heightTitle)
                        dataModels.add(model)
                        dataControls.add(cl)
                    }; break
                    
                    case ShowTypeENUM.Boutique.rawValue: do {
                        let boutiqueCtrl = BoutiqueControl.init()
                        let model = boutiqueCtrl.handleData(typeInfo: itemDict)
                        let hei = heightBoutique(elemCount: model.data.block.count)
                        boutiqueCtrl.setView(frame: CGRect.init(x: 0, y: 0, width: kScreenW, height: hei))
                        dataHeights.add(hei)
                        dataTitleHeights.add(heightTitle)
                        dataModels.add(model)
                        dataControls.add(boutiqueCtrl)
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
                    }; break
                    
                    case ShowTypeENUM.NewBlock1.rawValue: do {
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
        delog("\(scrollView.contentOffset.y)")
        tableView.banner.y = scrollView.contentOffset.y
        let offsetY = scrollView.contentOffset.y + heightBanner
//        tableView.banner.isUserInteractionEnabled = false
        if offsetY < 0 {
            tableView.banner.height = heightBanner-offsetY
//            tableView.banner.isUserInteractionEnabled = true
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
                differentTypeHandle(obj: obj, cell: cell as! ItemCell)
            }
        }
        
        return cell!
    }
    
    func differentTypeHandle(obj:Any!, cell:ItemCell!) -> Void {
        if obj is SortTypeControl {
            let control = obj as! SortTypeControl
            control.collectionView.frame = CGRect.init(x: 0, y: 0, width: kScreenW, height: heightSortType)
            cell!.addSubview(control.collectionView)
        }
        if obj is HotInStoreControl {
            let control = obj as! HotInStoreControl
            cell!.addSubview(control.view)
        }
        if obj is ForMaleControl {
            let control = obj as! ForMaleControl
            control.view.setFrame(CGRect.init(x: 0, y: 0, width: kScreenW, height: heightForMale))
            cell!.addSubview(control.view)
        }
        if obj is HotSaleControl {
            let control = obj as! HotSaleControl
//            control.view.frame = CGRect(x: itemcellLeft, y: itemcellTop, width: kScreenW-itemcellLeft-itemcellRight, height: heightHotSale-itemcellTop-itemcellBottom)
            cell!.addSubview(control.view)
        }
        if obj is NatureControl {
            let control = obj as! NatureControl
            cell!.addSubview(control.view)
        }
        if obj is TimeReCControl {
            let control = obj as! TimeReCControl
            cell!.addSubview(control.view)
        }
        if obj is BoutiqueControl {
            let control = obj as! BoutiqueControl
            cell!.contentView.addSubview(control.view)
        }
        if obj is LTCControl {
            let control = obj as! LTCControl
            control.view.frame = CGRect.init(x: 0, y: 0, width: kScreenW, height: heightLTC)
            cell!.contentView.addSubview(control.view)
        }
        //...
    }
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let header = ItemTitleView.loadFromXIB()
        header.frame = CGRect.init(x: 0, y: 0, width: kScreenW, height: heightTitle)
        
        if section <= dataModels.count-1 {
            let obj = dataModels.object(at: section)
            difTypeTitleHandle(obj: obj, header: header)
        } else {
            header.titleLab.text = "暂未开放"
            header.smailTitleLab.text = "敬请期待"
        }
        
        return header
    }
    
    func difTypeTitleHandle(obj:Any!,header:ItemTitleView!) -> Void {
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
        return heightTitle
//        if section <= dataTitleHeights.count-1 {
//            return dataTitleHeights.safe_object(at: section) as! CGFloat
//        }
//        return 0
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.01
    }
    

}
