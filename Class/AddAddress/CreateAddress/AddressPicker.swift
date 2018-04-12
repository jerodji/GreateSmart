//
//  AddressPicker.swift
//  GreateSmart
//
//  Created by hailin on 2018/4/10.
//  Copyright © 2018年 Jerod. All rights reserved.
//

import UIKit

class AddressPicker: BaseControl,UIPickerViewDelegate,UIPickerViewDataSource {

    //var scene : UIViewController?
    
    ///省
    var view : UIPickerView?
    var proArray : NSMutableArray = []
    var sureBtn : UIButton?
    
    typealias SUREBLK = (String)->()
    var sureCb : SUREBLK?
    
    private var selecProvModel : ProvinceModel?
    private var selecCityModel : CityModel?
    private var selecAreaModel : AreaModel?
    
    override init() {
        super.init()
        getAddressData()
    }
    
    func getAddressData() -> Void {
        
        let db : FMDatabase = getaddressdb()
        db.open()
        
        //读取省
        let sql = "SELECT * FROM province"
        let rs : FMResultSet = db.executeQuery(sql, withArgumentsIn: [])!
        
        while rs.next() {
            let pm = ProvinceModel()
            pm.provinceId = rs.int(forColumn: "provinceId")
            pm.provinceName = rs.string(forColumn: "provinceName")!
            
            //读取省对应的市
            let c_sql = "SELECT * FROM city WHERE provinceId = \(pm.provinceId)"
            let c_rs :FMResultSet = db.executeQuery(c_sql, withArgumentsIn: [])!
            
            while c_rs.next() {
                let cm = CityModel()
                cm.cityId = c_rs.int(forColumn: "cityId")
                cm.provinceId = c_rs.int(forColumn: "provinceId")
                cm.cityName = c_rs.string(forColumn: "cityName")!
                cm.zipCode = c_rs.string(forColumn: "zipCode")!
                pm.cityArray.add(cm)
                
                //读取市对应的区
                let a_sql = "SELECT * FROM area WHERE cityId = \(cm.cityId)"
                let a_rs :FMResultSet = db.executeQuery(a_sql, withArgumentsIn: [])!
                
                while a_rs.next() {
                    let am = AreaModel()
                    am.areaId = a_rs.int(forColumn: "areaId")
                    am.cityId = a_rs.int(forColumn: "cityId")
                    am.areaName = a_rs.string(forColumn: "areaName")!
                    cm.areaArray.add(am)
                }
                
            }
            
            proArray.add(pm)
        }
        
        db.close()
    }
    
    func getaddressdb() -> FMDatabase {
        //读取数据库数据 address.db
        let dbPath :String = Bundle.main.path(forResource: "address", ofType: "db")!
        delog("address.db path : \(dbPath)")
        
        let db : FMDatabase = FMDatabase.init(path: dbPath)
        
        return db
    }
    
    func initView(pickerFrame:CGRect) -> Void {
        
        view = UIPickerView.init(frame: CGRect(x: pickerFrame.origin.x, y: pickerFrame.origin.y, width: pickerFrame.size.width, height: pickerFrame.size.height))
        view!.backgroundColor = UIColor.white
        view!.delegate = self
        view!.dataSource = self
        
        sureBtn = UIButton.init(frame: CGRect(x: 0, y: pickerFrame.origin.y + pickerFrame.size.height, width: pickerFrame.size.width, height: kTabbarH))
        sureBtn!.backgroundColor = UIColor.RGB(83, 83, 83)
        sureBtn!.setTitle("确定", for: .normal)
        sureBtn?.addTarget(self, action: #selector(sureAction), for: .touchUpInside)
        
        if proArray.count > 0 {
            //默认选择第一个
            if proArray.count > 0 {
                self.pickerView(view!, didSelectRow: 0, inComponent: 0)
                
                if (proArray.object(at: 0) as! ProvinceModel).cityArray.count > 0 {
                    self.pickerView(view!, didSelectRow: 0, inComponent: 1)
                    
                    if ((proArray.object(at: 0) as! ProvinceModel).cityArray.object(at: 0) as! CityModel).areaArray.count > 0 {
                        self.pickerView(view!, didSelectRow: 0, inComponent: 2)
                    }
                }
            }
        }
        
    }
    
    @objc func sureAction()->Void {
        let area = "\(selecProvModel?.provinceName ?? "") \(selecCityModel?.cityName ?? "") \(selecAreaModel?.areaName ?? "")"
        //delog(area)
        //NotificationCenter.default.post(name: NSNotification.Name(notifyPCA), object: area)
        (sureCb == nil) ? delog("没有实现sureCb") : sureCb!(area)
    }
    
    //MARK:-
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0 {
            return proArray.count //省
        }
        else if component == 1 {
            return selecProvModel?.cityArray.count ?? 0
        }
        else {
            return selecCityModel?.areaArray.count ?? 0
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        if component == 0 {
            if proArray.count > 0 {
                selecProvModel = proArray.object(at: row) as? ProvinceModel
                //选择 0 后改变 1 2 的状态
                pickerView.reloadComponent(1)
                pickerView.reloadComponent(2)
                pickerView.selectRow(0, inComponent: 1, animated: true)
                pickerView.selectRow(0, inComponent: 2, animated: true)
                self.pickerView(pickerView, didSelectRow: 0, inComponent: 1)
                self.pickerView(pickerView, didSelectRow: 0, inComponent: 2)
            }
        }
        if component == 1 {
            if selecProvModel?.cityArray.count ?? 0 > 0 {
                selecCityModel = selecProvModel?.cityArray.object(at: row) as? CityModel
                //选择 1 后改变 2 的状态
                if selecCityModel?.areaArray.count ?? 0 > 0 {
                    pickerView.reloadComponent(2)
                    pickerView.selectRow(0, inComponent: 2, animated: true)
                    self.pickerView(pickerView, didSelectRow: 0, inComponent: 2)
                }
            }
        }
        if component == 2 {
            if selecCityModel?.areaArray.count ?? 0 > 0 {
                selecAreaModel = selecCityModel?.areaArray.object(at: row) as? AreaModel
            }
        }
    }
    
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        
        let label : UILabel = UILabel.init()
        label.frame = CGRect(x: 0, y: 0, width: kScreenW/3, height: 30)
        label.adjustsFontSizeToFitWidth = true
        label.textAlignment = .center
        //label.text = self.pickerView(pickerView, titleForRow: row, forComponent: component)
        
        if component == 0 {
            if proArray.count > 0 {
                let model : ProvinceModel = proArray.object(at: row) as! ProvinceModel
                label.text = model.provinceName //省
            } else {
                label.text = ""
            }
        }
        if component == 1 {
            if selecProvModel?.cityArray.count ?? 0 > 0 {
                let cm = selecProvModel?.cityArray.object(at: row) as? CityModel
                label.text = cm?.cityName ?? "" //市
            } else {
                label.text = ""
            }
        }
        if component == 2 {
            if selecCityModel?.areaArray.count ?? 0 > 0 {
                let am = selecCityModel?.areaArray.object(at: row) as? AreaModel
                label.text = am?.areaName ?? "" //区
            } else {
                label.text = ""
            }
        }
        
        return label
    }
    
//    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
//        let model : ProvinceModel = provArray.object(at: row) as! ProvinceModel
//        if component == 0 {
//            return model.provinceName //省
//        }
//        if component == 1 {
//            return model.provinceName
//        }
//        if component == 2 {
//            return model.provinceName
//        }
//        return ""
//    }
    
    
//    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
//
//        let model : ProvinceModel = provArray.object(at: row) as! ProvinceModel
//
//        let attr = NSAttributedString.init(string: model.provinceName, attributes:
//            [NSAttributedStringKey.font : UIFont.systemFont(ofSize: 10),
//             NSAttributedStringKey.foregroundColor:UIColor.black] )
//
//        return attr
//    }
    
    
//    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
//        if component == 0 { return 3 }
//        if component == 1 { return 3 }
//        if component == 2 { return 3 }
//        return 0
//    }
    
    
}
