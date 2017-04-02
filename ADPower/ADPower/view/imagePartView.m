//
//  imagePartView.m
//  ADPowerpart2
//
//  Created by chengxc on 2016/12/28.
//  Copyright © 2016年 chengxc. All rights reserved.
//

#import "imagePartView.h"
#import <UIImageView+WebCache.h>
#import "MCCommentItem.h"

@interface imagePartView ()

@property (weak, nonatomic) IBOutlet UIImageView *theImage;
@property (weak, nonatomic) IBOutlet UIView *backView;
@property (weak, nonatomic) IBOutlet UILabel *totalBonus;
@property (weak, nonatomic) IBOutlet UILabel *highest;
@property (weak, nonatomic) IBOutlet UILabel *period;
@property (weak, nonatomic) IBOutlet UILabel *slogan;

@end

@implementation imagePartView

+ (instancetype)viewForXib{
    return [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil].firstObject;
}

- (void)setItem:(MCCommentItem *)item{
    _item = item;
    [_theImage sd_setImageWithURL:[NSURL URLWithString:item.imageUrl]];
    _totalBonus.text = [NSString stringWithFormat:@"%ld万",item.totalBonus];
    _highest.text = [NSString stringWithFormat:@"%ld万",item.highest];
    _period.text = [NSString stringWithFormat:@"%ld天",item.period];
}
- (void)layoutSubviews{
    CGFloat margin = 10;
    CGFloat width = SCREENW - margin*2;
    CGFloat height = 200;
    self.frame = CGRectMake(margin, 0, width, height);
}


@end
