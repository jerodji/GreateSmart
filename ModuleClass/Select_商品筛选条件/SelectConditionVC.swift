//
//  SelectConditionVC.swift
//  GreateSmart
//
//  Created by hailin on 2018/3/20.
//  Copyright © 2018年 Jerod. All rights reserved.
//

import UIKit

class SelectConditionVC: BaseUIViewController,UITableViewDelegate,UITableViewDataSource {

    //重置 确定
    var resetBtn : UIButton!
    var sureBtn  : UIButton!
    
    var tableView : BaseUITableView!
    //var colecView : UICollectionView!
    var dataList : NSArray!
    //var dataArray : NSMutableArray = []
    
    var heightsDict : NSDictionary! /* 全部展开后实际的cell高度 */
    var mappingHeights : NSMutableDictionary! = [:] /* 映射的cell高度 */
    var zkDict : NSDictionary!
    var mappingZKs : NSMutableDictionary = [:]
    
    var firstCount = 0
    var secondCount = 0
    
    //MARK:-
    
    func getSecondaryCount(_ array:NSArray) -> Void {
        for model in array {
            if model is SelectConditionModel {
                secondCount += 1
                let mo = model as! SelectConditionModel
                
                getSecondaryCount(mo.subMenuList)
//                dataArray.add(model)
            }
        }
        
    }


    
    override func loadView() {
        super.loadView()
        
        resetBtn = UIButton.init()
        sureBtn = UIButton.init()
        
        let array = JsonTransform.arrayFromJSONString(jsonString: testSelectConditionData)
        dataList = SelectConditionModel().dataReader(array)
        
        firstCount = dataList.count
        getSecondaryCount(dataList)
        
        
        heightsDict = SelectConditionModel.getfullHeightsWithArray(dataList) /* 全部展开的cell高度 */
        /**
         初始的cell高度 - 全部映射为0
         */
        for key in 0...heightsDict.count-1 {
            let array = heightsDict.object(forKey: key) as! NSArray
            let mappingArr = NSMutableArray.init(array: array)
            for index in 0...array.count-1 {
                mappingArr.replaceObject(at: index, with: 0)
            }
            mappingHeights.setObject(mappingArr, forKey: key as NSCopying)
        }
        
        zkDict = SelectConditionModel.getfullIsZKStatus(dataList)
        for key in 0...zkDict.count-1 {
            let ar = zkDict.object(forKey: key) as! NSArray
            let mapAr = NSMutableArray.init(array: ar)
            mappingZKs.setObject(mapAr, forKey: key as NSCopying)
        }
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        naviBar.titleLab.text = "筛选"
        
        //configSelecView()
        configBottomButton()
        //configColecView()
        configTableView()
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
    
    //MARK:- 重置 确定 按钮
    
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
    
    //MARK:- tableView
    
    func configTableView()-> Void {
        
        tableView = BaseUITableView.init(frame: CGRect.init(x: 0, y: kNaviH, width: kScreenW, height: kSafeH), style: UITableViewStyle.grouped)
        tableView.separatorStyle = .none
        tableView.delegate = self
        tableView.dataSource = self
        //tableView.register(SelectConditionCell.self, forCellReuseIdentifier: "selectConditionCellid")
        view.addSubview(tableView)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return dataList.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let model = dataList[section] as! SelectConditionModel
        if model.subMenuList[0] is SelectConditionModel {
            return model.subMenuList.count
        }
        else {
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "selectConditionCellid") as? SelectConditionCell
        if cell==nil {
            cell = SelectConditionCell.init(style: .default, reuseIdentifier: "selectConditionCellid")
            cell!.selectionStyle = .none
            let model = dataList.object(at: indexPath.section) as! SelectConditionModel
            cell!.setModelWithArray(model.subMenuList, section: indexPath.section, row: indexPath.row)
        }
        
        let h = (mappingHeights.object(forKey: indexPath.section) as! NSArray).object(at: indexPath.row) as! CGFloat
        if h==CGFloat(0) {
            cell?.isHidden = true
        } else {
            cell?.isHidden = false
        }
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let array = mappingHeights.object(forKey: indexPath.section) as! NSArray
        return array.object(at: indexPath.row) as! CGFloat
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let view = SelecHeadView.init(frame: CGRect.init(x: 0, y: 0, width: kScreenW, height: 60))
        view.btn.setImage(UIImage.init(named: "xia2"), for: .normal)
        view.btn.setBackgroundImage(UIImage.init(named: "testPi"), for: .normal)
        view.btn.addTarget(self, action: #selector(headBtnAction(button:)), for: UIControlEvents.touchUpInside)
        view.btn.section = section
        view.btn.row = 0
        let model = dataList.object(at: section) as! SelectConditionModel
        view.setHeadTitle(model)
        
        return view
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return nil
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0
    }
    
    @objc func headBtnAction(button:SelecHeaderButton) -> Void {
        
        let ar = mappingZKs.object(forKey: button.section!) as! NSMutableArray
        let stats = ar.object(at: button.row!) as! Bool
        reloadHeight(isZK: stats, section: button.section!, row: -1)
        if stats {
            ar.replaceObject(at: button.row!, with: false)
        } else {
            ar.replaceObject(at: button.row!, with: true)
        }
        
//        switch button.tag {
//        case 0:
//            delog("哎呀")
//        default:
//            break
//        }
        
    }
    
    /*  MARK: 刷新高度
     映射到 mappingHeights, 展开:从 heightsDict 映射过来, 收起:将 0 映射过来.
     row < 0 表示 所有此section种的row都置为0
     */
    func reloadHeight(isZK:Bool,section:Int,row:Int) {
        
        let arr = heightsDict.object(forKey: section) as! NSArray
        let mappingArr = NSMutableArray.init(array: arr)
        
        if row<0 {
            for i in 0...mappingArr.count-1 {
                //mappingArr.replaceObject(at: i, with: 0)
                if isZK {
                    mappingArr.replaceObject(at: i, with: arr[i])
                } else {
                    mappingArr.replaceObject(at: i, with: 0)
                }
            }
        } else {
            if isZK {
                mappingArr.replaceObject(at: row, with: arr[row])
            } else {
                mappingArr.replaceObject(at: row, with: 0)
            }
        }
        
        mappingHeights.setObject(mappingArr, forKey: section as NSCopying)
        
        self.tableView.reloadData()
    }
    
}
