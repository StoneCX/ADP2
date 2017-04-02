//
//  UIImage+aImage.m
//  思考如何实现一个功能可删除
//
//  Created by chengxc on 2017/2/25.
//  Copyright © 2017年 chengxue. All rights reserved.
//

#import "UIImage+aImage.h"

@implementation UIImage (aImage)

+ (UIImage *)imageWithColor:(UIColor *)color {
    
    /*// 描述矩形
     CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
     
     // 开启位图上下文
     UIGraphicsBeginImageContext(rect.size);
     // 获取位图上下文
     CGContextRef context = UIGraphicsGetCurrentContext();
     // 使用color演示填充上下文
     CGContextSetFillColorWithColor(context, [color CGColor]);
     // 渲染上下文
     CGContextFillRect(context, rect);
     // 从上下文中获取图片
     UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
     // 结束上下文
     UIGraphicsEndImageContext();
     
     return theImage;*/
    CGRect rect = CGRectMake(0.0, 0.0, 1.0, 1.0);
    
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
    
    
}

@end
