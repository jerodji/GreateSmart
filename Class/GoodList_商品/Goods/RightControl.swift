//
//  RightControl.swift
//  GreateSmart
//
//  Created by hailin on 2018/3/17.
//  Copyright © 2018年 Jerod. All rights reserved.
//

import UIKit

class RightControl: BaseControl,UICollectionViewDelegate,UICollectionViewDataSource {

    var view: RightGoodsView!
    
    override init() {
        super.init()
        view = RightGoodsView()
        view.delegate = self
        view.dataSource = self
        view.register(UINib.init(nibName: "GoodCell", bundle: nil), forCellWithReuseIdentifier: "rightgoodcellid")
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "rightgoodcellid", for: indexPath)
        return cell
    }
    
}
