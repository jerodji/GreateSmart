//
//  UIView_extension.swift
//  GreateSmart
//
//  Created by hailin on 2018/3/19.
//  Copyright © 2018年 Jerod. All rights reserved.
//

import UIKit

extension UIView {

    /**
       设置部分圆角
     view.addCorner(roundingCorners: UIRectCorner(rawValue: UIRectCorner.RawValue(UInt8(UIRectCorner.topLeft.rawValue)|UInt8(UIRectCorner.topRight.rawValue))),cornerSize: CGSize(width: 10, height: 10))
     */
    func addCorner(roundingCorners: UIRectCorner, cornerSize: CGSize) {
        
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: roundingCorners, cornerRadii: cornerSize)
        let cornerLayer = CAShapeLayer()
        cornerLayer.frame = bounds
        cornerLayer.path = path.cgPath
        
        layer.mask = cornerLayer
    }
    
}
