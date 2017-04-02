//
//  MCThemeItem.h
//  ADPower
//
//  Created by chengxc on 2016/12/13.
//  Copyright © 2016年 chengxue. All rights reserved.
//

#import <Foundation/Foundation.h>


typedef enum : NSInteger {
    MCThemeItemTypeRecommend = 1,
    MCThemeItemTypeLacal = 2,
    MCThemeItemTypeInterest = 3,
    MCThemeItemTypeCommenWeal = 4
} MCThemeItemType;
@interface MCThemeItem : NSObject

//@property (nonatomic, assign) NSInteger errorCode;
//@property (nonatomic, strong) NSString *msg;
//@property (nonatomic, strong) NSObject *data;

@property (nonatomic, strong) NSArray *content;
@property (nonatomic, assign) BOOL last;
@property (nonatomic, assign) NSInteger totalPages;
@property (nonatomic, assign) NSInteger totalElements;
@property (nonatomic, assign) NSInteger numberOfElements;
@property (nonatomic, assign) BOOL first;
@property (nonatomic, strong) NSArray *sort;
@property (nonatomic, assign) NSInteger *size;
@property (nonatomic, assign) NSInteger *number;

@end
