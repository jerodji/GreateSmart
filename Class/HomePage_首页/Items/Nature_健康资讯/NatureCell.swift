//
//  NatureCell.swift
//  GreateSmart
//
//  Created by hailin on 2018/3/14.
//  Copyright © 2018年 Jerod. All rights reserved.
//

import UIKit

class NatureCell: UIView,LoadXIBView {
    
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var lookButton: UIButton!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        
//        imgView.backgroundColor = .red
//        titleLabel.backgroundColor = .yellow
        
        self.layer.cornerRadius = 15
        self.layer.masksToBounds = true
        
//        self.layer.shadowColor = UIColor.black.cgColor
//        self.layer.shadowRadius = 15
//        self.layer.shadowOpacity = 0.4
        
        self.layer.borderWidth = 1
        self.layer.borderColor = ColorRGBA(r: 83, g: 83, b: 83, a: 0.4).cgColor
    }
    
//    func setFrame(_ frame:CGRect) -> Void {
//
//    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
