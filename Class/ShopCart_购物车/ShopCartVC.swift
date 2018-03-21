//
//  ShopCartVC.swift
//  GreateSmart
//
//  Created by hailin on 2018/2/24.
//  Copyright © 2018年 Jerod. All rights reserved.
//

import UIKit

class ShopCartVC: BaseUIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.naviBar.titleLab.text = "SHOP CART"
//        self.view.backgroundColor = .yellow
        self.naviBar.leftItemBtn.isHidden = true
        self.naviBar.rightItemBtn.isHidden = true
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
