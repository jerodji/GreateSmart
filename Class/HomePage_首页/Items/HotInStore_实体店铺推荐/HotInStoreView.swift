//
//  HotInStoreView.swift
//  GreateSmart
//
//  Created by hailin on 2018/3/14.
//  Copyright © 2018年 Jerod. All rights reserved.
//

import UIKit

class HotInStoreView: UIView,LoadXIBView {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    private var frameRect : CGRect!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.cornerRadius = 15
        self.layer.masksToBounds = true
        self.layer.borderWidth = 0.5
        self.layer.borderColor = RGBA(83, 83, 83, 0.4).cgColor
    }
    
    func setFrame(_ frame:CGRect) -> Void {
        //self.frame = frame
        frameRect = frame
    }
    
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
        if frameRect != nil {
            self.frame = frameRect
        }
    }
 

}
