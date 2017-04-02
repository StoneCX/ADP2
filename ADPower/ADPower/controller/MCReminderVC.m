//
//  MCReminderVC.m
//  ADPower
//
//  Created by chengxc on 2016/11/26.
//  Copyright © 2016年 chengxue. All rights reserved.
//

#import "MCReminderVC.h"
#import "MCReminderItem.h"
#import "MCReminderCell.h"
#import "MCRecentController.h"
#import "MCCancelController.h"

@interface MCReminderVC ()


@end

static NSString *theID = @"reuseid";
#define ReminderRowH 50
#define titleH 30
@implementation MCReminderVC
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setBackButton];
    [self addChildVC];
    [self setNavigationitem];
    

}

//设置返回按钮样式
- (void)setBackButton{
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    NSMutableDictionary *attr = [NSMutableDictionary dictionary];
    attr[NSFontAttributeName] = [UIFont systemFontOfSize:14];
    attr[NSForegroundColorAttributeName] = [UIColor whiteColor];
    NSAttributedString *title = [[NSAttributedString alloc] initWithString:@"返回" attributes:attr];
    
    [backButton setAttributedTitle:title forState:UIControlStateNormal];
    [backButton setImage:[UIImage imageNamed:@"arrow_icon"] forState:UIControlStateNormal];
    [backButton setImage:[UIImage imageNamed:@"arrow_icon"] forState:UIControlStateHighlighted];
    [backButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [backButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateHighlighted];
    backButton.titleEdgeInsets = UIEdgeInsetsMake(0, 0, 0, -5);
    
    [backButton addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    
    UIView *btnContainer = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 38,17)];

    [btnContainer addSubview:backButton];
    [backButton sizeToFit];


    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithCustomView:btnContainer];
    // 设置导航条返回按钮
    self.navigationItem.leftBarButtonItem = backItem;
}

- (void)back{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)addChildVC{
    MCRecentController *recentVC = [[MCRecentController alloc]init];
    recentVC.title = @"最近";
    
    MCCancelController *cancelVC = [[MCCancelController alloc] init];
    cancelVC.title = @"取消记录";
    
    [self addChildViewController:recentVC];
    [self addChildViewController:cancelVC];
    
}
//title and rightBarButtonItem
- (void)setNavigationitem{

    NSMutableDictionary *attr = [NSMutableDictionary dictionary];
    attr[NSFontAttributeName] = [UIFont systemFontOfSize:19];
    attr[NSForegroundColorAttributeName] = [UIColor whiteColor];
    NSAttributedString *title = [[NSAttributedString alloc] initWithString:@"提醒" attributes:attr];
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.attributedText = title;
    [titleLabel sizeToFit];
    self.navigationItem.titleView = titleLabel;
    
    attr[NSFontAttributeName] = [UIFont systemFontOfSize:14];
    attr[NSForegroundColorAttributeName] = [UIColor whiteColor];
    NSAttributedString *right = [[NSAttributedString alloc] initWithString:@"筛选" attributes:attr];
    
    UIButton *rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [rightBtn setAttributedTitle:right forState:UIControlStateNormal];
    [rightBtn addTarget:self action:@selector(filter) forControlEvents:UIControlEventTouchUpInside];
    rightBtn.frame = CGRectMake(0, 0, 30, 30);
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithCustomView:rightBtn];
    self.navigationItem.rightBarButtonItem = rightItem;
    
    
}
//rightItem 的筛选功能
- (void)filter{
    
}




@end
