//
//  MCFileTools.h
//  ADPower
//
//  Created by chengxc on 2016/11/14.
//  Copyright © 2016年 chengxue. All rights reserved.
//
//  处理文件缓存

#import <Foundation/Foundation.h>

@interface MCFileTools : NSObject



/**
 获取文件大小

 @param directoryPath   文件路径
 @param completion 完成时的回调
 */
+ (void)getDirectoryPath:(NSString *)directoryPath completion:(void(^)(NSInteger))completion;


/**
 移除文件缓存

 @param directoryPath 需要移除的文件路径
 */
+ (void)removeDirectoryPathItem:(NSString *)directoryPath;


@end
