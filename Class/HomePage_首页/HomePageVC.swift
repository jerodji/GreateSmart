//
//  HomePageVC.swift
//  GreateSmart
//
//  Created by hailin on 2018/2/23.
//  Copyright © 2018年 Jerod. All rights reserved.
//

import UIKit

class JJKit: NSObject {
    @objc var num:NSNumber = 9
    @objc let doub:Double = 2.2
    @objc var list:NSArray = [3,4,5,6,7]
}

class Test1: NSObject {
    @objc var testInteger: Int = 0
    @objc var str:String = ""
    @objc var flo:CGFloat = 0.0
    @objc var jjkits:NSMutableArray? = NSMutableArray()
}

class TestEntity: NSObject {
    @objc var testString: String!
    @objc var intValue:Int = 0
    @objc var test1 = Test1()
}

class HomePageVC: BaseUIViewController {

    private var tableCtrl  : ItemTableControl!
    private var homeData: NSArray = []
    private var itemModelArray: NSMutableArray = []
    
    override func loadView() {
        super.loadView()
//        //MARK:获取首页数据
//        NetworkManage.instance.requestHomePageData { (info) in
//            if info is NSArray {
//                self.homeData = info as! NSArray
////                delog(self.homeData)
//                self.tableCtrl.handleHomeData(homeData: self.homeData)
//            }
//        }
        

        
//        let test1 = Test1()
//        test1.testInteger = 1111
//        test1.str = "teststr"
//        test1.flo = 6.66
//        test1.jjkits?.add(JJKit())
//
//        let j = JJKit()
//        j.num = 90999
//        j.list = [0,0,1,2,1]
//
//        test1.jjkits?.add(j)
//
//        let test = TestEntity()
//        test.testString = "kklo"
//        test.test1 = test1
//        test.intValue = 3
//
//        NetworkManage.instance.testEntityParamsRequest(entity: test)
        
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default); /* 导航栏 设置透明 */
        self.navigationController?.navigationBar.shadowImage = UIImage(); /* 去掉黑线 */
        self.naviBar.isHidden = true
        
        configSubviews()
        configSearchButton()
    }
    
    //MARK:-
    
    func configSubviews() -> () {
        tableCtrl = ItemTableControl.init(tableFrame: CGRect(x: 0, y: kStatusH, width: kScreenW, height: kScreenH-kStatusH-kTabbarH))
        self.view.addSubview(tableCtrl.tableView!)
        
        let jsonStr = "[\n" +
            "    {\n" +
            "        \"data\": [\n" +
            "            {\n" +
            "                \"imageUrl\": \"http://pic.laopdr.cn:80/home_page_image/cdd087fc906b41f4990094dff3cccbfc.png\",\n" +
            "                \"jumpUrl\": \"localhost://www.laopdr.cn/app/itemTypeDetail?id=banjia\"\n" +
            "            },\n" +
            "            {\n" +
            "                \"imageUrl\": \"http://pic.laopdr.cn:80/home_page_image/e514ab8543db49ad929dc54cb3fc9649.png\",\n" +
            "                \"jumpUrl\": \"localhost://www.laopdr.cn/app/itemTypeDetail?id=004\"\n" +
            "            },\n" +
            "            {\n" +
            "                \"imageUrl\": \"http://pic.laopdr.cn:80/home_page_image/6d2893cea7eb4ce7acdacaf4751dbc56.png\",\n" +
            "                \"jumpUrl\": \"localhost://www.laopdr.cn/app/itemTypeDetail?id=002\"\n" +
            "            }\n" +
            "        ],\n" +
            "        \"showType\": \"NewBanner\"\n" +
            "    },\n" +
            "    {\n" +
            "        \"data\": {\n" +
            "            \"smallTitle\": \"PRODUCT CATEGORIES\",\n" +
            "            \"block\": [\n" +
            "                {\n" +
            "                    \"imageUrl\": \"http://pic.laopdr.cn:80/home_page_image/5f012a74e1324aeeb065b6d6184d8d55.png\",\n" +
            "                    \"jumpUrl\": \"localhost://www.laopdr.cn/app/itemTypeDetail?id=001&title=抗癌专区\"\n" +
            "                },\n" +
            "                {\n" +
            "                    \"imageUrl\": \"http://pic.laopdr.cn:80/home_page_image/c433e3a35268443ca30095b1db8a4c84.png\",\n" +
            "                    \"jumpUrl\": \"localhost://www.laopdr.cn/app/itemTypeDetail?id=002&title=壮阳专区\"\n" +
            "                },\n" +
            "                {\n" +
            "                    \"imageUrl\": \"http://pic.laopdr.cn:80/home_page_image/014138f4ad8149da8f8e6746dc49275a.png\",\n" +
            "                    \"jumpUrl\": \"localhost://www.laopdr.cn/app/itemTypeDetail?id=003&title=益寿专区\"\n" +
            "                },\n" +
            "                {\n" +
            "                    \"imageUrl\": \"http://pic.laopdr.cn:80/home_page_image/582560b4ef304e9c9308afbebdc6b42f.png\",\n" +
            "                    \"jumpUrl\": \"localhost://www.laopdr.cn/app/itemTypeDetail?id=004&title=美颜专区\"\n" +
            "                },\n" +
            "                {\n" +
            "                    \"imageUrl\": \"http://pic.laopdr.cn:80/home_page_image/fac7b53e200348878a60c7a31f9e5776.png\",\n" +
            "                    \"jumpUrl\": \"localhost://www.laopdr.cn/app/itemTypeDetail?id=005&title=养胃专区\"\n" +
            "                },\n" +
            "                {\n" +
            "                    \"imageUrl\": \"http://pic.laopdr.cn:80/home_page_image/efe4dfe74a3747aea8ae3f07f408aef6.png\",\n" +
            "                    \"jumpUrl\": \"localhost://www.laopdr.cn/app/itemTypeDetail?id=006&title=茶道专区\"\n" +
            "                },\n" +
            "                {\n" +
            "                    \"imageUrl\": \"http://pic.laopdr.cn:80/home_page_image/b01e3543553543f2af9008398cc2b18b.png\",\n" +
            "                    \"jumpUrl\": \"localhost://www.laopdr.cn/app/itemTypeDetail?id=007&title=安神专区\"\n" +
            "                },\n" +
            "                {\n" +
            "                    \"imageUrl\": \"http://pic.laopdr.cn:80/home_page_image/ddb5c0fbc7fc49659470f1b0d4fbbed4.png\",\n" +
            "                    \"jumpUrl\": \"localhost://www.laopdr.cn/app/itemTypeDetail?id=008&title=其他专区\"\n" +
            "                }\n" +
            "            ],\n" +
            "            \"title\": \"产品分类\"\n" +
            "        },\n" +
            "        \"showType\": \"SortType\"\n" +
            "    },\n" +
            "    {\n" +
            "        \"data\": {\n" +
            "            \"smallTitle\": \"SELLING PRODUCTS\",\n" +
            "            \"imageUrl\": \"http://pic.laopdr.cn:80/home_page_image/91a424d2e63c49d8a291effea219a7db.png\",\n" +
            "            \"name\": \"HAILIN SOLE CO.LTD\",\n" +
            "            \"block\": [\n" +
            "                {\n" +
            "                    \"itemName\": \"野生 珍虫 石斛\",\n" +
            "                    \"itemTitleImage\": \"http://pic.laopdr.cn:80/home_page_image/b7ff181434394fe7970bd4d184c072b9.png\",\n" +
            "                    \"price\": \"3800.0\",\n" +
            "                    \"jumpUrl\": \"localhost://www.laopdr.cn/app/itemDetail?id=HL0103\"\n" +
            "                },\n" +
            "                {\n" +
            "                    \"itemName\": \"野生 桑黄灵芝\",\n" +
            "                    \"itemTitleImage\": \"http://pic.laopdr.cn:80/home_page_image/e8a64a9b939a4b7cbe793d35afcbd4f2.png\",\n" +
            "                    \"price\": \"160.0\",\n" +
            "                    \"jumpUrl\": \"localhost://www.laopdr.cn/app/itemDetail?id=HL0081\"\n" +
            "                },\n" +
            "                {\n" +
            "                    \"itemName\": \"营养 大燕条\",\n" +
            "                    \"itemTitleImage\": \"http://pic.laopdr.cn:80/home_page_image/22cf6cbd4de646db91e9951d46f79c2b.png\",\n" +
            "                    \"price\": \"2500.0\",\n" +
            "                    \"jumpUrl\": \"localhost://www.laopdr.cn/app/itemDetail?id=HL0048\"\n" +
            "                },\n" +
            "                {\n" +
            "                    \"itemName\": \"食用菌 红菇\",\n" +
            "                    \"itemTitleImage\": \"http://pic.laopdr.cn:80/home_page_image/edcff7d5d85e4d499a348f6736c2e6a6.png\",\n" +
            "                    \"price\": \"1160.0\",\n" +
            "                    \"jumpUrl\": \"localhost://www.laopdr.cn/app/itemDetail?id=HL0066\"\n" +
            "                },\n" +
            "                {\n" +
            "                    \"itemName\": \"血鹿茸片\",\n" +
            "                    \"itemTitleImage\": \"http://pic.laopdr.cn:80/home_page_image/484378daf09344bb9dedc252238efa18.png\",\n" +
            "                    \"price\": \"1600.0\",\n" +
            "                    \"jumpUrl\": \"localhost://www.laopdr.cn/app/itemDetail?id=HL0022\"\n" +
            "                }\n" +
            "            ],\n" +
            "            \"type\": \"自营店\",\n" +
            "            \"title\": \"实体店铺推荐\",\n" +
            "            \"jumpUrl\": \"localhost://www.laopdr.cn/app/shopDetail?id=001\"\n" +
            "        },\n" +
            "        \"showType\": \"HotInStore\"\n" +
            "    },\n" +
            "    {\n" +
            "        \"data\": {\n" +
            "            \"smallTitle\": \"HOT COMMODITY\",\n" +
            "            \"block\": [\n" +
            "                {\n" +
            "                    \"imageUrl\": \"http://pic.laopdr.cn:80/home_page_image/0d8b069e17554d9aaa667e21aa6a175f.png\",\n" +
            "                    \"jumpUrl\": \"localhost://www.laopdr.cn/app/itemTypeDetail?id=002&title=男士专区\"\n" +
            "                },\n" +
            "                {\n" +
            "                    \"imageUrl\": \"http://pic.laopdr.cn:80/home_page_image/3c1d08def8164350bcc425b06ebc5328.png\",\n" +
            "                    \"jumpUrl\": \"localhost://www.laopdr.cn/app/itemTypeDetail?id=004&title=女士专区\"\n" +
            "                }\n" +
            "            ],\n" +
            "            \"title\": \"男女专区\"\n" +
            "        },\n" +
            "        \"showType\": \"ForMale\"\n" +
            "    },\n" +
            "    {\n" +
            "        \"data\": {\n" +
            "            \"smallTitle\": \"SELECTED ZONE\",\n" +
            "            \"block\": [\n" +
            "                {\n" +
            "                    \"itemId\": \"HL0103\",\n" +
            "                    \"itemName\": \"极品 野生 珍虫 石斛 软盒【批发500克*1盒】\",\n" +
            "                    \"originalPrice\": \"5700.0\",\n" +
            "                    \"itemTitleImage\": \"http://pic.laopdr.cn:80/item_image/802addf703d943d7ad6ae423f435b692.jpg\",\n" +
            "                    \"price\": \"3800.0\",\n" +
            "                    \"origin\": \"老挝\",\n" +
            "                    \"publicity\": \"生津利咽，清热利尿\",\n" +
            "                    \"jumpUrl\": \"localhost://www.laopdr.cn/app/itemDetail?id=HL0103\"\n" +
            "                },\n" +
            "                {\n" +
            "                    \"itemId\": \"HL0051\",\n" +
            "                    \"itemName\": \"天然保健 蝶豆花 礼盒【批发160克*1盒】\",\n" +
            "                    \"originalPrice\": \"208.0\",\n" +
            "                    \"itemTitleImage\": \"http://pic.laopdr.cn:80/item_image/c337292227394504b229c81eef19f476.jpg\",\n" +
            "                    \"price\": \"160.0\",\n" +
            "                    \"origin\": \"老挝\",\n" +
            "                    \"publicity\": \"长期服用让眼睛防辐射\",\n" +
            "                    \"jumpUrl\": \"localhost://www.laopdr.cn/app/itemDetail?id=HL0051\"\n" +
            "                },\n" +
            "                {\n" +
            "                    \"itemId\": \"HL0048\",\n" +
            "                    \"itemName\": \"滋补极品 营养 大燕条【批发100克*1盒】\",\n" +
            "                    \"originalPrice\": \"3250.0\",\n" +
            "                    \"itemTitleImage\": \"http://pic.laopdr.cn:80/item_image/dfc1009e965c45bda462db0ef2d22e7d.jpg\",\n" +
            "                    \"price\": \"2500.0\",\n" +
            "                    \"origin\": \"马来西亚\",\n" +
            "                    \"publicity\": \"美容安胎，滋补极品\",\n" +
            "                    \"jumpUrl\": \"localhost://www.laopdr.cn/app/itemDetail?id=HL0048\"\n" +
            "                },\n" +
            "                {\n" +
            "                    \"itemId\": \"HL0076\",\n" +
            "                    \"itemName\": \"绿色天然 辣木籽【500克*1大袋】【250克*1小袋】\",\n" +
            "                    \"originalPrice\": \"78.0\",\n" +
            "                    \"itemTitleImage\": \"http://pic.laopdr.cn:80/item_image/606b85a7492943b4a6d8b2f164a15b08.jpg\",\n" +
            "                    \"price\": \"60.0\",\n" +
            "                    \"origin\": \"老挝\",\n" +
            "                    \"publicity\": \"降三高 治糖尿病\",\n" +
            "                    \"jumpUrl\": \"localhost://www.laopdr.cn/app/itemDetail?id=HL0076\"\n" +
            "                }\n" +
            "            ],\n" +
            "            \"title\": \"人气商品\"\n" +
            "        },\n" +
            "        \"showType\": \"HotSale\"\n" +
            "    },\n" +
            "    {\n" +
            "        \"data\": {\n" +
            "            \"smallTitle\": \"测试副标题\",\n" +
            "            \"block\": [\n" +
            "                {\n" +
            "                    \"img\": \"http://pic.laopdr.cn/article_image/29b27f8ee6a249749a39c5085c5102c4.jpg\",\n" +
            "                    \"articleTitle\": \"奇怪的文章\",\n" +
            "                    \"createTime\": \"992340234023422\",\n" +
            "                    \"count\": \"1090\",\n" +
            "                    \"shareUrl\": \"http://www.laopdr.cn/HAILIN_SERVER/article/b5d1e8f8-ab61-41a5-ba4d-09edd9558300.do\",\n" +
            "                    \"type\": \"健康\",\n" +
            "                    \"jumpUrl\": \"http://www.laopdr.cn/HAILIN_AGENT_SERVER/article/b5d1e8f8-ab61-41a5-ba4d-09edd9558300.do\"\n" +
            "                },\n" +
            "                {\n" +
            "                    \"img\": \"http://pic.laopdr.cn/article_image/29b27f8ee6a249749a39c5085c5102c4.jpg\",\n" +
            "                    \"articleTitle\": \"奇怪的文章\",\n" +
            "                    \"createTime\": \"992340234023422\",\n" +
            "                    \"count\": \"1090\",\n" +
            "                    \"shareUrl\": \"http://www.laopdr.cn/HAILIN_SERVER/article/b5d1e8f8-ab61-41a5-ba4d-09edd9558300.do\",\n" +
            "                    \"type\": \"健康\",\n" +
            "                    \"jumpUrl\": \"http://www.laopdr.cn/HAILIN_AGENT_SERVER/article/b5d1e8f8-ab61-41a5-ba4d-09edd9558300.do\"\n" +
            "                },\n" +
            "                {\n" +
            "                    \"img\": \"http://pic.laopdr.cn/article_image/29b27f8ee6a249749a39c5085c5102c4.jpg\",\n" +
            "                    \"articleTitle\": \"奇怪的文章\",\n" +
            "                    \"createTime\": \"992340234023422\",\n" +
            "                    \"count\": \"1090\",\n" +
            "                    \"shareUrl\": \"http://www.laopdr.cn/HAILIN_SERVER/article/b5d1e8f8-ab61-41a5-ba4d-09edd9558300.do\",\n" +
            "                    \"type\": \"健康\",\n" +
            "                    \"jumpUrl\": \"http://www.laopdr.cn/HAILIN_AGENT_SERVER/article/b5d1e8f8-ab61-41a5-ba4d-09edd9558300.do\"\n" +
            "                },\n" +
            "                {\n" +
            "                    \"img\": \"http://pic.laopdr.cn/article_image/29b27f8ee6a249749a39c5085c5102c4.jpg\",\n" +
            "                    \"articleTitle\": \"奇怪的文章\",\n" +
            "                    \"createTime\": \"992340234023422\",\n" +
            "                    \"count\": \"1090\",\n" +
            "                    \"shareUrl\": \"http://www.laopdr.cn/HAILIN_SERVER/article/b5d1e8f8-ab61-41a5-ba4d-09edd9558300.do\",\n" +
            "                    \"type\": \"健康\",\n" +
            "                    \"jumpUrl\": \"http://www.laopdr.cn/HAILIN_AGENT_SERVER/article/b5d1e8f8-ab61-41a5-ba4d-09edd9558300.do\"\n" +
            "                },\n" +
            "                {\n" +
            "                    \"img\": \"http://pic.laopdr.cn/article_image/29b27f8ee6a249749a39c5085c5102c4.jpg\",\n" +
            "                    \"articleTitle\": \"奇怪的文章\",\n" +
            "                    \"createTime\": \"992340234023422\",\n" +
            "                    \"count\": \"1090\",\n" +
            "                    \"shareUrl\": \"http://www.laopdr.cn/HAILIN_SERVER/article/b5d1e8f8-ab61-41a5-ba4d-09edd9558300.do\",\n" +
            "                    \"type\": \"健康\",\n" +
            "                    \"jumpUrl\": \"http://www.laopdr.cn/HAILIN_AGENT_SERVER/article/b5d1e8f8-ab61-41a5-ba4d-09edd9558300.do\"\n" +
            "                },\n" +
            "                {\n" +
            "                    \"img\": \"http://pic.laopdr.cn/article_image/29b27f8ee6a249749a39c5085c5102c4.jpg\",\n" +
            "                    \"articleTitle\": \"奇怪的文章\",\n" +
            "                    \"createTime\": \"992340234023422\",\n" +
            "                    \"count\": \"1090\",\n" +
            "                    \"shareUrl\": \"http://www.laopdr.cn/HAILIN_SERVER/article/b5d1e8f8-ab61-41a5-ba4d-09edd9558300.do\",\n" +
            "                    \"type\": \"健康\",\n" +
            "                    \"jumpUrl\": \"http://www.laopdr.cn/HAILIN_AGENT_SERVER/article/b5d1e8f8-ab61-41a5-ba4d-09edd9558300.do\"\n" +
            "                },\n" +
            "                {\n" +
            "                    \"img\": \"http://pic.laopdr.cn/article_image/29b27f8ee6a249749a39c5085c5102c4.jpg\",\n" +
            "                    \"articleTitle\": \"奇怪的文章\",\n" +
            "                    \"createTime\": \"992340234023422\",\n" +
            "                    \"count\": \"1090\",\n" +
            "                    \"shareUrl\": \"http://www.laopdr.cn/HAILIN_SERVER/article/b5d1e8f8-ab61-41a5-ba4d-09edd9558300.do\",\n" +
            "                    \"type\": \"健康\",\n" +
            "                    \"jumpUrl\": \"http://www.laopdr.cn/HAILIN_AGENT_SERVER/article/b5d1e8f8-ab61-41a5-ba4d-09edd9558300.do\"\n" +
            "                },\n" +
            "                {\n" +
            "                    \"img\": \"http://pic.laopdr.cn/article_image/29b27f8ee6a249749a39c5085c5102c4.jpg\",\n" +
            "                    \"articleTitle\": \"奇怪的文章\",\n" +
            "                    \"createTime\": \"992340234023422\",\n" +
            "                    \"count\": \"1090\",\n" +
            "                    \"shareUrl\": \"http://www.laopdr.cn/HAILIN_SERVER/article/b5d1e8f8-ab61-41a5-ba4d-09edd9558300.do\",\n" +
            "                    \"type\": \"健康\",\n" +
            "                    \"jumpUrl\": \"http://www.laopdr.cn/HAILIN_AGENT_SERVER/article/b5d1e8f8-ab61-41a5-ba4d-09edd9558300.do\"\n" +
            "                },\n" +
            "                {\n" +
            "                    \"img\": \"http://pic.laopdr.cn/article_image/29b27f8ee6a249749a39c5085c5102c4.jpg\",\n" +
            "                    \"articleTitle\": \"奇怪的文章\",\n" +
            "                    \"createTime\": \"992340234023422\",\n" +
            "                    \"count\": \"1090\",\n" +
            "                    \"shareUrl\": \"http://www.laopdr.cn/HAILIN_SERVER/article/b5d1e8f8-ab61-41a5-ba4d-09edd9558300.do\",\n" +
            "                    \"type\": \"健康\",\n" +
            "                    \"jumpUrl\": \"http://www.laopdr.cn/HAILIN_AGENT_SERVER/article/b5d1e8f8-ab61-41a5-ba4d-09edd9558300.do\"\n" +
            "                },\n" +
            "                {\n" +
            "                    \"img\": \"http://pic.laopdr.cn/article_image/29b27f8ee6a249749a39c5085c5102c4.jpg\",\n" +
            "                    \"articleTitle\": \"奇怪的文章\",\n" +
            "                    \"createTime\": \"992340234023422\",\n" +
            "                    \"count\": \"1090\",\n" +
            "                    \"shareUrl\": \"http://www.laopdr.cn/HAILIN_SERVER/article/b5d1e8f8-ab61-41a5-ba4d-09edd9558300.do\",\n" +
            "                    \"type\": \"健康\",\n" +
            "                    \"jumpUrl\": \"http://www.laopdr.cn/HAILIN_AGENT_SERVER/article/b5d1e8f8-ab61-41a5-ba4d-09edd9558300.do\"\n" +
            "                }\n" +
            "            ],\n" +
            "            \"title\": \"测试标题\"\n" +
            "        },\n" +
            "        \"showType\": \"Nature2\"\n" +
            "    },\n" +
            "    {\n" +
            "        \"data\": {\n" +
            "            \"smallTitle\": \"HEALTH INFORMATION\",\n" +
            "            \"block\": [\n" +
            "                {\n" +
            "                    \"img\": \"http://pic.laopdr.cn/article_image/29b27f8ee6a249749a39c5085c5102c4.jpg\",\n" +
            "                    \"shareUrl\": \"http://www.laopdr.cn/HAILIN_SERVER/article/13295c5c-0041-4936-b5d5-427a10249d01.do\",\n" +
            "                    \"title\": \"现在知道还不晚！灵芝吃或不吃，差别还真的很大！别忘了告诉家人\",\n" +
            "                    \"descriptions\": \"灵芝可以扶正固本，扶正祛邪。\",\n" +
            "                    \"jumpUrl\": \"http://www.laopdr.cn/HAILIN_AGENT_SERVER/article/13295c5c-0041-4936-b5d5-427a10249d01.do\"\n" +
            "                },\n" +
            "                {\n" +
            "                    \"img\": \"http://pic.laopdr.cn/article_image/22cafc87a33f43d98984765b7a29cdd5.jpg\",\n" +
            "                    \"shareUrl\": \"http://www.laopdr.cn/HAILIN_SERVER/article/b5d1e8f8-ab61-41a5-ba4d-09edd9558300.do\",\n" +
            "                    \"title\": \"官方认证的美国“癌症村”，比恐怖袭击还更让人感 到后怕\",\n" +
            "                    \"descriptions\": \"飙升的癌症发病率是千年一遇的巧合还是背后另有可怕的隐情？\",\n" +
            "                    \"jumpUrl\": \"http://www.laopdr.cn/HAILIN_AGENT_SERVER/article/b5d1e8f8-ab61-41a5-ba4d-09edd9558300.do\"\n" +
            "                }\n" +
            "            ],\n" +
            "            \"title\": \"健康资讯\"\n" +
            "        },\n" +
            "        \"showType\": \"Nature\"\n" +
            "    },\n" +
            "    {\n" +
            "        \"data\": {\n" +
            "            \"smallTitle\": \"HOT NEWS\",\n" +
            "            \"block\": [\n" +
            "                {\n" +
            "                    \"itemName\": \"Astalive 阿斯维他 轻快歩行 软骨素\",\n" +
            "                    \"originalPrice\": \"395.0\",\n" +
            "                    \"itemTitleImage\": \"http://pic.laopdr.cn:80/item_image/d9f7fc0add2942508de7898918feecbe.jpg\",\n" +
            "                    \"price\": \"304.5\",\n" +
            "                    \"startTime\": \"2018-01-24 00:00:00\",\n" +
            "                    \"endTime\": \"2018-05-01 00:00:00\",\n" +
            "                    \"publicity\": \"改善骨关节炎\",\n" +
            "                    \"jumpUrl\": \"localhost://www.laopdr.cn/app/itemDetail?id=AS00006\"\n" +
            "                },\n" +
            "                {\n" +
            "                    \"itemName\": \"无添加物 绿色 榴莲果干\",\n" +
            "                    \"originalPrice\": \"84.0\",\n" +
            "                    \"itemTitleImage\": \"http://pic.laopdr.cn:80/item_image/c844cef2226049c78eb5e6fe0c0a800e.jpg\",\n" +
            "                    \"price\": \"65.0\",\n" +
            "                    \"startTime\": \"2018-01-29 00:00:00\",\n" +
            "                    \"endTime\": \"2018-04-25 00:00:00\",\n" +
            "                    \"publicity\": \"纯天然泰国水果制成\",\n" +
            "                    \"jumpUrl\": \"localhost://www.laopdr.cn/app/itemDetail?id=HL0042\"\n" +
            "                },\n" +
            "                {\n" +
            "                    \"itemName\": \"正品 RoyalLatex 皇家 乳胶枕\",\n" +
            "                    \"originalPrice\": \"323.0\",\n" +
            "                    \"itemTitleImage\": \"http://pic.laopdr.cn:80/item_image/c4b2aabc02b24a9b8304449ab24425b0.jpg\",\n" +
            "                    \"price\": \"249.0\",\n" +
            "                    \"startTime\": \"2018-02-01 00:00:00\",\n" +
            "                    \"endTime\": \"2018-06-01 00:00:00\",\n" +
            "                    \"publicity\": \"保护颈椎 改善睡眠\",\n" +
            "                    \"jumpUrl\": \"localhost://www.laopdr.cn/app/itemDetail?id=HL0115\"\n" +
            "                },\n" +
            "                {\n" +
            "                    \"itemName\": \"老挝DAO牌 高营养 混合果干\",\n" +
            "                    \"originalPrice\": \"63.0\",\n" +
            "                    \"itemTitleImage\": \"http://pic.laopdr.cn:80/item_image/4105d9e1c8c94965ad6820a652bc6b97.jpg\",\n" +
            "                    \"price\": \"49.0\",\n" +
            "                    \"startTime\": \"2018-02-01 00:00:00\",\n" +
            "                    \"endTime\": \"2018-05-05 00:00:00\",\n" +
            "                    \"publicity\": \"纯天然东南亚水果制成\",\n" +
            "                    \"jumpUrl\": \"localhost://www.laopdr.cn/app/itemDetail?id=HL0017\"\n" +
            "                },\n" +
            "                {\n" +
            "                    \"itemName\": \"珍贵 野生 灵芝 孢子粉\",\n" +
            "                    \"originalPrice\": \"312.0\",\n" +
            "                    \"itemTitleImage\": \"http://pic.laopdr.cn:80/item_image/ea4074eb26c040f0adfc1d683a5794ed.jpg\",\n" +
            "                    \"price\": \"240.0\",\n" +
            "                    \"startTime\": \"2018-02-01 00:00:00\",\n" +
            "                    \"endTime\": \"2018-05-03 00:00:00\",\n" +
            "                    \"publicity\": \"抑制肿瘤，提高免疫力\",\n" +
            "                    \"jumpUrl\": \"localhost://www.laopdr.cn/app/itemDetail?id=HL0079\"\n" +
            "                }\n" +
            "            ],\n" +
            "            \"title\": \"限时特价\"\n" +
            "        },\n" +
            "        \"showType\": \"TimeReC\"\n" +
            "    },\n" +
            "    {\n" +
            "        \"data\": {\n" +
            "            \"smallTitle\": \"SELECTED ZONE\",\n" +
            "            \"block\": [\n" +
            "                {\n" +
            "                    \"imageUrl\": \"http://pic.laopdr.cn:80/home_page_image/bb84c18a633b4f35a2153b77b76dc107.png\",\n" +
            "                    \"jumpUrl\": \"localhost://www.laopdr.cn/app/itemTypeDetail?id=003&title=补虚益气\"\n" +
            "                },\n" +
            "                {\n" +
            "                    \"imageUrl\": \"http://pic.laopdr.cn:80/home_page_image/0384168e8fcc4994ad0bacf9279fcf18.png\",\n" +
            "                    \"jumpUrl\": \"localhost://www.laopdr.cn/app/itemTypeDetail?id=004&title=养颜美容\"\n" +
            "                },\n" +
            "                {\n" +
            "                    \"imageUrl\": \"http://pic.laopdr.cn:80/home_page_image/3d7d093644624b5fb692481a3d9ecf84.png\",\n" +
            "                    \"jumpUrl\": \"localhost://www.laopdr.cn/app/itemTypeDetail?id=001&title=抗癌防癌\"\n" +
            "                },\n" +
            "                {\n" +
            "                    \"imageUrl\": \"http://pic.laopdr.cn:80/home_page_image/d5248b972f554b15917a73ffffddc032.png\",\n" +
            "                    \"jumpUrl\": \"localhost://www.laopdr.cn/app/itemTypeDetail?id=002&title=强肾壮阳\"\n" +
            "                }\n" +
            "            ],\n" +
            "            \"title\": \"精选专区\"\n" +
            "        },\n" +
            "        \"showType\": \"Boutique\"\n" +
            "    },\n" +
            "    {\n" +
            "        \"data\": {\n" +
            "            \"smallTitle\": \"LAOS DIRECT MAIL\",\n" +
            "            \"imageUrl\": \"http://pic.laopdr.cn:80/home_page_image/1d2509c19f424379878e2c52bec36d2c.png\",\n" +
            "            \"title\": \"老挝直邮\",\n" +
            "            \"jumpUrl\": \"localhost://www.laopdr.cn/app/itemTypeDetail?title=老挝直邮&origin=老挝\"\n" +
            "        },\n" +
            "        \"showType\": \"LTC\"\n" +
            "    },\n" +
            "    {\n" +
            "        \"data\": [\n" +
            "            {\n" +
            "                \"imageUrl\": \"http://pic.laopdr.cn:80/home_page_image/2d6644bfe49b4ddba55616f5fa07dae6.png\",\n" +
            "                \"jumpUrl\": \"localhost://www.laopdr.cn/app/itemDetail?id=HL0104\"\n" +
            "            },\n" +
            "            {\n" +
            "                \"imageUrl\": \"http://pic.laopdr.cn:80/home_page_image/b28e2955f8b4421bba99de300b134828.png\",\n" +
            "                \"jumpUrl\": \"localhost://www.laopdr.cn/app/itemDetail?id=HL0103\"\n" +
            "            },\n" +
            "            {\n" +
            "                \"imageUrl\": \"http://pic.laopdr.cn:80/home_page_image/2e6c8a953fa64891bb237050ed3934c2.png\",\n" +
            "                \"jumpUrl\": \"localhost://www.laopdr.cn/app/itemDetail?id=HL0051\"\n" +
            "            }\n" +
            "        ],\n" +
            "        \"showType\": \"NewBlock1\"\n" +
            "    }\n" +
        "]"
        
        
        
        self.homeData = NSObject.object(fromJSONString: jsonStr) as! NSArray
        self.tableCtrl.handleHomeData(homeData: self.homeData)
        
    }
    
    //MARK: 搜索按钮
    func configSearchButton() -> () {
        let ssBtn = UIButton.init(frame: CGRect.init(x: kScreenW-15-44, y: kStatusH, width: 44, height: 44))
        ssBtn.setImage(UIImage(named:"ss"), for: UIControlState.normal)
        ssBtn.addTarget(self, action: #selector(searchButtonAction), for: UIControlEvents.touchUpInside)
        self.view.addSubview(ssBtn)
    }
    @objc func searchButtonAction() -> () {
        let searchvc = SearchVC()
        self.navigationController?.pushViewController(searchvc, animated: true)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
