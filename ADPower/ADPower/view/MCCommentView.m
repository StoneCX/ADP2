//
//  MCCommentView.m
//  ADPowerpart2
//
//  Created by chengxc on 2016/12/28.
//  Copyright © 2016年 chengxc. All rights reserved.
//

#import "MCCommentView.h"
#import "MCCommentItem.h"
#import <UIImageView+WebCache.h>


@interface MCCommentView ()

@property (weak, nonatomic) IBOutlet UIImageView *brandImage;
@property (weak, nonatomic) IBOutlet UILabel *brandTitle;
@property (weak, nonatomic) IBOutlet UIImageView *isHot;
@property (weak, nonatomic) IBOutlet UILabel *playCount;
@property (weak, nonatomic) IBOutlet UIButton *commentCount;
@property (weak, nonatomic) IBOutlet UIButton *morebutton;

@end

@implementation MCCommentView

+ (instancetype)viewForXib{
    return [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil].firstObject;
}
- (IBAction)reviewDetail:(id)sender {
    
}

- (void)setItem:(MCCommentItem *)item{
    _item = item;
    
    [_brandImage sd_setImageWithURL:[NSURL URLWithString:item.brandImage]];
    _brandTitle.text = item.brandTitle;
    _isHot.hidden = item.is_hot;
    _playCount.text = [NSString stringWithFormat:@"%ld",item.playCount];
    [_commentCount setTitle:[NSString stringWithFormat:@"%ld",item.commentCount] forState:UIControlStateNormal];
    
}
- (void)layoutSubviews{
    CGFloat margin = 10;
    CGFloat width = SCREENW - margin*2;
    CGFloat Y = 200;
    CGFloat height = 25;
    self.frame = CGRectMake(margin, Y, width, height);
}



@end
