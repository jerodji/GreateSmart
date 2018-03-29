//
//  ResultVC.swift
//  GreateSmart
//
//  Created by hailin on 2018/2/28.
//  Copyright © 2018年 Jerod. All rights reserved.
//

import UIKit

class ResultVC: BaseUIViewController {

    var keyword: String!
    
    private let textField = JJTextField.init()
    
    override func loadView() {
        super.loadView()
        //请求搜索接口
        delog(keyword)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.naviBar.titleLab.isHidden = true
        self.naviBar.rightItemBtn.isHidden = true
        configTextField()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = true
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.tabBarController?.tabBar.isHidden = false
    }
    
    func configTextField() -> () {
        textField.frame = CGRect.init(x: self.naviBar.leftItemBtn.right, y: kStatusH+4, width: kScreenW-self.naviBar.leftItemBtn.width-10, height: 35)
        self.naviBar.addSubview(textField)
        textField.text = keyword
        
        textField.returnCB = { (searchStr)->() in
            if IsFullSpace(searchStr) {
                delog("搜索内容不能为空")
                return
            }
            //请求搜索接口
            delog("searchStr")
            
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
}
