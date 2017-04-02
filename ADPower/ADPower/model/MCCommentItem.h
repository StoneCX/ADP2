//
//  MCCommentItem.h
//  ADPowerpart2
//
//  Created by chengxc on 2016/12/28.
//  Copyright © 2016年 chengxc. All rights reserved.
//

#import <Foundation/Foundation.h>
//视屏cell数据
@interface MCCommentItem : NSObject

@property (nonatomic, strong) NSString *imageUrl;
@property (nonatomic, assign) NSInteger totalBonus;
@property (nonatomic, assign) NSInteger highest;
@property (nonatomic, assign) NSInteger period;
@property (nonatomic, strong) NSString *slogan;


//评论
@property (nonatomic, strong) NSString *brandImage;
@property (nonatomic, strong) NSString *brandTitle;

@property (nonatomic, assign) BOOL is_hot;
@property (nonatomic, assign) NSInteger playCount;
@property (nonatomic, assign) NSInteger commentCount;




@end
