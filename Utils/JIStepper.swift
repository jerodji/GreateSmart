//
//  JIStepper.swift
//  GreateSmart
//
//  Created by hailin on 2018/3/27.
//  Copyright © 2018年 Jerod. All rights reserved.
//

import UIKit

class JIStepper: UIView {

    var subBtn : UIButton = UIButton()
    var addBtn : UIButton = UIButton()
    var numLabel : UILabel = UILabel()
    
    var number : UInt {
        get {
            return numRecord
        }
    }
    private var numRecord : UInt = 0
    
    private let btnwid = CGFloat(25) /** 加 减 按钮的宽度都是25 */
    private var rectFrame : CGRect = CGRect.init(x: 0, y: 0, width: 0, height: 0)
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    // 如果从xib加载需要设置 setFrame
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
        
        self.layer.cornerRadius = 5
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.init(red: 183.0/255.0, green: 183.0/255.0, blue: 183.0/255.0, alpha: 1).cgColor
        self.layer.masksToBounds = true
        
        subBtn.frame = CGRect.init(x: 0, y: 0, width: btnwid, height: rectFrame.size.height)
        addBtn.frame = CGRect.init(x: rectFrame.size.width - btnwid, y: 0, width: btnwid, height: rectFrame.size.height)
        numLabel.frame = CGRect.init(x: btnwid, y: 0, width: rectFrame.size.width - 2*btnwid, height: rectFrame.size.height)
        
        numLabel.layer.borderWidth = 1
        numLabel.layer.borderColor = UIColor.init(red: 183.0/255.0, green: 183.0/255.0, blue: 183.0/255.0, alpha: 1).cgColor
        
        subBtn.addTarget(self, action: #selector(subtractAction), for: .touchUpInside)
        addBtn.addTarget(self, action: #selector(addAction), for: .touchUpInside)
        subBtn.addTarget(self, action: #selector(subHeightLightAction), for: .touchDown)
        addBtn.addTarget(self, action: #selector(addHeightLightAction), for: .touchDown)
        
        subBtn.setImage(UIImage.init(named: "jianhao"), for: .normal)
        addBtn.setImage(UIImage.init(named: "jiahao"), for: .normal)
        
        numLabel.textAlignment = .center
        numLabel.textColor = UIColor.init(red: 183.0/255.0, green: 183.0/255.0, blue: 183.0/255.0, alpha: 1)
        numLabel.font = UIFont.systemFont(ofSize: 14)
        numLabel.text = "\(numRecord)" /*初始默认值*/
        
        self.addSubview(subBtn)
        self.addSubview(addBtn)
        self.addSubview(numLabel)
    }
    
    @objc func subtractAction() -> Void {
        subBtn.backgroundColor = UIColor.clear
        if numRecord <= 0 {
            numRecord = 0
            numLabel.text = "\(numRecord)"
        }
        else {
            numRecord -= 1
            numLabel.text = "\(numRecord)"
        }
    }
    
    @objc func addAction() -> Void {
        addBtn.backgroundColor = UIColor.clear
        numRecord += 1
        numLabel.text = "\(numRecord)"
    }
    
    @objc func subHeightLightAction() -> Void {
        subBtn.backgroundColor = UIColor.black
    }
    
    @objc func addHeightLightAction() -> Void {
        addBtn.backgroundColor = UIColor.black
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
