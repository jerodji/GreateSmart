//
//  EvaluationCell.swift
//  GreateSmart
//
//  Created by hailin on 2018/3/19.
//  Copyright © 2018年 Jerod. All rights reserved.
//

import UIKit

private class LeftView: UIView {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.red
    }
}

private class RightView: UIView {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.yellow
    }
}

class EvaluationCell: UITableViewCell,UIScrollViewDelegate {

    private var frameRect:CGRect!
    @IBOutlet weak var leftBtn: UIButton!
    @IBOutlet weak var rightBtn: UIButton!
    @IBOutlet weak var blackLine: UIView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var lookMoreBtn: UIButton!
    
    private var leftV : LeftView!
    private var rightV: RightView!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        leftV = LeftView.init(frame: CGRect.init(x: 0, y: 0, width: kScreenW, height: 200))
        rightV = RightView.init(frame: CGRect.init(x: kScreenW, y: 0, width: kScreenW, height: 200))
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        blackLine.frame = CGRect.init(x: (kScreenW/2-96)/2, y: 37, width: 96, height: 3)
        leftBtn.addTarget(self, action: #selector(leftAction), for: UIControlEvents.touchUpInside)
        rightBtn.addTarget(self, action: #selector(rightAction), for: UIControlEvents.touchUpInside)
        lookMoreBtn.addTarget(self, action: #selector(lookMoreAction), for: UIControlEvents.touchUpInside)
        scrollView.contentSize = CGSize.init(width: 2*kScreenW, height: 1)
        scrollView.isPagingEnabled = true
        scrollView.delegate = self
        scrollView.addSubview(leftV)
        scrollView.addSubview(rightV)
    }
    
    @objc func leftAction() -> Void {
        UIView.animate(withDuration: 0.3) {
            self.leftBtnState()
        }
    }
    
    @objc func rightAction() -> Void {
        UIView.animate(withDuration: 0.3) {
            self.rightBtnState()
        }
    }
    
    @objc func lookMoreAction() -> Void {
        delog("lookMoreAction")
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offXPercentage = scrollView.contentOffset.x/kScreenW
        self.blackLine.x = (kScreenW/2-96)/2 + kScreenW/2 * offXPercentage
    }
    
    func leftBtnState() -> Void {
        self.blackLine.frame = CGRect.init(x: (kScreenW/2-96)/2, y: 37, width: 96, height: 3)
        self.rightBtn.setTitleColor(UIColor.RGB(183, 183, 183), for: .normal)
        self.leftBtn.setTitleColor(UIColor.RGB(39, 39, 39), for: .normal)
        scrollView.contentOffset.x = 0
    }
    func rightBtnState() -> Void {
        self.blackLine.frame = CGRect.init(x: kScreenW/2 + (kScreenW/2-96)/2, y: 37, width: 96, height: 3)
        self.leftBtn.setTitleColor(UIColor.RGB(183, 183, 183), for: .normal)
        self.rightBtn.setTitleColor(UIColor.RGB(39, 39, 39), for: .normal)
        scrollView.contentOffset.x = kScreenW
    }
    
    func setFrame(_ frame:CGRect) -> Void {
        frameRect = frame
    }
    
//    override func draw(_ rect: CGRect) {
//
//    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
}
