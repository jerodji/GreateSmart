//
//  ShopCartVC.swift
//  GreateSmart
//
//  Created by hailin on 2018/2/24.
//  Copyright © 2018年 Jerod. All rights reserved.
//

import UIKit

class ShopCartVC: BaseUIViewController {
    
    var accountBar : ShopCartAccountBar?
    private let heightAccountBar = CGFloat(49)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.naviBar.titleLab.text = "购物车"
        self.naviBar.leftItemBtn.isHidden = true
        self.naviBar.rightItemBtn.setTitle("完成", for: .normal)
        self.naviBar.rightItemBtn.setTitleColor(.black, for: .normal)
        self.naviBar.rightItemBtn.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        self.naviBar.rightItemBtn.titleLabel?.textAlignment = .left
        self.naviBar.rightCallback = {
            
        }
        
        accountBar = ShopCartAccountBar.loadFromXIB()
        accountBar?.frameXib = CGRect.init(x: 0, y: kScreenH - kTabbarH - heightAccountBar, width: kScreenW, height: heightAccountBar)
        view.addSubview(accountBar!)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
