//
//  MCUserItem.h
//  ADPowerpart2
//
//  Created by chengxc on 2017/3/17.
//  Copyright © 2017年 chengxc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MCUserItem : NSObject

@property (nonatomic ,copy) NSString *assets;
@property (nonatomic ,copy) NSString *auth_key;
@property (nonatomic ,copy) NSString *email;
@property (nonatomic ,copy) NSString *head_pic;
//@property (nonatomic ,assign) NSUInteger id;
@property (nonatomic ,copy) NSString *id_card;
@property (nonatomic ,assign) NSUInteger *login_time;
@property (nonatomic ,copy) NSString *name;
@property (nonatomic ,copy) NSString *nick_name;
@property (nonatomic ,assign) NSUInteger register_time;
@property (nonatomic ,copy) NSString *sex;
@property (nonatomic ,assign) NSUInteger *tel;




@end
