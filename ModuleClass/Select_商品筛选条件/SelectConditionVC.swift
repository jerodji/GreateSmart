//
//  SelectConditionVC.swift
//  GreateSmart
//
//  Created by hailin on 2018/3/20.
//  Copyright © 2018年 Jerod. All rights reserved.
//

import UIKit

class SelectConditionVC: BaseUIViewController {

    var areas : NSMutableArray! = []
    
    //重置 确定
    var resetBtn : UIButton!
    var sureBtn  : UIButton!
    
    //MARK:-
    
    override func loadView() {
        super.loadView()
        
        let selec0 = SelectAreaView.init(frame: CGRect.init(x: 0, y: kNaviH, width: kScreenW, height: 300))
        areas.add(selec0)
        let selec1 = SelectAreaView.init(frame: CGRect.init(x: 0, y: kNaviH+300, width: kScreenW, height: 300))
        areas.add(selec1)
        
        resetBtn = UIButton.init()
        sureBtn = UIButton.init()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        naviBar.titleLab.text = "筛选"
        
        configSelecView()
        configBottomButton()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        UIView.animate(withDuration: 0.5) {
            self.tabBarController?.tabBar.y = kScreenH
        }
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        resetBtn.frame = CGRect.init(x: 0, y: kScreenH-kHomeIndicatorH-49, width: kScreenW/2, height: 49+kHomeIndicatorH)
        sureBtn.frame  = CGRect.init(x: kScreenW/2, y: kScreenH-kHomeIndicatorH-49, width: kScreenW/2, height: 49+kHomeIndicatorH)
        
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        UIView.animate(withDuration: 0.5) {
            self.tabBarController?.tabBar.y = kScreenH-kTabbarH
        }
    }
    
    //MARK:-
    
    func configSelecView() -> Void {
        let s0 = areas[0] as! SelectAreaView
        let s1 = areas[1] as! SelectAreaView
        
        s0.headBtnClickCB = { (status) in
            if  status {
                UIView.animate(withDuration: 1, animations: {
                    s0.frame = CGRect.init(x: 0, y: kNaviH, width: kScreenW-30, height: 300)
                    s1.frame = CGRect.init(x: 0, y: s0.bottom, width: kScreenW-30, height: 300)
                })
            } else {
//                UIView.animate(withDuration: 1, animations: {
////                    s0.y = kNaviH
////                    s1.y = kNaviH+60+10
////                    s0.height = 60
//                    s0.frame = CGRect.init(x: 0, y: kNaviH, width: kScreenW-30, height: 60)
////                    s1.frame = CGRect.init(x: 0, y: kNaviH+60+10, width: kScreenW-30, height: 300)
//                })
                
//                [UIView animateWithDuration:1.0 delay:1.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
//
//                    }completion:^(BOOLfinished){
//
//                    }];
                
                UIView.animateKeyframes(withDuration: 1, delay: 0, options: UIViewKeyframeAnimationOptions.calculationModeCubic, animations: {
                    s0.frame = CGRect.init(x: 0, y: kNaviH, width: kScreenW-30, height: 60)
                }, completion: { (finished) in
                    
                })
                
            }
        }
        
        
        s1.headBtnClickCB = { (status) in
            delog("11111")
        }
        
        view.addSubview(s0)
        view.addSubview(s1)
    }
    
    func configBottomButton() -> Void {
        resetBtn.setTitle("重置", for: .normal)
        resetBtn.backgroundColor = UIColor.RGB(132, 130, 130)
        sureBtn.setTitle("确定", for: .normal)
        sureBtn.backgroundColor = UIColor.RGB(54, 54, 54)
        resetBtn.addTarget(self, action: #selector(resetACtion), for: .touchUpInside)
        sureBtn.addTarget(self, action: #selector(sureAction), for: .touchUpInside)
        view.addSubview(resetBtn)
        view.addSubview(sureBtn)
    }
    @objc func resetACtion ()->Void {
    }
    @objc func sureAction () -> Void {
        self.navigationController?.popViewController(animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
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
