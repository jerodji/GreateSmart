//
//  BannerView.swift
//  GreateSmart
//
//  Created by hailin on 2018/3/6.
//  Copyright © 2018年 Jerod. All rights reserved.
//

import UIKit

class BannerView: UIView, SDCycleScrollViewDelegate {

    var model = BannerModel()
    var cycleView2 : SDCycleScrollView?
    var bannerImageModels : Array<Any> = []
    
    private var frameRect: CGRect!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        frameRect = frame
        self.frame = frame
        self.backgroundColor = UIColor.white
        
        configNewBanner()
        
        //adjustImageBrightness(brightness: -0.5)
        //CGImageRelease(cgImage!)
    }
    
    
    func handleData(typeInfo: Any!) -> Void {
        model = BannerModel.dataReader(typeInfo: typeInfo)
        
        var imageUrls : Array<String> = []
        
        for elem in model.data {
            let m = elem as! BannerBlockElemModel
            imageUrls.append(m.imageUrl)
            bannerImageModels.append(m)
        }
        
        //网络url数组
        cycleView2?.imageURLStringsGroup = imageUrls
    }
    
    func configNewBanner()-> () {
        
        cycleView2 = SDCycleScrollView.init()
        //cycleView2?.imageURLStringsGroup = urls
        cycleView2?.delegate = self
        cycleView2?.bannerImageViewContentMode = UIViewContentMode.scaleAspectFill
        cycleView2?.showPageControl = true
        cycleView2?.titleLabelHeight = 0
        cycleView2?.pageControlAliment = SDCycleScrollViewPageContolAlimentCenter
        cycleView2?.pageControlStyle = SDCycleScrollViewPageContolStyleClassic
        cycleView2?.autoScrollTimeInterval = 5
        self.addSubview(cycleView2!)
        cycleView2?.snp.makeConstraints { (make) in
            make.edges.equalTo(self)
        }
    }
    
    /** 点击图片回调 */
    func cycleScrollView(_ cycleScrollView: SDCycleScrollView!, didSelectItemAt index: Int) {
        delog("adsf")
    }
    
    /** 图片滚动回调 */
    func cycleScrollView(_ cycleScrollView: SDCycleScrollView!, didScrollTo index: Int) {
        
    }
    
    
//    func adjustImageBrightness(brightness: CGFloat) -> Void {
//
//        var myImage = imageView.image
//        let context = CIContext.init(options: nil)
//        let superImage = CIImage.init(cgImage: myImage!.cgImage!)
//        let lighten = CIFilter.init(name: "CIColorControls")
//        lighten?.setValue(superImage, forKey: kCIInputImageKey)
//        lighten?.setValue(brightness, forKey: "inputBrightness") /* 亮度, -1---1   数越大越亮 */
//
//        let result = lighten?.value(forKey: kCIOutputImageKey)
//        let cgImage = context.createCGImage(result as! CIImage, from: superImage.extent)
//        myImage = UIImage.init(cgImage: cgImage!)
//    }
    
    
    /*
     UIImage *myImage = [UIImage imageNamed:@"Superman"];
     CIContext *context = [CIContext contextWithOptions:nil];
     CIImage *superImage = [CIImage imageWithCGImage:myImage.CGImage];
     CIFilter *lighten = [CIFilter filterWithName:@"CIColorControls"];
     [lighten setValue:superImage forKey:kCIInputImageKey];
     
     // 修改亮度   -1---1   数越大越亮
     [lighten setValue:@(0.2) forKey:@"inputBrightness"];
     
     // 修改饱和度  0---2
     [lighten setValue:@(0.5) forKey:@"inputSaturation"];
     
     // 修改对比度  0---4
     [lighten setValue:@(2.5) forKey:@"inputContrast"];
     
     CIImage *result = [lighten valueForKey:kCIOutputImageKey];
     CGImageRef cgImage = [context createCGImage:result fromRect:[superImage extent]];
     
     // 得到修改后的图片
     myImage = [UIImage imageWithCGImage:cgImage];
     
     // 释放对象
     CGImageRelease(cgImage);
     */
    
    
    
}
