//
//  SearchRecordTitleView.swift
//  GreateSmart
//
//  Created by hailin on 2018/2/28.
//  Copyright © 2018年 Jerod. All rights reserved.
//

import UIKit

enum SearchRecordType: String {
    case
    History = "history",
    Hot = "hot"
}

class SearchRecordTitleView: UIView,LoadXIBView {

    var type: SearchRecordType?
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var delecBtn: UIButton!
    
    @IBAction func deleteAction(_ sender: Any) {
        if type==SearchRecordType.History {
            delog("History")
        }
        if type==SearchRecordType.Hot {
            delog("Hot")
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
