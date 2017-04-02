//
//  MCReviewItem.h
//  ADPowerpart2
//
//  Created by chengxc on 2017/3/12.
//  Copyright © 2017年 chengxc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MCReviewItem : NSObject

@property (strong, nonatomic)  UIImageView *avatorImg;
@property (strong, nonatomic)  UILabel *nameLabel;
@property (strong, nonatomic)  UIButton *likeButton;
@property (strong, nonatomic)  UILabel *likeCount;
@property (strong, nonatomic)  UILabel *reviewContent;
@property (strong, nonatomic)  UILabel *timeLabel;
@property (strong, nonatomic)  UIButton *replyButton;

@end
