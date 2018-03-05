//
//  MyVC.swift
//  GreateSmart
//
//  Created by hailin on 2018/2/24.
//  Copyright © 2018年 Jerod. All rights reserved.
//

import UIKit

class MyVC: BaseUIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.naviBar.titleLab.text = "MY"
        self.view.backgroundColor = .blue
//        self.naviBar.leftItemBtn.isHidden = true
//        self.naviBar.rightItemBtn.isHidden = true
        self.naviBar.leftItemBtn.backgroundColor = .red
        self.naviBar.rightItemBtn.backgroundColor = .red
        self.naviBar.backgroundColor = .green
        self.naviBar.titleLab.backgroundColor = UIColor.brown
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
