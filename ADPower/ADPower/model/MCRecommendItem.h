//
//  MCRecommendItem.h
//  ADPower
//
//  Created by chengxc on 2016/11/25.
//  Copyright © 2016年 chengxue. All rights reserved.
//

#import <Foundation/Foundation.h>
//ThemeItem
@interface MCRecommendItem : NSObject
//cell 内的数据
@property (nonatomic ,copy) NSString *url;

@property (nonatomic ,copy) NSString *title;

@property (nonatomic ,assign) NSInteger money;

@property (nonatomic ,assign) NSInteger catalog;

@property (nonatomic ,copy) NSString *keyword;

@property (nonatomic ,copy) NSString *descripe;

@property (nonatomic ,copy) NSString *author_pic;

@property (nonatomic ,copy) NSArray *images;

@property (nonatomic ,assign) NSInteger publish_time;

@property (nonatomic ,assign) NSInteger comment_num;

@property (nonatomic ,assign) NSInteger bonus;

//@property (nonatomic ,assign) NSInteger id;

@property (nonatomic ,assign) NSInteger image_num;

@property (nonatomic ,assign) NSInteger video_num;

@property (nonatomic ,assign) NSInteger read_num;

@property (nonatomic ,assign) NSInteger top_bonus;

@property (nonatomic ,assign) NSInteger top_bonus_people;

@property (nonatomic ,copy) NSString *author_name;

@property (nonatomic ,assign) NSInteger start_time;

@property (nonatomic ,assign) NSInteger end_time;

@property (nonatomic ,copy) NSString *mark;

@property (nonatomic ,copy) NSArray *videos;

@property (nonatomic ,copy) NSString *content;

@property (nonatomic ,assign) NSInteger cycle_time;

@property (nonatomic ,copy) NSString *property;

@property (nonatomic ,assign) BOOL *ignoreCase;

@property (nonatomic ,copy) NSString *nullHandling;

@property (nonatomic ,assign) BOOL *ascending;

@property (nonatomic ,copy) NSString *direction;

@property (nonatomic ,assign) NSInteger number;

@property (nonatomic ,copy) NSArray *sort;

@property (nonatomic ,assign) NSInteger numberOfElements;

@property (nonatomic ,assign) NSInteger totalPages;

@property (nonatomic ,assign) NSInteger size;

@property (nonatomic ,assign) BOOL *last;

@property (nonatomic ,assign) NSInteger totalElements;

@property (nonatomic ,assign) BOOL *first;

@property (nonatomic ,copy) NSString *msg;

@property (nonatomic ,copy) NSDictionary *data;

@property (nonatomic ,assign) NSInteger errorCode;

@end
