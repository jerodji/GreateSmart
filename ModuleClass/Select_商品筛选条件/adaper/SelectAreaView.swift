//
//  SelectAreaView.swift
//  GreateSmart
//
//  Created by hailin on 2018/3/20.
//  Copyright © 2018年 Jerod. All rights reserved.
//

import UIKit

class SelectAreaView: UIView {
    
    var headBtn : SelecHeaderButton!
    var colecView : UIView!
    
    typealias CLICKBLK = (Bool) -> Void
    var headBtnClickCB : CLICKBLK?
    
    var state : Bool = true
    
    private var rectFrame : CGRect!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func setFrame(_ frame:CGRect) -> Void {
        rectFrame = frame
        setupSubviews()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        rectFrame = frame
        setupSubviews()
    }
    
    func setupSubviews() -> Void {
        headBtn = SelecHeaderButton.init(frame: CGRect.init(x: 15, y: 10, width: kScreenW-30, height: 60))
        headBtn.addTarget(self, action: #selector(headBtnClickAction), for: .touchUpInside)
        self.addSubview(headBtn)
        headBtn.backgroundColor = .black
        
        if rectFrame==nil { return }
        colecView = UIView()
        colecView.backgroundColor = .red
        self.addSubview(colecView)
        colecView.snp.makeConstraints { (make) in
            make.left.equalTo(headBtn)
            make.top.equalTo(headBtn.snp.bottom)
            make.right.equalTo(headBtn)
            make.bottom.equalTo(self)
        }
    }
    
    @objc func headBtnClickAction() -> Void {
        if headBtnClickCB != nil {
            if state {
                state = false
                headBtnClickCB!(false)
            } else {
                state = true
                headBtnClickCB!(true)
            }
        }
    }
    
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
