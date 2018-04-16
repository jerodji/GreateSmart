//
//  UIView_extension.swift
//  GreateSmart
//
//  Created by hailin on 2018/3/19.
//  Copyright © 2018年 Jerod. All rights reserved.
//

import UIKit

extension UIView {
    
    /// 设置部分圆角
    ///
    /// - Parameters:
    ///   - corners: .allCorners 或 数组[.topRight, .topLeft, .bottomLeft, .bottomRight]
    ///   - radii: 圆角半径
    func addCorner(corners: UIRectCorner, radii:CGFloat) -> () {
        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radii, height: radii))
        let maskLayer = CAShapeLayer()
        maskLayer.path = path.cgPath
        maskLayer.frame = self.bounds
        self.layer.mask = maskLayer
    }
    
    
//        let path = UIBezierPath(roundedRect: imageView.bounds, byRoundingCorners: [UIRectCorner.topLeft, UIRectCorner.topRight], cornerRadii: CGSize(width: 20, height: 20))
//        let maskLayer = CAShapeLayer()
//        maskLayer.path = path.cgPath
//        maskLayer.frame = imageView.bounds
//        imageView.layer.mask = maskLayer
        
}
