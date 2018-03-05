//
//  SearchVC.swift
//  GreateSmart
//
//  Created by hailin on 2018/2/25.
//  Copyright © 2018年 Jerod. All rights reserved.
//

import UIKit

//class HistoryModel: BaseModel {
//    var historyList: List<String>!
//}

class SearchVC: BaseUIViewController,UITableViewDelegate,UITableViewDataSource {
    
    private let SearchHistoryCellid = "SearchHistoryCellid"
    private let HistoryCellH = CGFloat(44)
    
    private let textField = JJTextField.init()
//    private let historyModel = HistoryModel()
    let historyList = NSMutableArray.init()
    
    private let hotList = NSMutableArray.init()
    private let table = BaseUITableView()
    private let historyTitle = SearchRecordTitleView.loadFromXIB()
    private let hotTitle = SearchRecordTitleView.loadFromXIB()
    private let flowCtrl = FlowCollectionControl.init()
    
    private let HitsotyDBManager = JJRealmManager.init()
    private let HistoryDBName = "search_history"
    
    override func loadView() {
        super.loadView()
        
        let imgv = UIImageView()
        imgv.sd_setImage(with: URL.init(string: ""), completed: nil)
        
        
        //MARK: 获取数据
        historyList.addObjects(from: ["111","222","333","4","5"])
//        historyModel.historyList = List()
//        historyModel.historyList.append(objectsIn: ["111","222","333","4"])
//        historyModel.historyList.append("5")
        
        hotList.addObjects(from: ["a","2sdf22","xvb","kshjdk","wyerio","kzbxckjv","jqowieuroj","askjdfhlanvkahjefo","akshdfln","lkha","a","2sdf22","xvb","kshjdk","wyerio","kzbxckjv","jqowieuroj","askjdfhlanvkahjefo","akshdfln","lkha","a","2sdf22","xvb","kshjdk","wyerio","kzbxckjv","jqowieuroj","askjdfhlanvkahjefo","akshdfln","lkha","a","2sdf22","xvb","kshjdk","wyerio","kzbxckjv","jqowieuroj","askjdfhlanvkahjefo","akshdfln","lkha","a","2sdf22","xvb","kshjdk","wyerio","kzbxckjv","jqowieuroj","askjdfhlanvkahjefo","akshdfln","lkha","a","2sdf22","xvb","kshjdk","wyerio","kzbxckjv","jqowieuroj","askjdfhlanvkahjefo","akshdfln","lkha","a","2sdf22","xvb","kshjdk","wyerio","kzbxckjv","jqowieuroj","askjdfhlanvkahjefo","akshdfln","lkha","a","2sdf22","xvb","kshjdk","wyerio","kzbxckjv","jqowieuroj","askjdfhlanvkahjefo","akshdfln","lkha","a","2sdf22","xvb","kshjdk","wyerio","kzbxckjv","jqowieuroj","askjdfhlanvkahjefo","akshdfln","lkha","a","2sdf22","xvb","kshjdk","wyerio","kzbxckjv","jqowieuroj","askjdfhlanvkahjefo","akshdfln","lkha","a","2sdf22","xvb","kshjdk","wyerio","kzbxckjv","jqowieuroj","askjdfhlanvkahjefo","akshdfln","lkha","a","2sdf22","xvb","kshjdk","wyerio","kzbxckjv","jqowieuroj","askjdfhlanvkahjefo","akshdfln","lkha"]
        )
        
//        realmHitsoty = JJRealmManager.createDB(name: HistoryDataBase)
        
        HitsotyDBManager.createDB(name: HistoryDBName)
        
//        HitsotyDBManager.database?.add(historyModel)
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.naviBar.titleLab.isHidden = true
        self.naviBar.rightItemBtn.isHidden = true
        configTextField()
        configSubviews()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = true
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.tabBarController?.tabBar.isHidden = false
    }
    
    //MARK: navi上的搜索框
    func configTextField() -> () {
        
        textField.frame = CGRect.init(x: self.naviBar.leftItemBtn.right, y: kStatusH+4, width: self.naviBar.right-self.naviBar.leftItemBtn.right-20, height: 35)
        self.naviBar.addSubview(textField)
        
        textField.returnCB = { (searchStr)->() in
            if NotFullSpace(searchStr) {
                let resultVC = ResultVC()
                resultVC.keyword = searchStr
                self.navigationController?.pushViewController(resultVC, animated: true)
            } else {
                delog("请输入搜索内容")
            }
        }
    }
    
    //MARK: 历史记录,热门搜索
    func configSubviews() -> () {
        
        //MARK: 历史记录title
        //let historyTitle = SearchRecordTitleView.loadFromXIB()
        //historyTitle.frame = CGRect.init(x: 0, y: kNaviH, width: kScreenW, height: 52)
        historyTitle.titleLabel.text = "历史记录"
        historyTitle.type = SearchRecordType.History

        //MARK: 历史记录tableview
        //table.frame = CGRect.init(x: 20, y: historyTitle.bottom, width: kScreenW-40, height: HistoryCellH * CGFloat(5))
        table.delegate = self
        table.dataSource = self
        table.register(UINib.init(nibName: "SearchHistoryCell", bundle: nil), forCellReuseIdentifier: SearchHistoryCellid)
        table.isScrollEnabled = false

        //MARK: 热门搜索title
        //let hotTitle = SearchRecordTitleView.loadFromXIB()
        //hotTitle.frame = CGRect.init(x: 0, y: table.bottom, width: kScreenW, height: 52)
        hotTitle.titleLabel.text = "热门搜索"
        hotTitle.type = SearchRecordType.Hot
        hotTitle.delecBtn.isHidden = true

        //MARK: 热门搜索数据展示 flowCollectionView
        //let flowCtrl = FlowCollectionControl.init()
//        var bottomDis: CGFloat
//        if isiPhoneX() {
//            bottomDis = CGFloat(0)
//        } else {
//            bottomDis = CGFloat(10)
//        }
        
        flowCtrl.setupFlowCollectionView(
            frame: CGRect.init(x: 20, y: hotTitle.bottom, width:kScreenW-40, height: kScreenH - hotTitle.bottom),
            InteritemSpacing: 15,
            LineSpacing: 15,
            contentInset: UIEdgeInsets.init(top: 0, left: 0, bottom: 10, right: 0),
            data:hotList
        )
        
        flowCtrl.flowView?.selecCB = { (keyword, indexPath) -> () in
            let resultVC = ResultVC()
            resultVC.keyword = keyword
            self.navigationController?.pushViewController(resultVC, animated: true)
        }
        
        self.view.addSubview(historyTitle)
        self.view.addSubview(table)
        self.view.addSubview(hotTitle)
        self.view.addSubview(flowCtrl.flowView!)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        historyTitle.snp.makeConstraints { (make) in
            make.left.right.equalTo(self.view)
            make.top.equalTo(self.naviBar.line.snp.bottom)
            make.height.equalTo(52)
        }
        //table.frame = CGRect.init(x: 20, y: historyTitle.bottom, width: kScreenW-40, height: HistoryCellH * CGFloat(5))
        table.snp.makeConstraints { (make) in
            make.left.equalTo(self.view).offset(20)
            make.right.equalTo(self.view).inset(20)
            make.top.equalTo(historyTitle.snp.bottom)
//            var h: CGFloat!
//            if historyList.count >= 5 {
//                h = CGFloat(HistoryCellH * 5)
//            } else {
//                h = HistoryCellH * CGFloat(historyList.count)
//            }
            make.height.equalTo(HistoryCellH * 5)
        }
        //hotTitle.frame = CGRect.init(x: 0, y: table.bottom, width: kScreenW, height: 52)
        hotTitle.snp.makeConstraints { (make) in
            make.left.right.equalTo(self.view)
            make.top.equalTo(table.snp.bottom)
            make.height.equalTo(52)
        }
        
        //CGRect.init(x: 20, y: hotTitle.bottom, width:kScreenW-40, height: kScreenH - hotTitle.bottom - bottomDis)
        flowCtrl.flowView?.snp.makeConstraints({ (make) in
            make.left.equalTo(self.view).offset(20)
            make.right.equalTo(self.view).offset(-20)
            make.top.equalTo(hotTitle.snp.bottom)
            make.bottom.equalTo(self.view)
        })
    }
    
    
    //MARK:- 历史记录tableview代理方法
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  historyList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = table.dequeueReusableCell(withIdentifier: SearchHistoryCellid) as? SearchHistoryCell
        if  (cell == nil) {
            cell = SearchHistoryCell.init(style: UITableViewCellStyle.default, reuseIdentifier: SearchHistoryCellid)
        }
        cell!.selectionStyle = .none
        cell!.titleLabel.text = historyList[indexPath.row] as? String
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return HistoryCellH
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let str:String = historyList[indexPath.row] as! String
        delog(str)
        let resultVC = ResultVC()
        resultVC.keyword = str
        self.navigationController?.pushViewController(resultVC, animated: true)
    }

    func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String?{
        return "删除"
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath)
    {
        
        if editingStyle == UITableViewCellEditingStyle.delete {
            delog("rtyg")
//            //刷新tableview
//            historyList
//            tableView.deleteRows(at: [indexPath], with: UITableViewRowAnimation.automatic)
        }
    }
}
