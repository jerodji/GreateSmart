//
//  LoginVC.swift
//  GreateSmart
//
//  Created by hailin on 2018/3/27.
//  Copyright © 2018年 Jerod. All rights reserved.
//

import UIKit
import KeychainAccess

class LoginVC: UIViewController {
    
    @IBOutlet weak var phoneNumberTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    
    typealias LOGSUCC = (Any)->()
    var loginsuccCB : LOGSUCC?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func dismissAction(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func forgatePasswordAction(_ sender: UIButton) {
        
        
    }
    
    @IBAction func loginAction(_ sender: UIButton) {
        delog("phoneNumber : \(String(describing: phoneNumberTF.text!)) ; password : \(String(describing: passwordTF.text!))")
        
        Keychain(service: kBundleID)[KeychainKeys.ins.account] = String(describing: phoneNumberTF.text!)
        Keychain(service: kBundleID)[KeychainKeys.ins.password] = String(describing: passwordTF.text!)
        
        let bodysKV : NSDictionary = [
            "grant_type":"password",
            "username":String(describing: phoneNumberTF.text!),
            "password":String(describing: passwordTF.text!),
            "scope":"app",
            "client_id":"client",
            "client_secret":"secret"
        ]
        
        
        NetHttp.ins.OAuthToken(formBody: bodysKV) { (res) in
            self.dismiss(animated: true, completion: nil)
            (self.loginsuccCB == nil) ? delog("没有实现logsuccCB") : self.loginsuccCB!(res)
        }
        
    }
    
    @IBAction func wechatLoginAction(_ sender: UIButton) {
        delog("")
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
