//
//  UIImage+MCImage.m
//  ADPower
//
//  Created by chengxc on 2016/10/29.
//  Copyright © 2016年 chengxue. All rights reserved.
//

#import "UIImage+MCImage.h"

@implementation UIImage (MCImage)

+ (instancetype)imageWithOriginalRender:(NSString *)imageName{
    UIImage *image = [UIImage imageNamed:imageName];
    UIImage *renderImage = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    return renderImage;
}



/**
 返回一个圆角图片

 @param radius 圆角图片半径
 @return 返回的圆角图片
 */
- (UIImage *)imagewithCornerRadius:(CGFloat)radius{
    CGRect rect = (CGRect){0.f,0.f,self.size};
    
    UIGraphicsBeginImageContextWithOptions(self.size, NO, UIScreen.mainScreen.scale);
    CGContextAddPath(UIGraphicsGetCurrentContext(), [UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:radius].CGPath);
    CGContextClip(UIGraphicsGetCurrentContext());
    
    [self drawInRect:rect];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return image;
}

@end
