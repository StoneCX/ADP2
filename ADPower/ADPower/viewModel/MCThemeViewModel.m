//
//  MCThemeViewModel.m
//  ADPower
//
//  Created by chengxc on 2016/12/13.
//  Copyright © 2016年 chengxue. All rights reserved.
//

#import "MCThemeViewModel.h"

@implementation MCThemeViewModel

- (void)setItem:(MCThemeItem *)item{
    _item = item;
    
    //计算cell上半部分图片的frame
    CGFloat margin = 10;
    CGFloat height = 200;
    CGFloat width = SCREENW- margin * 2;
    CGFloat commentHeigt = 25;
    _imageViewFrame = CGRectMake(margin, 0, width, height);
    _commentViewFrame = CGRectMake(margin, height, width, commentHeigt);
    
    _cellH = height + commentHeigt;
}

@end
