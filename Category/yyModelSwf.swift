//
//  yyModelSwf.swift
//  GreateSmart
//
//  Created by hailin on 2018/3/9.
//  Copyright © 2018年 Jerod. All rights reserved.
//

import UIKit

extension NSObject {
    
    static func getModelWithDict(_ dict:NSDictionary) -> Self? {
        return self.yy_model(with: dict as! [AnyHashable : Any])
    }
    
    
}
