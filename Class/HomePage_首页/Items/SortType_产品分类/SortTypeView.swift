//
//  SortTypeView.swift
//  GreateSmart
//
//  Created by hailin on 2018/3/10.
//  Copyright © 2018年 Jerod. All rights reserved.
//

import UIKit

private let distance = CGFloat(10)
private let cellwidth = (kScreenW - 6 * distance)/5

class SortTypeView: UICollectionView {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
    }
    
    
    convenience init(frame: CGRect) {

        let layout = UICollectionViewFlowLayout.init()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize.init(width: cellwidth, height: cellwidth) /* item大小 */
        layout.minimumLineSpacing = distance /* 行间距 */
        layout.minimumInteritemSpacing = distance /* 列间距 */
        layout.sectionInset = UIEdgeInsets.init(top: itemcellTop, left: itemcellLeft, bottom: itemcellBottom, right: itemcellRight) /* 内边距 */
        
        self.init(frame: frame, collectionViewLayout: layout)
        self.backgroundColor = .clear
        self.isScrollEnabled = false
        self.showsVerticalScrollIndicator = false
        self.showsHorizontalScrollIndicator = false
    }
    
}



class SortTypeCell: UICollectionViewCell {

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    func image(_ url:String) -> Void {
        
        let imgview = UIImageView.init(frame: self.contentView.bounds)
        imgview.sd_setImage(with: URL.init(string: url), completed: nil)
        imgview.layer.cornerRadius = 5
        
        self.contentView.addSubview(imgview)
    }
}


