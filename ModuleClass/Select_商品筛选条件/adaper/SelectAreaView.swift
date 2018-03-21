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
    var contentView : UIView!
    
    typealias CLICKBLK = (Bool) -> Void
    var headBtnClickCB : CLICKBLK?
    
    var state : Bool = true
    private var cotentViewHeight :CGFloat = 0
    
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
        
        self.backgroundColor = UIColor.purple
        
        cotentViewHeight = rectFrame.size.height - 60 - 10
        
        headBtn = SelecHeaderButton.init(frame: CGRect.init(x: 15, y: 10, width: kScreenW-30, height: 60))
        headBtn.addTarget(self, action: #selector(headBtnClickAction), for: .touchUpInside)
        self.addSubview(headBtn)
        headBtn.backgroundColor = .black
        
        if rectFrame==nil { return }
        
        contentView = UIView()
        contentView.frame = CGRect.init(x: 15, y: headBtn.bottom, width: kScreenW-30, height: rectFrame.size.height-70)
        contentView.backgroundColor = .lightGray
        self.addSubview(contentView)
        
    }
    
    @objc func headBtnClickAction() -> Void {
        if headBtnClickCB != nil {
            if state {
                state = false
                
                UIView.animate(withDuration: 1, animations: {
                    self.contentView.height = 0
                    //self.height = 70
                })
                
                
                headBtnClickCB!(false)
                
            } else {
                state = true
                
                UIView.animate(withDuration: 1, animations: {
                    self.contentView.height = self.cotentViewHeight
                    //self.height = 70 + self.cotentViewHeight
                })
                
                
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
