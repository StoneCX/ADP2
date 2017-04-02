//
//  MCImageStyleOne.m
//  ADPowerpart2
//
//  Created by chengxc on 2016/12/29.
//  Copyright © 2016年 chengxc. All rights reserved.
//

#import "MCImageStyleOne.h"

@interface MCImageStyleOne ()
@property (weak, nonatomic) IBOutlet UIImageView *smallImage;
@property (weak, nonatomic) IBOutlet UILabel *totalBonus;
@property (weak, nonatomic) IBOutlet UILabel *highest;
@property (weak, nonatomic) IBOutlet UILabel *period;
@property (weak, nonatomic) IBOutlet UILabel *slogan;
@property (weak, nonatomic) IBOutlet UILabel *numberOfImageLabel;
@end

@implementation MCImageStyleOne

+ (instancetype)viewForXib{
    return [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil].firstObject;
}


- (void)layoutSubviews{
    CGFloat margin = 10;
    CGFloat width = SCREENW - margin*2;
    CGFloat height = 115;
    self.frame = CGRectMake(margin, 0, width, height);
}

@end
