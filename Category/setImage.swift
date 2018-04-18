//
//  setImage.swift
//  GreateSmart
//
//  Created by Jerod on 2018/4/16.
//  Copyright © 2018年 Jerod. All rights reserved.
//

import Foundation

//封装一层,便于框架替换

extension UIImageView {
    
    func jj_setImage(url:String?) -> Void {
        
        self.sd_setImage(with: URL(string: url ?? ""),
                         completed: nil)
    }
    
    func jj_setImage(url:String?, complete: SDExternalCompletionBlock? ) -> Void {
        
        self.sd_setImage(with: URL(string: url ?? ""),
                         completed:complete ?? nil)
    }
    
    func jj_setImage(url:String?, placeholder:UIImage?) -> Void {
        
        self.sd_setImage(with: URL(string:url ?? ""),
                         placeholderImage: placeholder ?? nil,
                         options: [SDWebImageOptions.retryFailed, SDWebImageOptions.lowPriority],
                         completed: nil)
        
    }
    
    func jj_setImage(url:String?, placeholder:UIImage?, options:SDWebImageOptions?, complete: SDExternalCompletionBlock? ) -> Void {
        
        self.sd_setImage(with: URL(string: url ?? ""),
                         placeholderImage: placeholder ?? nil,
                         options: options ?? [SDWebImageOptions.retryFailed, SDWebImageOptions.lowPriority],
                         completed: complete ?? nil)
        
    }
    
}
