//
//  SelectConditionVC.swift
//  GreateSmart
//
//  Created by hailin on 2018/3/20.
//  Copyright © 2018年 Jerod. All rights reserved.
//

import UIKit

class SelectConditionVC: BaseUIViewController,UITableViewDelegate,UITableViewDataSource {

    //var areas : NSMutableArray! = []
    
    var testData: String = "[\n" +
        "    {\n" +
        "        \"name\": \"品牌\",\n" +
        "        \"subMenuList\": [\n" +
        "            {\n" +
        "                \"name\": \"测试商店\",\n" +
        "                \"callBack\": \"store_123123112\"\n" +
        "            },\n" +
        "            {\n" +
        "                \"name\": \"大聪明合伙人\",\n" +
        "                \"callBack\": \"store_132423423\"\n" +
        "            },\n" +
        "            {\n" +
        "                \"name\": \"老挝海林野生特产\",\n" +
        "                \"callBack\": \"store_878979239\"\n" +
        "            }\n" +
        "        ]\n" +
        "    },\n" +
        "    {\n" +
        "        \"name\": \"类型\",\n" +
        "        \"subMenuList\": [\n" +
        "            {\n" +
        "                \"name\": \"养生\",\n" +
        "                \"subMenuList\": [\n" +
        "                    {\n" +
        "                        \"name\": \"灵芝\",\n" +
        "                        \"callBack\": 2\n" +
        "                    },\n" +
        "                    {\n" +
        "                        \"name\": \"灵芝\",\n" +
        "                        \"callBack\": 2\n" +
        "                    },\n" +
        "                    {\n" +
        "                        \"name\": \"灵芝\",\n" +
        "                        \"callBack\": 2\n" +
        "                    },\n" +
        "                    {\n" +
        "                        \"name\": \"灵芝\",\n" +
        "                        \"callBack\": 2\n" +
        "                    }\n" +
        "                ]\n" +
        "            },\n" +
        "            {\n" +
        "                \"name\": \"美颜\",\n" +
        "                \"subMenuList\": [\n" +
        "                    {\n" +
        "                        \"name\": \"面膜\",\n" +
        "                        \"callBack\": 12\n" +
        "                    },\n" +
        "                    {\n" +
        "                        \"name\": \"面膜\",\n" +
        "                        \"callBack\": 12\n" +
        "                    },\n" +
        "                    {\n" +
        "                        \"name\": \"面膜\",\n" +
        "                        \"callBack\": 12\n" +
        "                    }\n" +
        "                ]\n" +
        "            }\n" +
        "        ]\n" +
        "    },\n" +
        "    {\n" +
        "        \"name\": \"价格\",\n" +
        "        \"subMenuList\": [\n" +
        "            {\n" +
        "                \"name\": \"100以下\",\n" +
        "                \"callBack\": {\n" +
        "                    \"minPrice\": 0,\n" +
        "                    \"maxPrice\": 100\n" +
        "                }\n" +
        "            },\n" +
        "            {\n" +
        "                \"name\": \"100～500\",\n" +
        "                \"callBack\": {\n" +
        "                    \"minPrice\": 100,\n" +
        "                    \"maxPrice\": 500\n" +
        "                }\n" +
        "            },\n" +
        "            {\n" +
        "                \"name\": \"500~1000\",\n" +
        "                \"callBack\": {\n" +
        "                    \"minPrice\": 500,\n" +
        "                    \"maxPrice\": 1000\n" +
        "                }\n" +
        "            },\n" +
        "            {\n" +
        "                \"name\": \"1000~5000\",\n" +
        "                \"callBack\": {\n" +
        "                    \"minPrice\": 1000,\n" +
        "                    \"maxPrice\": 5000\n" +
        "                }\n" +
        "            },\n" +
        "            {\n" +
        "                \"name\": \"5000~10000\",\n" +
        "                \"callBack\": {\n" +
        "                    \"minPrice\": 5000,\n" +
        "                    \"maxPrice\": 10000\n" +
        "                }\n" +
        "            }\n" +
        "        ]\n" +
        "    }\n" +
    "]"
    
    
    
    //重置 确定
    var resetBtn : UIButton!
    var sureBtn  : UIButton!
    
    var tableView : BaseUITableView!
    //var colecView : UICollectionView!
    var dataList : NSArray!
    var dataArray : NSMutableArray = []
    
    var firstCount = 0
    var secondCount = 0
    
    //MARK:-
    
    
    func getSecondaryCount(_ array:NSArray) -> Void {
        for model in array {
            if model is SelectConditionModel {
                secondCount += 1
                let mo = model as! SelectConditionModel
                
                getSecondaryCount(mo.subMenuList)
                dataArray.add(model)
            }
        }
    }
    
    override func loadView() {
        super.loadView()
        
        let array = JsonTransform.arrayFromJSONString(jsonString: testData)
        dataList = SelectConditionModel().dataReader(array)
        
        firstCount = dataList.count
        getSecondaryCount(dataList)
        
        resetBtn = UIButton.init()
        sureBtn = UIButton.init()
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
    
    //MARK:-
/**
    func configSelecView() -> Void {
        let s0 = SelectAreaView.init(frame: CGRect.init(x: 0, y: kNaviH, width: kScreenW, height: 300))
        let s1 = SelectAreaView.init(frame: CGRect.init(x: 0, y: kNaviH+300+10, width: kScreenW, height: 300)) //
        areas.add(s0)
        areas.add(s1)
        self.view.addSubview(s0)
        self.view.addSubview(s1)
        
        s0.headBtnClickCB = { (status) in
            if  status {
                UIView.animate(withDuration: 1, animations: {
                    s0.height = 300
                    s1.y = kNaviH + 300 + 10
                })
            } else {
                UIView.animate(withDuration: 1, animations: {
                    s0.height = 70
                    s1.y = kNaviH + 70
                    
                })
            }
        }
        
        s1.headBtnClickCB = { (status) in
        }
    }
*/
    
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
    
    //MARK:-
    
    func configTableView()-> Void {
        
        tableView = BaseUITableView.init(frame: CGRect.init(x: 0, y: kNaviH, width: kScreenW, height: kSafeH), style: UITableViewStyle.grouped)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "selectConditionCellid")
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "selectConditionCellid")
        return cell!
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = SelecHeaderButton.init(frame: CGRect.init(x: 0, y: 0, width: kScreenW, height: 60))
        return view
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return nil
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.01
    }
    
//    //MARK: colec view
//
//    func configColecView() -> Void {
//
//        let layout = UICollectionViewFlowLayout.init()
//        layout.itemSize = CGSize.init(width: (kScreenW-15-15-10*3)/4, height: 25)
//        layout.minimumLineSpacing = 10
//        layout.minimumInteritemSpacing = 10
//        layout.sectionInset = UIEdgeInsets.init(top: 10, left: 15, bottom: 10, right: 15)
//        //layout.headerReferenceSize = CGSize.init(width: kScreenW, height: 60)
//
//
//        colecView = UICollectionView.init(frame: CGRect.init(x: 0, y: kNaviH, width: kScreenW, height: kSafeH), collectionViewLayout: layout)
//        colecView.backgroundColor = .white
//        colecView.delegate = self
//        colecView.dataSource = self
//        colecView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "selectcolecViewcellid")
//        colecView.register(UICollectionReusableView.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "selectcolectheaderviewid")
//        self.view.addSubview(colecView)
//    }
//
//    func numberOfSections(in collectionView: UICollectionView) -> Int {
//        return firstCount
//    }
//
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//
//        let model = dataList[section] as! SelectConditionModel
//        if model.subMenuList[0] is SelectConditionModel {
//            return model.subMenuList.count
//        }
//        else if model.subMenuList[0] is SubMenuModel {
//            return model.subMenuList.count
//        }
//        else {
//            return 0
//        }
//
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "selectcolecViewcellid", for: indexPath)
//        cell.backgroundColor = UIColor.RGB(236, 236, 236)
//        return cell
//    }
//
//    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
//        let headview = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "selectcolectheaderviewid", for: indexPath)
//        headview.backgroundColor = UIColor.gray
//        let btn = SelecHeaderButton.init(frame: headview.bounds)
//        btn.tag = indexPath.section
//        btn.addTarget(self, action: #selector(headBtnAction(button:)), for: UIControlEvents.touchUpInside)
//        headview.addSubview(btn)
//        return headview
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
////        if section==1 {
////            return CGSize.init(width: kScreenW, height: 10)
////        }
//        return CGSize.init(width: kScreenW, height: 60)
//    }
//
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        delog("click \(indexPath)")
////        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "selectcolecViewcellid", for: indexPath)
////        cell.backgroundColor = UIColor.gray
//    }
    
    
    @objc func headBtnAction(button:SelecHeaderButton) -> Void {
        
        switch button.tag {
        case 0:
            delog("哎呀")
        default:
            break
        }
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
