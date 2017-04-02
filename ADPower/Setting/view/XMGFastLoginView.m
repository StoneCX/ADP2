//
//  XMGFastLoginView.m
//  BuDeJie17
//
//  Created by xiaomage on 16/7/28.
//  Copyright © 2016年 XiaoMaG. All rights reserved.
//

#import "XMGFastLoginView.h"

@implementation XMGFastLoginView
+ (instancetype)fastLoginView
{
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil] firstObject];
}
@end
