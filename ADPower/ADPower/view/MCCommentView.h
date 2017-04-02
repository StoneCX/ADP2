//
//  MCCommentView.h
//  ADPowerpart2
//
//  Created by chengxc on 2016/12/28.
//  Copyright © 2016年 chengxc. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MCCommentItem;
@interface MCCommentView : UIView

+ (instancetype)viewForXib;
@property (nonatomic, strong) MCCommentItem *item;

@end
