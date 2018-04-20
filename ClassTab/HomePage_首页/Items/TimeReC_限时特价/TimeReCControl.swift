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
        weak var wkself = self
        
        let cel = collectionView.dequeueReusableCell(withReuseIdentifier: "timereccellid", for: indexPath) as! TimeReCCell
        let mod = wkself?.model.data.block[indexPath.item] as! TimeReCBlockElemModel
        
//        wkself?.setModel(mod, forCell: cel as! TimeReCCell, index: indexPath.item)
        cel.imageView.jj_setImage(url: mod.itemTitleImage)
        cel.littleImgVIew.isHidden = true
        cel.priceLabel.text = "¥" + mod.price
        cel.nameLabel.text = mod.itemName
        //cell.discountLabel.text = "限量半价"
        cel.remainingLabel.text = "剩余999件"
        
        return cel
    }
    
    func setModel(_ model:TimeReCBlockElemModel, forCell cell:TimeReCCell, index:Int) -> Void {
        
//        let elemModel = model.data.block[index] as! TimeReCBlockElemModel
        
        cell.imageView.jj_setImage(url: model.itemTitleImage)
        cell.littleImgVIew.isHidden = true
        cell.priceLabel.text = "¥" + model.price
        cell.nameLabel.text = model.itemName
        //cell.discountLabel.text = "限量半价"
        cell.remainingLabel.text = "剩余999件"
        
    }
    
}
