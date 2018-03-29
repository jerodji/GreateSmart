//
//  StarsView.swift
//  GreateSmart
//
//  Created by hailin on 2018/3/20.
//  Copyright © 2018年 Jerod. All rights reserved.
//

import UIKit

class StarsView: UIView,LoadXIBView {

    var starsNumber : Int = 0
    
    @IBOutlet weak var btn1: UIButton!
    @IBOutlet weak var btn2: UIButton!
    @IBOutlet weak var btn3: UIButton!
    @IBOutlet weak var btn4: UIButton!
    @IBOutlet weak var btn5: UIButton!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        btn1.setImage(UIImage.init(named: "xingxing"), for: UIControlState.normal)
        btn2.setImage(UIImage.init(named: "xingxing"), for: UIControlState.normal)
        btn3.setImage(UIImage.init(named: "xingxing"), for: UIControlState.normal)
        btn4.setImage(UIImage.init(named: "xingxing"), for: UIControlState.normal)
        btn5.setImage(UIImage.init(named: "xingxing"), for: UIControlState.normal)
    }
    
    @IBAction func action1(_ sender: UIButton) {
        btn1.setImage(UIImage.init(named: "xingxing2"), for: UIControlState.normal)
        btn2.setImage(UIImage.init(named: "xingxing"), for: UIControlState.normal)
        btn3.setImage(UIImage.init(named: "xingxing"), for: UIControlState.normal)
        btn4.setImage(UIImage.init(named: "xingxing"), for: UIControlState.normal)
        btn5.setImage(UIImage.init(named: "xingxing"), for: UIControlState.normal)
    }
    
    @IBAction func action2(_ sender: UIButton) {
        btn1.setImage(UIImage.init(named: "xingxing2"), for: UIControlState.normal)
        btn2.setImage(UIImage.init(named: "xingxing2"), for: UIControlState.normal)
        btn3.setImage(UIImage.init(named: "xingxing"), for: UIControlState.normal)
        btn4.setImage(UIImage.init(named: "xingxing"), for: UIControlState.normal)
        btn5.setImage(UIImage.init(named: "xingxing"), for: UIControlState.normal)
    }
    
    @IBAction func action3(_ sender: UIButton) {
        btn1.setImage(UIImage.init(named: "xingxing2"), for: UIControlState.normal)
        btn2.setImage(UIImage.init(named: "xingxing2"), for: UIControlState.normal)
        btn3.setImage(UIImage.init(named: "xingxing2"), for: UIControlState.normal)
        btn4.setImage(UIImage.init(named: "xingxing"), for: UIControlState.normal)
        btn5.setImage(UIImage.init(named: "xingxing"), for: UIControlState.normal)
    }
    
    @IBAction func action4(_ sender: UIButton) {
        btn1.setImage(UIImage.init(named: "xingxing2"), for: UIControlState.normal)
        btn2.setImage(UIImage.init(named: "xingxing2"), for: UIControlState.normal)
        btn3.setImage(UIImage.init(named: "xingxing2"), for: UIControlState.normal)
        btn4.setImage(UIImage.init(named: "xingxing2"), for: UIControlState.normal)
        btn5.setImage(UIImage.init(named: "xingxing"), for: UIControlState.normal)
    }
    
    @IBAction func action5(_ sender: UIButton) {
        btn1.setImage(UIImage.init(named: "xingxing2"), for: UIControlState.normal)
        btn2.setImage(UIImage.init(named: "xingxing2"), for: UIControlState.normal)
        btn3.setImage(UIImage.init(named: "xingxing2"), for: UIControlState.normal)
        btn4.setImage(UIImage.init(named: "xingxing2"), for: UIControlState.normal)
        btn5.setImage(UIImage.init(named: "xingxing2"), for: UIControlState.normal)
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
