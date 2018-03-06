//
//  BannerView.swift
//  GreateSmart
//
//  Created by hailin on 2018/3/6.
//  Copyright © 2018年 Jerod. All rights reserved.
//

import UIKit

class BannerView: UIView {

    let imageView = UIImageView()
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        imageView.backgroundColor = .purple
        imageView.image = UIImage.init(named: "screenPhoto")
        self.addSubview(imageView)
        
        imageView.snp.makeConstraints { (make) in
            make.edges.equalTo(self).offset(0)
        }
        
    }
    
    
    
    
}
