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
        
        let bodysKV : NSDictionary = [
            "grant_type":"password",
            "username":String(describing: phoneNumberTF.text!),
            "password":String(describing: passwordTF.text!),
            "scope":"app",
            "client_id":"client",
            "client_secret":"secret"
        ]
        
        
        NetHttp.ins.requestOAuthToken(formBody: bodysKV) { (res) in
            self.dismiss(animated: true, completion: nil)
            if res is NSDictionary {
                let dict = res as! NSDictionary
                
                /**
                 *  keychain 存储token信息
                 */
                let keys : NSArray = dict.allKeys as NSArray
                for index in 0...keys.count-1  {
                    Keychain(service: kBundleID)[keys[index] as! String] = String.init(describing: dict[keys[index] as! String]!)
                }
                
                //let keychain = Keychain(service: kBundleID)
//                Keychain(service: kBundleID)[UserTokenKeys.ins.access_token]  = String.init(describing: dict[UserTokenKeys.ins.access_token]!)
//                Keychain(service: kBundleID)[UserTokenKeys.ins.token_type]    = String.init(describing: dict[UserTokenKeys.ins.token_type]!)
//                Keychain(service: kBundleID)[UserTokenKeys.ins.refresh_token] = String.init(describing: dict[UserTokenKeys.ins.refresh_token]!)
//                Keychain(service: kBundleID)[UserTokenKeys.ins.expires_in]    = String.init(describing: dict[UserTokenKeys.ins.expires_in]!)
//                Keychain(service: kBundleID)[UserTokenKeys.ins.scope]         = String.init(describing: dict[UserTokenKeys.ins.scope]!)
                
            }
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
