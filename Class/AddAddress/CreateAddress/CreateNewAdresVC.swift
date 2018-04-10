//
//  CreateNewAdresVC.swift
//  GreateSmart
//
//  Created by hailin on 2018/4/2.
//  Copyright © 2018年 Jerod. All rights reserved.
//

import UIKit

class CreateNewAdresVC: BaseUIViewController,UITextFieldDelegate {

    var model: AddressModel?
    
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
        if model==nil {
            naviBar.titleLab.text = "新建地址"
        } else {
            naviBar.titleLab.text = "修改地址"
        }
        
        naviBar.rightItemBtn.setTitle("完成", for: .normal)
        
        naviBar.rightCallback = {
            self.complete()
        }
        
        addressTF.placeholder = "详细地址 街道、楼牌号等"
        addressTF.placeholderColor = kcolor183.withAlphaComponent(0.5)
        addressTF.layer.borderWidth = 1
        addressTF.layer.borderColor = kcolor183.withAlphaComponent(0.3).cgColor
        addressTF.layer.cornerRadius = 5
        
        //修改地址传过来的model
        if model != nil {
            nameTF.text = model?.receiver
            phoneTF.text = model?.phonenum
            areaTF.text = model?.area
            addressTF.text = model?.address
        }
        
        areaTF.delegate = self
        
    }
    
    func complete() -> Void {
        
        if model == nil
        {
            //设置地址
            name = nameTF.text
            phone = phoneTF.text
            area = areaTF.text
            address = addressTF.text
            
            if IsNull(name) {
                MBHUDToast.showMsg("请填写姓名")
            }
            else if IsNull(phone) {
                MBHUDToast.showMsg("请填写联系电话")
            }
            else if IsNull(area) {
                MBHUDToast.showMsg("请选择地址")
            }
            else if IsNull(address) {
                MBHUDToast.showMsg("请填写具体地址")
            }
            else {
                let p : NSDictionary = [
                    "isdefalut":0,
                    "userAddress":[
                        "receiver":name,
                        "phonenum":phone,
                        "province":"江苏省",/*省*/
                        "city"    :"上海市",/*市*/
                        "area"    :area,/*区*/
                        "address" :address/*具体地址*/
                    ]
                ]
                
                NetHttp.ins.addAddress(params: p, succCb: { res in
                    self.navigationController?.popViewController(animated: true)
                })
            }
        }
        else
        {
            //修改地址
            name = nameTF.text
            phone = phoneTF.text
            area = areaTF.text
            address = addressTF.text
            
            if IsNull(name) {
                MBHUDToast.showMsg("请填写姓名")
            }
            else if IsNull(phone) {
                MBHUDToast.showMsg("请填写联系电话")
            }
            else if IsNull(area) {
                MBHUDToast.showMsg("请选择地址")
            }
            else if IsNull(address) {
                MBHUDToast.showMsg("请填写具体地址")
            }
            else {
                let params : NSDictionary = [
                    "isdefalut":model!.defaultAddressId,
                    "userAddress":[
                        "id"      :Int.init(model!.adrsId) ?? -1,
                        "receiver":name!,
                        "phonenum":phone!,
                        "province":"江苏省", /*省*/
                        "city"    :"上海市", /*市*/
                        "area"    :area!,   /*区*/
                        "address" :address! /*具体地址*/
                    ]
                ]
                
                NetHttp.ins.updateAddress(params: params) { (res) in
                    self.navigationController?.popViewController(animated: true)
                }
                
            }
            
        }
        
        NotificationCenter.default.post(name: NSNotification.Name(notifyReloadAddress), object: nil)
    }
    
    //MARK:-
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        delog("")
        let choseAdresView = ChoseAddressView.init()
        self.view.addSubview(choseAdresView)
        return false
    }
    

}
