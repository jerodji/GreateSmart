//
//  BaseUINavigationController.swift
//  GreateSmart
//
//  Created by Jerod on 2018/2/23.
//  Copyright © 2018年 Jerod. All rights reserved.
//

import UIKit

class BaseUINavigationController: UINavigationController {

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(rootViewController: UIViewController) {
        super.init(rootViewController: rootViewController)
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
//    func configStyle() -> () {
//        self.navigationBar.isTranslucent = true
//        self.navigationBar.barTintColor = UIColor.init(hex: kColorNavi) /* 背景色 */
//        self.navigationBar.titleTextAttributes =  [NSAttributedStringKey.foregroundColor : UIColor.white] /* title颜色 */
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
