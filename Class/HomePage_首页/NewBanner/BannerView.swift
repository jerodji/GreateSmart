//
//  BannerView.swift
//  GreateSmart
//
//  Created by hailin on 2018/3/6.
//  Copyright © 2018年 Jerod. All rights reserved.
//

import UIKit

class BannerView: UIView {

    let imageView = UIImageView()
    var model = BannerModel()
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let myImage = UIImage.init(named: "screenPhoto")
        imageView.backgroundColor = .purple
        imageView.image = myImage
        self.addSubview(imageView)
        imageView.contentMode = UIViewContentMode.scaleAspectFill
        
        imageView.snp.makeConstraints { (make) in
            make.edges.equalTo(self).offset(0)
        }
        
        //adjustImageBrightness(brightness: -0.5)
        
        //CGImageRelease(cgImage!)
    }
    
    
    func handleData(typeInfo: Any!) -> Void {
        model = BannerModel.dataReader(typeInfo: typeInfo)
    }
    
    func adjustImageBrightness(brightness: CGFloat) -> Void {
        
        var myImage = imageView.image
        let context = CIContext.init(options: nil)
        let superImage = CIImage.init(cgImage: myImage!.cgImage!)
        let lighten = CIFilter.init(name: "CIColorControls")
        lighten?.setValue(superImage, forKey: kCIInputImageKey)
        lighten?.setValue(brightness, forKey: "inputBrightness") /* 亮度, -1---1   数越大越亮 */
        
        let result = lighten?.value(forKey: kCIOutputImageKey)
        let cgImage = context.createCGImage(result as! CIImage, from: superImage.extent)
        myImage = UIImage.init(cgImage: cgImage!)
    }
    
    
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
