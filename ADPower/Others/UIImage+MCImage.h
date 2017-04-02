//
//  UIImage+MCImage.h
//  ADPower
//
//  Created by chengxc on 2016/10/29.
//  Copyright © 2016年 chengxue. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (MCImage)


//传递一个图片换回一个没有渲染的图片。
+ (instancetype)imageWithOriginalRender:(NSString *)imageName;

- (UIImage *)imagewithCornerRadius:(CGFloat)radius;
@end
