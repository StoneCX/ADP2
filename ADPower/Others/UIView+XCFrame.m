//
//  UIView+XCFrame.m
//  neteasecheng1
//
//  Created by chengxc on 16/9/2.
//  Copyright © 2016年 chengxc. All rights reserved.
//

#import "UIView+XCFrame.h"

@implementation UIView (XCFrame)
- (void)setMc_width:(CGFloat)width{
    CGRect theRect = self.frame;
    theRect.size.width = width;
    self.frame = theRect;
}

- (CGFloat)mc_width{
    return self.frame.size.width;
}


- (void)setMc_height:(CGFloat)height{
    CGRect theRect = self.frame;
    theRect.size.height = height;
    self.frame = theRect;
}

- (CGFloat)mc_height{
    return self.frame.size.height;
}

- (void)setMc_centerX:(CGFloat)centerX{
    CGPoint center = self.center;
    center.x = centerX;
    self.center = center;
}

- (CGFloat)mc_centerX{
    return self.center.x;
}

- (void)setMc_centerY:(CGFloat)centerY{
    CGPoint center = self.center;
    center.y = centerY;
    self.center = center;
}

- (CGFloat)mc_centerY{
    return self.center.y;
}

- (void)setMc_x:(CGFloat)x{
    CGRect theRect = self.frame;
    theRect.origin.x = x;
    self.frame = theRect;
}

- (CGFloat)mc_x{
    return self.frame.origin.x;
}

- (void)setMc_y:(CGFloat)y{
    CGRect theRect = self.frame;
    theRect.origin.y = y;
    self.frame = theRect;
}

- (CGFloat)mc_y{
    return self.frame.origin.y;
}





@end
