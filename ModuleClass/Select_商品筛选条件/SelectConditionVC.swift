//
//  SelectConditionVC.swift
//  GreateSmart
//
//  Created by hailin on 2018/3/20.
//  Copyright © 2018年 Jerod. All rights reserved.
//

import UIKit

class SelectConditionVC: BaseUIViewController,UITableViewDelegate,UITableViewDataSource {

    var tableView : BaseUITableView!
    var dataList : NSArray!
    
    /** 重置 */
    var resetBtn : UIButton!
    /** 确定 */
    var sureBtn  : UIButton!
    
    /** 全部展开后实际的cell高度 */
    var heightsDict : NSDictionary!
    /** 映射的cell高度 */
    var mappingHeights : NSMutableDictionary! = [:]
    /** 初始的默认展开状态,都是false */
    var zkDict : NSDictionary!
    /** 映射的展开状态 */
    var mappingZKs : NSMutableDictionary = [:]
    
    
    //MARK:- 生命周期
    
    override func loadView() {
        super.loadView()
        
        resetBtn = UIButton.init()
        sureBtn = UIButton.init()
        
        /** 从网络获取数据 */
        let array = JsonTransform.arrayFromJSONString(jsonString: testSelectConditionData)
        dataList = SelectConditionModel().dataReader(array)
        
        /** 全部展开的cell高度 */
        heightsDict = SelectConditionModel.getfullHeightsWithArray(dataList)
        /** 映射初始的cell高度 - 1层映射为0,2层映射为0(标题的高度70) */
        for key in 0...heightsDict.count-1 {
            let array = heightsDict.object(forKey: key) as! NSArray
            let mappingArr = NSMutableArray.init(array: array)
            for index in 0...array.count-1 {
                if array.count > 1 {
                    mappingArr.replaceObject(at: index, with: 0) //70
                } else {
                    mappingArr.replaceObject(at: index, with: 0)
                }
            }
            mappingHeights.setObject(mappingArr, forKey: key as NSCopying)
        }
        
        /** 映射初始的展开状态 */
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
        configBottomButton()
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
        
        tableView = BaseUITableView.init(frame: CGRect.init(x: 0, y: kNaviH, width: kScreenW, height: kValidH), style: UITableViewStyle.grouped)
        tableView.backgroundColor = UIColor.white
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
        
        //大于0时添加分割线
        if indexPath.row>0 {
            let line = UIView.init(frame: CGRect.init(x: 15, y: 0, width: kScreenW-30, height: 1))
            line.backgroundColor = UIColor.RGB(241, 241, 241)
            cell?.addSubview(line)
        }
        
        cell!.cellHeadBtnClickCB = {
            self.reloadHeight(section: indexPath.section, row: indexPath.row, isSectionHeadClick:false)
        }
        
        let h = (mappingHeights.object(forKey: indexPath.section) as! NSArray).object(at: indexPath.row) as! CGFloat

            if h==CGFloat(0) || h==CGFloat(70) {
                cell?.btnsView?.isHidden = true
            } else {
                cell?.btnsView?.isHidden = false
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
        
        reloadHeight(section: button.section!, row: 0, isSectionHeadClick:true)

//        switch button.tag {
//        case 0:
//            delog("哎呀")
//        default:
//            break
//        }
        
    }
    
    //MARK: 刷新高度
    /**
     映射到 mappingHeights, 展开:从 heightsDict 映射过来, 收起:将 0 映射过来.
     Section Head Click ,row需要传入0,不能小于0
     */
    func reloadHeight(section:Int,row:Int,isSectionHeadClick:Bool) {
        
        /**
         更新展开状态映射
         */
        let ar = mappingZKs.object(forKey: section) as! NSMutableArray
        let ZKstats = ar.object(at: row) as! Bool
        if ZKstats {
            ar.replaceObject(at: row, with: false)
        } else {
            ar.replaceObject(at: row, with: true)
        }
        mappingZKs.setObject(ar, forKey: section as NSCopying)
        
        /**
         更新高度状态映射
         */
        let a = mappingHeights.object(forKey: section) as! NSArray //heightsDict
        let arr = heightsDict.object(forKey: section) as! NSArray
        let mappingArr = NSMutableArray.init(array: a)
        let ZK = (mappingZKs.object(forKey: section) as! NSMutableArray).object(at: row) as! Bool
        
        if isSectionHeadClick {
            /** 点击section head title */
            for i in 0...mappingArr.count-1 {
                if ZK {
                    if self.tableView.numberOfRows(inSection: section) > 1 {
                        mappingArr.replaceObject(at: i, with: 70)
                    } else {
                        mappingArr.replaceObject(at: i, with: arr[i])
                    }
                } else {
                    mappingArr.replaceObject(at: i, with: 0)
                }
            }
        } else {
            /** 点击cell title */
            if !ZK {
                mappingArr.replaceObject(at: row, with: arr.object(at: row))
            } else {
                if self.tableView.numberOfRows(inSection: section) > 1 {
                    mappingArr.replaceObject(at: row, with: 70)
                } else {
                    mappingArr.replaceObject(at: row, with: 0)
                }
            }
        }
        
        mappingHeights.setObject(mappingArr, forKey: section as NSCopying)
        
        /**
         最终的刷新
         */
        self.tableView.reloadData()
    }
    
}
