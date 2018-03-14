//
//  HotInStoreControl.swift
//  GreateSmart
//
//  Created by hailin on 2018/3/13.
//  Copyright © 2018年 Jerod. All rights reserved.
//

import UIKit

class HotInStoreControl: BaseControl,UICollectionViewDelegate,UICollectionViewDataSource {

    var view : HotInStoreView!
    var model: HotInStoreModel!
    
    override init() {
        super.init()
    }
    
    func handleData(typeInfo:Any!) -> HotInStoreModel {
        
        model = HotInStoreModel.dataReader(typeInfo: typeInfo)
        return model
    }
    
    func initView(frame:CGRect) -> Void {
        
        view = HotInStoreView.loadFromXIB()
        //view.frame = frame
        view.setFrame(frame)
        view.imageView.sd_setImage(with: URL.init(string: model.data.imageUrl), completed: nil)
        view.collectionView.delegate = self
        view.collectionView.dataSource = self
        view.collectionView.register(UINib.init(nibName: "HotInStoreCell", bundle: nil), forCellWithReuseIdentifier: "HotInStoreCellid")
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return model.data.block.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HotInStoreCellid", for: indexPath) as! HotInStoreCell
        let elem = model.data.block[indexPath.item] as! HotInStoreBlockElemModel
        cell.imgView.sd_setImage(with: URL.init(string: elem.itemTitleImage), completed: nil)
        cell.nameLabel.text = elem.itemName
        cell.priceLabel.text = elem.price
        return cell as UICollectionViewCell
    }
    
}
