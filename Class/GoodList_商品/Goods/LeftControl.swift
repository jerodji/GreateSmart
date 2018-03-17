//
//  LeftControl.swift
//  GreateSmart
//
//  Created by hailin on 2018/3/17.
//  Copyright © 2018年 Jerod. All rights reserved.
//

import UIKit

class LeftControl: BaseControl,UICollectionViewDelegate,UICollectionViewDataSource {

    var view : LeftGoodsView!
    
    override init() {
        super.init()
        view = LeftGoodsView()
        view.delegate = self
        view.dataSource = self
        view.register(UINib.init(nibName: "GoodCell", bundle: nil), forCellWithReuseIdentifier: "leftgoodcellid")
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "leftgoodcellid", for: indexPath)
        
//        cell.layer.shadowColor = RGB(83, 83, 83).cgColor
//        cell.layer.shadowOpacity = 0.4
//        cell.layer.shadowRadius = 2
//        //self.layer.shadowOffset = CGSize.init(width: 0, height: 2)
//        cell.layer.shadowPath = UIBezierPath.init(roundedRect: CGRect.init(x: 0, y: 2, width: cell.bounds.size.width, height: cell.bounds.size.height+2), cornerRadius: 0).cgPath
//        cell.layer.shouldRasterize = true //设置缓存
//        cell.layer.rasterizationScale = UIScreen.main.scale //设置抗锯齿边缘
        
        
        return cell
    }

}
