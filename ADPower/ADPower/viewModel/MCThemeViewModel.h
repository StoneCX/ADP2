//
//  MCThemeViewModel.h
//  ADPower
//
//  Created by chengxc on 2016/12/13.
//  Copyright © 2016年 chengxue. All rights reserved.
//

#import <Foundation/Foundation.h>

@class MCThemeItem;
@interface MCThemeViewModel : NSObject

@property (nonatomic, strong)MCThemeItem *item;
//照片的frame
@property (nonatomic, assign) CGRect imageViewFrame;
//评论frame
@property (nonatomic, assign) CGRect commentViewFrame;
//这里计算出cell的高度
@property (nonatomic, assign) CGFloat cellH;



@end
