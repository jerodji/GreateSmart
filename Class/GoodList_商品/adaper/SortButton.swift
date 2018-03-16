//
//  SortButton.swift
//  GreateSmart
//
//  Created by hailin on 2018/3/16.
//  Copyright © 2018年 Jerod. All rights reserved.
//

import UIKit

class SortButton: UIButton {

    var upStatus : Bool = true
    var titleOrigin: CGPoint = CGPoint.init(x: 0, y: 0)
    var titleSize: CGSize = CGSize.init(width: 0, height: 0)
    var customLabel : UILabel!
    private var normalColor:UIColor = UIColor.clear
    private var heightColor:UIColor = UIColor.clear
    private var upImageView:UIImageView!
    private var downImageView:UIImageView!
    private var upImg = ""
    private var upHeightImg = ""
    private var downImg = ""
    private var downHeightImg = ""
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupUI()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    func setupUI() -> Void {
        
        customLabel = UILabel.init()
        customLabel.font = UIFont.systemFont(ofSize: 12)
        customLabel.textColor = RGB(183, 183, 183)
        self.addSubview(customLabel)
        
        self.addTarget(self, action: #selector(setHeighColor), for: UIControlEvents.touchDown)
        self.addTarget(self, action: #selector(defaultAction), for: UIControlEvents.touchUpInside)
    }
    
    func jj_setTitle(_ title:String?) -> Void {
        
        var tl = title
        if title == nil {
            tl = ""
        }
        
        customLabel.text = tl
        customLabel.sizeToFit()
        customLabel.frame = CGRect.init(x: self.size.width/2-(customLabel.size.width+10)/2,
                                         y: self.size.height/2-customLabel.size.height/2,
                                         width: customLabel.size.width,
                                         height: customLabel.size.height)
        
        titleOrigin = customLabel.frame.origin
        titleSize = customLabel.frame.size
        
    }
    
    // 在设置完title后调用
    func jj_setUpImage(name:String?,heighName:String?) -> Void {
        
        if name == nil || heighName == nil {
            return
        }
        
        upImg = name!
        upHeightImg = heighName!
        
        upImageView = UIImageView.init(image: UIImage.init(named: upHeightImg))
        upImageView.frame = CGRect.init(x: titleOrigin.x + titleSize.width,
                                    y: (self.bounds.size.height-15)/2,
                                    width: 10,
                                    height: 5)
        
        self.addSubview(upImageView)
    }
    
    func jj_setDownImage(name:String?,heighName:String?) -> Void {
        
        if name == nil || heighName == nil {
            return
        }
        
        downImg = name!
        downHeightImg = heighName!
        
        downImageView = UIImageView.init(image: UIImage.init(named: downImg))
        downImageView.frame = CGRect.init(x: titleOrigin.x + titleSize.width,
                                    y: (self.bounds.size.height-15)/2 + 5 + 5,
                                    width: 10,
                                    height: 5)
        
        self.addSubview(downImageView)
    }
    
    func jj_setBackgroundColor(color:UIColor, heighColor:UIColor) -> Void {
        normalColor = color
        heightColor = heighColor
        self.backgroundColor = normalColor
    }
    
    @objc func setHeighColor() -> Void {
        self.backgroundColor = heightColor
    }
    
    @objc func defaultAction() -> Void {
        
        self.backgroundColor = normalColor
        
        if self.upStatus
        {
            self.upStatus = false
            if upImageView==nil || downImageView==nil {
                return
            }
            upImageView.image = UIImage.init(named: upImg)
            downImageView.image = UIImage.init(named: downHeightImg)
        }
        else
        {
            self.upStatus = true
            if upImageView==nil || downImageView==nil {
                return
            }
            upImageView.image = UIImage.init(named: upHeightImg)
            downImageView.image = UIImage.init(named: downImg)
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
