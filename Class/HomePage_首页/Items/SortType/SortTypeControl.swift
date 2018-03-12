//
//  SortTypeControl.swift
//  GreateSmart
//
//  Created by hailin on 2018/3/10.
//  Copyright © 2018年 Jerod. All rights reserved.
//

import UIKit
import SwiftyJSON

let distance = CGFloat(10)


class SortTypeControl: BaseControl,UICollectionViewDataSource,UICollectionViewDelegate {
    
    var collectionView : SortTypeView!
    var model : SortTypeModel!
    
    override init() {
        super.init()
        collectionView = SortTypeView.init(frame: CGRect(x:kScreenW - itemcellLeft, y: itemcellTop, width: kScreenW - itemcellLeft - itemcellRight, height: 1))
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(SortTypeCell.self, forCellWithReuseIdentifier: "SortTypeCellid")
    }
    
    
    func handleData(_ data : Any) -> Void {
        if data is NSDictionary {
            let dict = data as! NSDictionary
            model = SortTypeModel.mj_object(withKeyValues: dict)
            delog(model)
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return model.block.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell: SortTypeCell = collectionView.dequeueReusableCell(withReuseIdentifier: "SortTypeCellid", for: indexPath) as! SortTypeCell
        
        let imgModel = model.block.object(at: indexPath.item) as! NSDictionary
        cell.image(imgModel["imageUrl"] as! String)
        
        return cell
    }
}
