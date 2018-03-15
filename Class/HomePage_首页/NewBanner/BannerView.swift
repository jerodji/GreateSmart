//
//  BannerView.swift
//  GreateSmart
//
//  Created by hailin on 2018/3/6.
//  Copyright © 2018年 Jerod. All rights reserved.
//

import UIKit
//import ZCycleView

class BannerView: UIView,ZCycleViewProtocol {

    var model = BannerModel()
    var cycleView1 : ZCycleView!
    private var frameRect: CGRect!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        frameRect = frame
        self.frame = frame
        self.backgroundColor = UIColor.white
        
//        cycleView1 = ZCycleView.init(frame: CGRect(x: 0, y: 0, width: kScreenW, height: heightBanner))
        cycleView1 = ZCycleView()
        
//        imageView.contentMode = UIViewContentMode.scaleAspectFill
        
        //adjustImageBrightness(brightness: -0.5)
        //CGImageRelease(cgImage!)
    }
    
    
    func handleData(typeInfo: Any!) -> Void {
        model = BannerModel.dataReader(typeInfo: typeInfo)
        
        let imageUrls : NSMutableArray = []
        
        for elem in model.data {
            let m = elem as! BannerBlockElemModel
            imageUrls.add(m.imageUrl)
        }
        
        
        cycleView1.setUrlsGroup(imageUrls as! Array<String>)
        //cycleView1.pageControlIndictirColor = UIColor.green
        //cycleView1.pageControlCurrentIndictirColor = UIColor.red
        cycleView1.scrollDirection = .horizontal
        cycleView1.isAutomatic = false
        cycleView1.isInfinite = false //无限轮播
        //cycleView1.timeInterval = 5
        cycleView1.delegate = self
        cycleView1.imageContentMode = UIViewContentMode.scaleAspectFill
        self.addSubview(cycleView1)
        
        cycleView1.snp.makeConstraints { (make) in
            make.edges.equalTo(self)
//            make.left.equalTo(self).offset(-cycleView1.collectionView.contentOffset.x)
//            make.top.bottom.right.equalTo(self)
        }
        
    }
    
    
    func cycleViewDidScrollToIndex(_ index: Int) {
        delog("\(index)")
    }
    
    func cycleViewDidSelectedIndex(_ index: Int) {
//        delog("selec \(index)")
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
