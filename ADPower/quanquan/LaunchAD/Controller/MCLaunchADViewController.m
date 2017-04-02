//
//  MCLaunchADViewController.m
//  ADPowerpart2
//
//  Created by chengxc on 2016/12/27.
//  Copyright © 2016年 chengxc. All rights reserved.
//

#import "MCLaunchADViewController.h"
#import "AFHTTPSessionManager+Manager.h"
#import "MCADItem.h"
#import <MJExtension/MJExtension.h>
#import <UIImageView+WebCache.h>
#import "MCTabBarController.h"


#define Code2 @"phcqnauGuHYkFMRquANhmgN_IauBThfqmgKsUARhIWdGULPxnz3vndtkQW08nau_I1Y1P1Rhmhwz5Hb8nBuL5HDknWRhTA_qmvqVQhGGUhI_py4MQhF1TvChmgKY5H6hmyPW5RFRHzuET1dGULnhuAN85HchUy7s5HDhIywGujY3P1n3mWb1PvDLnvF-Pyf4mHR4nyRvmWPBmhwBPjcLPyfsPHT3uWm4FMPLpHYkFh7sTA-b5yRzPj6sPvRdFhPdTWYsFMKzuykEmyfqnauGuAu95Rnsnbfknbm1QHnkwW6VPjujnBdKfWD1QHnsnbRsnHwKfYwAwiu9mLfqHbD_H70hTv6qnHn1PauVmynqnjclnj0lnj0lnj0lnj0lnj0hThYqniuVujYkFhkC5HRvnB3dFh7spyfqnW0srj64nBu9TjYsFMub5HDhTZFEujdzTLK_mgPCFMP85Rnsnbfknbm1QHnkwW6VPjujnBdKfWD1QHnsnbRsnHwKfYwAwiuBnHfdnjD4rjnvPWYkFh7sTZu-TWY1QW68nBuWUHYdnHchIAYqPHDzFhqsmyPGIZbqniuYThuYTjd1uAVxnz3vnzu9IjYzFh6qP1RsFMws5y-fpAq8uHT_nBuYmycqnau1IjYkPjRsnHb3n1mvnHDkQWD4niuVmybqniu1uy3qwD-HQDFKHakHHNn_HR7fQ7uDQ7PcHzkHiR3_RYqNQD7jfzkPiRn_wdKHQDP5HikPfRb_fNc_NbwPQDdRHzkDiNchTvwW5HnvPj0zQWndnHRvnBsdPWb4ri3kPW0kPHmhmLnqPH6LP1ndm1-WPyDvnHKBrAw9nju9PHIhmH9WmH6zrjRhTv7_5iu85HDhTvd15HDhTLTqP1RsFh4ETjYYPW0sPzuVuyYqn1mYnjc8nWbvrjTdQjRvrHb4QWDvnjDdPBuk5yRzPj6sPvRdgvPsTBu_my4bTvP9TARqnam"

#define iPhone7P (SCREENH == 736)
#define iPhone6P (SCREENH == 736)
#define iPhone7 (SCREENH == 667)
#define iPhone6 (SCREENH == 667)
#define iPhone5 (SCREENH == 568)
#define iPhone4 (SCREENH == 480)
@interface MCLaunchADViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *launchImageView;
@property (weak, nonatomic) IBOutlet UIView *launchADView;
@property (weak, nonatomic) IBOutlet UIButton *jumpButton;

@property (nonatomic, weak) NSTimer *timer;

@property (nonatomic, strong) MCADItem *item;

@end

@implementation MCLaunchADViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // 设置启动图片
    [self setLaunchImage];
    
    // 显示广告图片 => 找服务器获取数据 => 查看接口文档 => 验证接口(在浏览器输入完整url) => 使用AFN加载数据 => 解析数据(写成plist) => 设计模型(定义属性)=> 字典转模型 => 把模型展示到界面
    [self loadADData];
    
    // 添加定时器
    _timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timeChange) userInfo:nil repeats:YES];
    
}
// 每隔一秒就会调用
- (void)timeChange
{
    static int i = 3;
    // 修改按钮文字
    i--;
    
    [_jumpButton setTitle:[NSString stringWithFormat:@"跳过 (%d)",i] forState:UIControlStateNormal];
    
    if (i == -1) {
        [self jumpButtonClick:nil];
    }
    
}

- (void)loadADData{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager mc_manager];
    NSMutableDictionary *paramater = [NSMutableDictionary dictionary];
    paramater[@"code2"] = Code2;
    
    [manager GET:@"http://mobads.baidu.com/cpro/ui/mads.php" parameters:paramater progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSDictionary *adDict = [responseObject[@"ad"] firstObject];
        MCADItem *item = [MCADItem mj_objectWithKeyValues:adDict];
        _item = item;
        
        UIImageView *adImageView = [[UIImageView alloc] init];
        [adImageView sd_setImageWithURL:[NSURL URLWithString:_item.w_picurl]];
        
        [_launchADView addSubview:adImageView];
        adImageView.frame = CGRectMake(0, 0, SCREENW, SCREENH);
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
    }];
    
}

- (void)setLaunchImage{
    UIImage *image = [[UIImage alloc] init];
    if (iPhone6P || iPhone7P) {
        image = [UIImage imageNamed:@"LaunchImage-800-Portrait-736h@3x"];
    } else if (iPhone6 ||iPhone7) {
        image = [UIImage imageNamed:@"LaunchImage-800-667h"];
    } else if (iPhone5) {
        image = [UIImage imageNamed:@"LaunchImage-568h"];
    } else if (iPhone4) {
        image = [UIImage imageNamed:@"LaunchImage-700"];
    }
    _launchImageView.image = image;
}

- (IBAction)jumpButtonClick:(UIButton *)sender {
    MCTabBarController *tabVC = [[MCTabBarController alloc] init];
    UIApplication *app = [UIApplication sharedApplication];
    app.keyWindow.rootViewController = tabVC;
    [_timer invalidate];
}


@end
