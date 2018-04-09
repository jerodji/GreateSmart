//
//  AddressCell.swift
//  GreateSmart
//
//  Created by Jerod on 2018/4/2.
//  Copyright © 2018年 Jerod. All rights reserved.
//

import UIKit

class AddressCell: UITableViewCell {

    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var addLine: UIView!
    
    @IBOutlet weak var addBtnHeight: NSLayoutConstraint!
    
    @IBOutlet weak var addBtn: UIButton!
    
    @IBOutlet weak var nameLab: UILabel!
    @IBOutlet weak var phoneLab: UILabel!
    @IBOutlet weak var addressLab: UILabel!
    
    @IBOutlet weak var setDefBtn: UIButton!
    @IBOutlet weak var changeBtn: UIButton!
    @IBOutlet weak var deleteBtn: UIButton!
    
    typealias AddBLK = ()->()
    var AddCb : AddBLK?
    
    typealias DfBlk = ()->()
    var changeDfCB : DfBlk?
    
    typealias ChangeBLK = ()->()
    var changeCb : ChangeBLK?
    
    typealias DeleteBLK = ()->()
    var deleteCb : DeleteBLK?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backView.layer.cornerRadius = 5
        backView.layer.borderWidth = 1
        backView.layer.borderColor = kcolor183.cgColor
        
        changeBtn.layer.cornerRadius = 5
        changeBtn.layer.borderWidth = 1
        changeBtn.layer.borderColor = UIColor.RGB(44, 46, 48).cgColor
        
        deleteBtn.layer.cornerRadius = 5
        deleteBtn.layer.borderWidth = 1
        deleteBtn.layer.borderColor = UIColor.RGB(44, 46, 48).cgColor
    }
    
    @IBAction func addAction(_ sender: UIButton) {
        (AddCb == nil) ? delog("没有实现changeDfCB") : AddCb!()
    }
    
    @IBAction func setDefauletAction(_ sender: UIButton) {
        (changeDfCB == nil) ? delog("没有实现changeDfCB") : changeDfCB!()
    }
    
    @IBAction func changeAction(_ sender: UIButton) {
        (changeCb == nil) ? delog("没有实现changeCb") : changeCb!()
    }
    
    @IBAction func deleteAction(_ sender: UIButton) {
        (deleteCb == nil) ? delog("没有实现deleteCb") : deleteCb!()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
