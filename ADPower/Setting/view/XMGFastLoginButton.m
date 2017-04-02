//
//  XMGFastLoginButton.m
//  BuDeJie17
//
//  Created by xiaomage on 16/7/28.
//  Copyright © 2016年 XiaoMaG. All rights reserved.
//

#import "XMGFastLoginButton.h"

@implementation XMGFastLoginButton

- (void)layoutSubviews
{
    // 一定要调用layoutSubviews
    [super layoutSubviews];
    
    self.imageView.mc_centerX = self.mc_width * 0.5;
    self.imageView.mc_y = 20;
    
    // 设置label尺寸
    // 计算文字尺寸 设置label尺寸
//    CGFloat w = [self.titleLabel.text sizeWithFont:[UIFont systemFontOfSize:18]].width;
//    self.titleLabel.xmg_width = w;
    [self.titleLabel sizeToFit];
    
    // 设置中心点
    self.titleLabel.mc_centerX = self.mc_width * 0.5;
    self.titleLabel.mc_y = self.mc_height - self.titleLabel.mc_height;

}

@end
