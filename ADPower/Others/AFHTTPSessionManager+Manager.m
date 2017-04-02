//
//  AFHTTPSessionManager+Manager.m
//  ADPower
//
//  Created by chengxc on 2016/12/14.
//  Copyright © 2016年 chengxue. All rights reserved.
//

#import "AFHTTPSessionManager+Manager.h"

@implementation AFHTTPSessionManager (Manager)

+ (instancetype)mc_manager{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    // custom AFN response object
    AFJSONResponseSerializer *responseSerializer = [AFJSONResponseSerializer serializer];
    // This will make the AFJSONResponseSerializer accept any content type
    // 让JSON响应序列着接受任意类型对象
    responseSerializer.acceptableContentTypes = nil;
    manager.responseSerializer = responseSerializer;
    
    
    
    return manager;
}

@end
