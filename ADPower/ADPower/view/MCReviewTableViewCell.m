//
//  MCReviewTableViewCell.m
//  ADPowerpart2
//
//  Created by chengxc on 2017/3/12.
//  Copyright © 2017年 chengxc. All rights reserved.
//

#import "MCReviewTableViewCell.h"

@interface MCReviewTableViewCell ()
@property (weak, nonatomic) IBOutlet UIImageView *avatorImg;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UIButton *likeButton;
@property (weak, nonatomic) IBOutlet UILabel *likeCount;
@property (weak, nonatomic) IBOutlet UILabel *reviewContent;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UIButton *replyButton;

@end
@implementation MCReviewTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
