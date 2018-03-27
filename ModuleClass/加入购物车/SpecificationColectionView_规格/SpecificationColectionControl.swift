//
//  JJLayoutColectionColtrol.swift
//  GreateSmart
//
//  Created by hailin on 2018/3/26.
//  Copyright © 2018年 Jerod. All rights reserved.
//

import UIKit

class SpecificationColectionControl: BaseControl,UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {

    var view : JJLayoutColectionView?
    var itemsArray : NSArray = []
    
    init(frame:CGRect, InteritemSpacing:CGFloat,  LineSpacing:CGFloat, contentInset:UIEdgeInsets) {
        super.init()
        view = JJLayoutColectionView.init(frame: frame, InteritemSpacing: InteritemSpacing, LineSpacing: LineSpacing, contentInset: contentInset)
        view!.isScrollEnabled = false
        view!.delegate = self
        view!.dataSource = self
        view!.register(SpecificationCollectionCell.self, forCellWithReuseIdentifier: "SpecificationColectionCellId")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return itemsArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SpecificationColectionCellId", for: indexPath) as? SpecificationCollectionCell
        cell?.titleLabel.text = itemsArray[indexPath.item] as? String
        return cell!
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delog("\(itemsArray[indexPath.row])")
    }
    
    // item 尺寸大小
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        /** 固定尺寸 */
        return CGSize.init(width: (kScreenW-20-20-10)/2, height: 25)
        
//        let layout = collectionViewLayout as! WSCollectionViewFlowLayout
//
//        let contentoffset = layout.contentInset.left + layout.contentInset.right
//        let maxWidth: CGFloat = collectionView.frame.width - contentoffset
//
//        let str: String = itemsArray.object(at: indexPath.item) as! String
//        let size = str.getStringSize(fontSize: 13)
//
//        return CGSize.init(width: min(size.width + 20, maxWidth), height: 25)
    }
    
}
