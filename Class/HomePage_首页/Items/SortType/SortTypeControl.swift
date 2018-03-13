//
//  SortTypeControl.swift
//  GreateSmart
//
//  Created by hailin on 2018/3/10.
//  Copyright © 2018年 Jerod. All rights reserved.
//

import UIKit

class SortTypeControl: BaseControl,UICollectionViewDataSource,UICollectionViewDelegate {
    
    var collectionView : SortTypeView!
    var model : SortTypeModel!
    
    init(frame:CGRect) {
        super.init()

        collectionView = SortTypeView.init(frame: frame)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(SortTypeCell.self, forCellWithReuseIdentifier: "SortTypeCellid")
    }
    
    func handleData(typeInfo : Any) -> SortTypeModel {
        model = SortTypeModel.dataReader(typeInfo: typeInfo)
        return model
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return model.data.block.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell: SortTypeCell = collectionView.dequeueReusableCell(withReuseIdentifier: "SortTypeCellid", for: indexPath) as! SortTypeCell
        
        let imgModel = model.data.block.object(at: indexPath.item) as! SortTypeBlockElementModel
        cell.image(imgModel.imageUrl)
        
        return cell
    }
    
    
}
