//
//  UIImage+ImageFromLayer.m
//  ADPowerpart2
//
//  Created by chengxc on 2017/1/4.
//  Copyright © 2017年 chengxc. All rights reserved.
//

#import "UIImage+ImageFromLayer.h"

@implementation UIImage (ImageFromLayer)

+ (UIImage *)imageFromLayer:(CALayer *)Layer
{
    UIGraphicsBeginImageContextWithOptions(Layer.frame.size, YES, 0);
    
    [Layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *outputImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return outputImage;
}
@end
