//
//  FlowCollectionView.swift
//  GreateSmart
//
//  Created by hailin on 2018/3/1.
//  Copyright © 2018年 Jerod. All rights reserved.
//

import UIKit

class LabelCollectionViewCell: UICollectionViewCell {
    
    var titleLabel: UILabel! = nil
    
    func setupTitleLabel() -> () {
        if titleLabel==nil {
            titleLabel = UILabel()
            titleLabel.font = UIFont.systemFont(ofSize: 13)
            titleLabel.textColor = UIColor.init(hex: "B7B7B7")
            titleLabel.textAlignment = .center
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        titleLabel.frame = self.contentView.bounds
        self.contentView.addSubview(titleLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupTitleLabel()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupTitleLabel()
    }
}


//MARK:-

class FlowCollectionView: UICollectionView,UICollectionViewDelegate,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var dataArray: NSMutableArray!
    
    typealias SelecBLK = (_ keyword:String, _ indexPath:IndexPath) -> ()
    var selecCB: SelecBLK?
    
    private let CellId = "flowviewcellid"
    private let layout = WSCollectionViewFlowLayout()
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    /// init
    ///
    /// - Parameters:
    ///   - frame: frame
    ///   - InteritemSpacing: 横向间距
    ///   - LineSpacing: 纵向间距
    ///   - contentInset: 整体内容的偏移(包括区头)
    init(frame:CGRect, InteritemSpacing:CGFloat,  LineSpacing:CGFloat, contentInset:UIEdgeInsets, data: NSMutableArray) {

        dataArray = NSMutableArray()
        dataArray = data
        
        layout.contentInset = contentInset
        layout.minimumInteritemSpacing = InteritemSpacing
        layout.minimumLineSpacing = LineSpacing

        super.init(frame: frame, collectionViewLayout: layout)
        
        self.backgroundColor = UIColor.clear
        self.register(LabelCollectionViewCell.self, forCellWithReuseIdentifier: CellId)
        self.delegate = self
        self.dataSource = self
        
        adapter()
    }
    
    //适配
    func adapter() -> () {
        if #available(iOS 11, *) {
            self.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentBehavior.automatic
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataArray!.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell: LabelCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: CellId, for: indexPath) as! LabelCollectionViewCell
        
        cell.backgroundColor = UIColor.init(hex: "F1F1F1")
        cell.layer.cornerRadius = 3
        cell.layer.masksToBounds = true
        
        let str: String = dataArray.object(at: indexPath.item) as! String
        cell.titleLabel.text = str
        
        return cell
    }
    
    // item 尺寸大小
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let layout = collectionViewLayout as! WSCollectionViewFlowLayout
        
        let contentoffset = layout.contentInset.left + layout.contentInset.right
        let maxWidth: CGFloat = collectionView.frame.width - contentoffset
        
        let str: String = dataArray.object(at: indexPath.item) as! String
        let size = str.getStringSize(fontSize: 13)
        
        return CGSize.init(width: min(size.width + 20, maxWidth), height: 30)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let str = dataArray.object(at: indexPath.item) as! String
        selecCB == nil ? () : selecCB!(str,indexPath)
//        if selecCB != nil {
//            selecCB!(str,indexPath)
//        }
    }

}
