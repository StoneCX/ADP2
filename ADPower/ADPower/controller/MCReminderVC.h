//
//  MCReminderVC.h
//  ADPower
//
//  Created by chengxc on 2016/11/26.
//  Copyright © 2016年 chengxue. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XCTitleViewController.h"

@class MCReminderItem;

@interface MCReminderVC : XCTitleViewController

@property (nonatomic, strong) MCReminderItem *reminderItem;

@end
