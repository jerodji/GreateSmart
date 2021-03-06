//
//  RightGoodsView.swift
//  GreateSmart
//
//  Created by hailin on 2018/3/16.
//  Copyright © 2018年 Jerod. All rights reserved.
//

import UIKit

/**
 * right view 视图逻辑层
 */

class RightGoodsView: UICollectionView,UICollectionViewDelegate,UICollectionViewDataSource {
    
    var viewModel : GoodsViewModel?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
    }
    
    convenience init(frame:CGRect) {
        let lay = UICollectionViewFlowLayout.init()
        lay.scrollDirection = .vertical
        lay.minimumInteritemSpacing = 15
        lay.itemSize = CGSize.init(width: 175*kSizeScale, height: 255*kSizeScale)
        
        self.init(frame: frame, collectionViewLayout: lay)
        self.backgroundColor = UIColor.white
        self.delegate = self
        self.dataSource = self
        self.register(UINib.init(nibName: "GoodCell", bundle: nil), forCellWithReuseIdentifier: "rightgoodcellid")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel?.rightList.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let model = viewModel?.letfList[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "rightgoodcellid", for: indexPath) as! GoodCell
        cell.imageView.jj_setImage(url: model?.image)
        cell.priceLabel.text = "\(String(describing: model?.price ?? 0.00))"
        cell.nameLabel.text = model?.itemSkuName
        cell.decsLabel.text = model?.publicity
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let goodDetailVC = GoodDetailsVC()
        self.navigationController()?.pushViewController(goodDetailVC, animated: true)
    }

}
