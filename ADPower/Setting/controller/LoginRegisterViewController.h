//
//  LoginRegisterViewController.h
//  ADPowerpart2
//
//  Created by chengxc on 2017/3/7.
//  Copyright © 2017年 chengxc. All rights reserved.
//

#import <UIKit/UIKit.h>



@interface LoginRegisterViewController : UIViewController

@property (nonatomic, strong) void(^loginStatue)(NSDictionary *userData);

@end
