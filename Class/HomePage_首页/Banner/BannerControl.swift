//
//  HomeBannerControl.swift
//  GreateSmart
//
//  Created by hailin on 2018/2/25.
//  Copyright © 2018年 Jerod. All rights reserved.
//

import UIKit

class BannerControl: BaseControl {
    
    let bannerView = UIView()
    let imageView = UIImageView()
    
    
    override init() {
        super.init()
        //bannerView.backgroundColor = UIColor.purple
        imageView.backgroundColor = .purple
        imageView.image = UIImage.init(named: "screenPhoto")
        
    }

}
