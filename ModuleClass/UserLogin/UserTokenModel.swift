//
//  UserLoginModel.swift
//  GreateSmart
//
//  Created by hailin on 2018/3/27.
//  Copyright © 2018年 Jerod. All rights reserved.
//

import UIKit

class UserTokenModel: BaseModel {
    
    /* 单例 */
    static let instance = UserTokenModel()
    /* 需要重写自己的init方法,设置为私有,保证单例是真正唯一的,避免外部对象通过访问init方法创建单例类的其他实例 */
    private override init() { super.init() }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var access_token : String = "79e7ca46-3401-48b3-9b4a-834cb62f9922"
    var token_type : String = "bearer"
    var refresh_token : String = "9c941fc2-2c2c-4270-bd39-75834ceefd5a"
    var expires_in : String = "4018"
    var scope : String = "app"
}

/**
 {
 "access_token":"79e7ca46-3401-48b3-9b4a-834cb62f9922",
 "token_type":"bearer",
 "refresh_token":"9c941fc2-2c2c-4270-bd39-75834ceefd5a",
 "expires_in":4018,
 "scope":"app"
 }
 */
