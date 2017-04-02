//
//  MCADItem.h
//  ADPowerpart2
//
//  Created by chengxc on 2016/12/27.
//  Copyright © 2016年 chengxc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MCADItem : NSObject

@property (nonatomic, strong) NSString *w_picurl;
@property (nonatomic, strong) NSString *ori_curl;

@property (nonatomic, assign) float w;
@property (nonatomic, assign) float h;

@end
