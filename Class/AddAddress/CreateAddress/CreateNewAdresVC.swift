//
//  CreateNewAdresVC.swift
//  GreateSmart
//
//  Created by hailin on 2018/4/2.
//  Copyright © 2018年 Jerod. All rights reserved.
//

import UIKit

class CreateNewAdresVC: BaseUIViewController {

    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var phoneTF: UITextField!
    @IBOutlet weak var areaTF: UITextField!
    @IBOutlet weak var addressTF: JITextView!
    
    private var name : String?
    private var phone : String?
    private var area : String?
    private var address : String?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        naviBar.titleLab.text = "新建地址"
        naviBar.rightItemBtn.setTitle("完成", for: .normal)
        
        naviBar.rightCallback = {
            self.complete()
        }
        
        addressTF.placeholder = "详细地址 街道、楼牌号等"
        addressTF.placeholderColor = kcolor183.withAlphaComponent(0.5)
        addressTF.layer.borderWidth = 1
        addressTF.layer.borderColor = kcolor183.withAlphaComponent(0.3).cgColor
        addressTF.layer.cornerRadius = 5
    }
    
    func complete() -> Void {
        name = nameTF.text
        phone = phoneTF.text
        area = areaTF.text
        address = addressTF.text
        
        let p : NSDictionary = [
            "isdefalut":1,
            "userAddress":[
                "address":"上海",
                "area":"松江",
                "city":"泗泾",
                "phonenum":"12313212",
                "province":"康",
                "receiver":"fajkljlk"
            ]
        ]
        NetHttp.ins.addAddress(params: p)
    }

}
