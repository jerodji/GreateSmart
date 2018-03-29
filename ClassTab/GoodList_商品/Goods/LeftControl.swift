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
    var scene : GoodListVC!
    
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
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let goodDetailVC = GoodDetailsVC()
        
        scene.navigationController?.pushViewController(goodDetailVC, animated: true)
    }
    
    
}
