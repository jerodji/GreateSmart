//
//  TimeReCControl.swift
//  GreateSmart
//
//  Created by hailin on 2018/3/13.
//  Copyright © 2018年 Jerod. All rights reserved.
//

import UIKit

class TimeReCControl: BaseControl,UICollectionViewDelegate,UICollectionViewDataSource {

    var view :TimeReCCollectView!
    var model:TimeReCModel!
    
    override init() {
        super.init()
    }
    
    func handleData(typeInfo:Any!) -> TimeReCModel {
        model = TimeReCModel.dataReader(typeInfo: typeInfo)
        return model
    }
    
    func initView(frame:CGRect) -> Void {
        view = TimeReCCollectView.init(frame: frame)
        view.delegate = self
        view.dataSource = self
        view.register(UINib.init(nibName: "TimeReCCell", bundle: nil), forCellWithReuseIdentifier: "timereccellid")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return model.data.block.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cel = collectionView.dequeueReusableCell(withReuseIdentifier: "timereccellid", for: indexPath)
        let mod = model.data.block[indexPath.item] as! TimeReCBlockElemModel
        setModel(mod, forCell: cel as! TimeReCCell, index: indexPath.item)
        return cel
    }
    
    func setModel(_ model:TimeReCBlockElemModel, forCell cell:TimeReCCell, index:Int) -> Void {
        
//        let elemModel = model.data.block[index] as! TimeReCBlockElemModel
        
        cell.imageView.sd_setImage(with: URL.init(string: model.itemTitleImage), completed: nil)
        cell.priceLabel.text = "¥" + model.price
        cell.nameLabel.text = model.itemName
        //cell.discountLabel.text = "限量半价"
        cell.remainingLabel.text = "剩余999件"
        
    }
    
}
