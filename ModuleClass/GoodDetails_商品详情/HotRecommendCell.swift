//
//  HotRecommendCell.swift
//  GreateSmart
//
//  Created by hailin on 2018/3/19.
//  Copyright © 2018年 Jerod. All rights reserved.
//

import UIKit

private class DetailHotRecommendCollectionView: UICollectionView {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        self.frame = frame
        self.backgroundColor = UIColor.white
    }
    
    convenience init(frame:CGRect) {
        
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsetsMake(itemcellTop, itemcellLeft, itemcellBottom, itemcellRight)
        layout.minimumLineSpacing = 10 //行间距
        layout.itemSize = CGSize.init(width: widthTimeRecCell, height: heightTimeRec-itemcellBottom-itemcellTop)
        layout.scrollDirection = .horizontal
        
        self.init(frame: frame, collectionViewLayout: layout)
        
    }
    
    
}

class HotRecommendCell: UITableViewCell,UICollectionViewDelegate,UICollectionViewDataSource {
    
    var titleView : ItemTitleView!
    private var collectionView : DetailHotRecommendCollectionView!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        titleView = ItemTitleView.loadFromXIB()
        titleView.frame = CGRect.init(x: 0, y: 5, width: kScreenW, height: heightTitle)
        titleView.titleLab.text = "热门推荐"
        titleView.smailTitleLab.text = "Hot recommended"
        
        collectionView = DetailHotRecommendCollectionView.init(frame: CGRect(x: 0, y: 5+heightTitle, width: kScreenW, height: 240-heightTitle))
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib.init(nibName: "TimeReCCell", bundle: nil), forCellWithReuseIdentifier: "TimeReCCellDetailid")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.addSubview(titleView)
        self.addSubview(collectionView)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TimeReCCellDetailid", for: indexPath) as! TimeReCCell
        cell.discountLabel.isHidden = true
        cell.imageView.backgroundColor = UIColor.lightGray
        cell.littleImgVIew.backgroundColor = UIColor.gray
        cell.priceLabel.text = "￥998.21"
        cell.nameLabel.text = "老挝野生石斛精选"
        cell.remainingLabel.text = "剩余18件"
        return cell
    }
    
    override func draw(_ rect: CGRect) {
        titleView.frame = CGRect.init(x: 0, y: 5, width: kScreenW, height: heightTitle)
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
}
