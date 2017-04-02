//
//  MCFileTools.m
//  ADPower
//
//  Created by chengxc on 2016/11/14.
//  Copyright © 2016年 chengxue. All rights reserved.
//

#import "MCFileTools.h"

@implementation MCFileTools

+ (void)getDirectoryPath:(NSString *)directoryPath completion:(void (^)(NSInteger))completion{
    //传入路径
    //检查路径正确性，(是否为文件夹 是否正确路径)
    NSFileManager *fileMgr = [NSFileManager defaultManager];
    BOOL isDirectory;
    BOOL isExist = [fileMgr fileExistsAtPath:directoryPath isDirectory:&isDirectory];
    
    //处理不存在或不是文件夹的情况,当使用产生错误时快速了解原因。
    if (!isDirectory || !isExist) {
        NSException *exception = [NSException exceptionWithName:@"notFileOrNotExist" reason:@"is not Directory or not exist" userInfo:nil];
        [exception raise];
    }
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        NSArray *subpaths = [fileMgr contentsOfDirectoryAtPath:directoryPath error:nil];
        
        for (NSString *subPath in subpaths) {
            NSString *fullPath = [subPath stringByAppendingString:directoryPath];
            
            
            //是隐藏文件时略过
            if ([fullPath containsString:@".DS"]) continue;
            
            
            BOOL isDirectory;
            BOOL isExist = [fileMgr fileExistsAtPath:subPath isDirectory:&isDirectory];
            //不存在 ，不是文件夹，略过
            if (!isDirectory || !isExist) continue;
            
            NSDictionary *attr = [fileMgr attributesOfItemAtPath:fullPath error:nil];
            
            NSInteger attrSize = [attr fileSize];
            
            NSInteger totalSize = 0;
            totalSize += attrSize;
            
            dispatch_sync(dispatch_get_main_queue(), ^{
                completion(totalSize);
            });
            
        }
        
    });
    
    
    
    
    
}

+ (void)removeDirectoryPathItem:(NSString *)directoryPath{
    //遍历出文件夹中的所有子文件夹
    NSFileManager *fileMgr = [NSFileManager defaultManager];
    BOOL isDirectory;
    BOOL isExist = [fileMgr fileExistsAtPath:directoryPath isDirectory:&isDirectory];
    
    //处理不存在或不是文件夹的情况,当使用产生错误时快速了解原因。
    if (!isDirectory || !isExist) {
        NSException *exception = [NSException exceptionWithName:@"notFileOrNotExist" reason:@"is not Directory or not exist" userInfo:nil];
        [exception raise];
    }
    
    NSArray *subPaths = [fileMgr contentsOfDirectoryAtPath:directoryPath error:nil];
    for (NSString *subPath in subPaths){
        NSString *fullPath = [subPath stringByAppendingString:directoryPath];
        [fileMgr removeItemAtPath:fullPath error:nil];
    }
}
@end
