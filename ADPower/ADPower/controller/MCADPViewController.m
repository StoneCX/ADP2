//
//  MCADPViewController.m
//  ADPower
//
//  Created by chengxc on 2016/10/29.
//  Copyright © 2016年 chengxue. All rights reserved.
//

#import "MCADPViewController.h"
#import "UIColor+MCColor.h"
#import <QuartzCore/QuartzCore.h>
#import "MCRecommendVC.h"
#import "MCLocalVC.h"
#import "MCInterestVC.h"
#import "MCCommonwealVC.h"
#import "PYSearch.h"
#import "PYSearchConst.h"
#import "MCReminderVC.h"
#import "UIImage+aImage.h"




@interface MCADPViewController ()<UISearchBarDelegate, PYSearchViewControllerDelegate>

@property (nonatomic, strong) UINavigationController *nav;

@end

@implementation MCADPViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self addControllers];
    [self AddNavigationbarItem];
    [self addTitleView];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    UIImage *image = [UIImage imageWithColor:[UIColor colorWithHexString:@"#006FDA"]];
    [self.navigationController.navigationBar setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
}

#pragma mark - 添加左右item绑定点击事件
- (void)AddNavigationbarItem{
    //leftBarButtonItem
    //CGFloat marginX = 5;
    //CGFloat marginY = 20;
    CGFloat WH = 26;
    
    UIButton *leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftBtn setImage:[UIImage imageNamed:@"first_tx"] forState:UIControlStateNormal];
    leftBtn.frame = CGRectMake( 0, 0, WH, WH);
    //UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithCustomView:leftBtn];
    [leftBtn addTarget:self action:@selector(navLeftItemClick) forControlEvents:UIControlEventTouchUpInside];
    UIView *btnContainer = [[UIView alloc] initWithFrame:CGRectMake(0, 0, WH, WH)];
    [btnContainer addSubview:leftBtn];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:btnContainer];
    
    UIButton *rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [rightBtn setImage:[UIImage imageNamed:@"jia"] forState:UIControlStateNormal];
    rightBtn.frame = CGRectMake(0, 0, WH, WH);
    [rightBtn addTarget:self action:@selector(navRightItemClick) forControlEvents:UIControlEventTouchUpInside];
    
    UIView *rightContainer = [[UIView alloc] initWithFrame:CGRectMake(0, 0, WH, WH)];
    [rightContainer addSubview:rightBtn];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:rightContainer];
}

- (void)navLeftItemClick{
    MCReminderVC *reminder = [[MCReminderVC alloc] init];
    reminder.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:reminder animated:YES];
}

- (void)navRightItemClick{
    
}


//给cell 添加控制器
- (void)addControllers{
    
    
    MCRecommendVC *rmdvc = [[MCRecommendVC alloc] init];
    rmdvc.title = @"推荐";
    
    MCInterestVC *interestVC = [[MCInterestVC alloc] init];
    interestVC.title = @"兴趣";
    
    MCLocalVC *localVC = [[MCLocalVC alloc] init];
    localVC.title = @"本地";
    
    MCCommonwealVC *cWealVC = [[MCCommonwealVC alloc] init];
    cWealVC.title = @"公益";
    
    [self addChildViewController:rmdvc];
    [self addChildViewController:interestVC];
    [self addChildViewController:localVC];
    [self addChildViewController:cWealVC];
}



- (void)addTitleView{
    
    
    UISearchBar *searchbar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, 169, 22)];
    searchbar.backgroundImage = [UIImage imageNamed:@"ss"];
    searchbar.translucent = YES;
    searchbar.placeholder = @"请输入查找内容";
    searchbar.delegate = self;
    
    UIView *tView = [[UIView alloc] initWithFrame:CGRectMake(103, 21, 169, 22)];
    tView.layer.cornerRadius = 5;
    tView.layer.masksToBounds = YES;
    tView.backgroundColor = [UIColor clearColor];
    
    [tView addSubview:searchbar];
    self.navigationItem.titleView = tView;
    
}

#pragma mark- UISearchBarDelegate;
- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar{
    
    //热门搜索内容，上线从服务器返回数据
    NSArray *hotSeaches = @[@"Java", @"Python", @"Objective-C", @"Swift", @"C", @"C++", @"PHP", @"C#", @"Perl", @"Go", @"JavaScript", @"R", @"Ruby", @"MATLAB"];
    PYSearchViewController *searchVC = [PYSearchViewController searchViewControllerWithHotSearches:hotSeaches searchBarPlaceholder:@"请输入关键词" didSearchBlock:^(PYSearchViewController *searchViewController, UISearchBar *searchBar, NSString *searchText) {
        //点击搜索之后需要做的事
        
    }];
    
    searchVC.delegate = self;
    
    searchVC.navigationItem.hidesBackButton = YES;
    //[self.navigationController pushViewController:searchVC animated:YES];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:searchVC];
    self.nav = nav;
    [self presentViewController:nav animated:NO completion:^{
        NSLog(@"%s",__func__);
    }];
     return YES;
}
//搜索框文字变化时
- (void)searchViewController:(PYSearchViewController *)searchViewController searchTextDidChange:(UISearchBar *)seachBar searchText:(NSString *)searchText{
    if (searchText.length) { // 与搜索条件再搜索
        // 根据条件发送查询（这里模拟搜索）
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.25 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{ // 搜素完毕
            // 显示建议搜索结果
            NSMutableArray *searchSuggestionsM = [NSMutableArray array];
            for (int i = 0; i < arc4random_uniform(5) + 5; i++) {
                NSString *searchSuggestion = [NSString stringWithFormat:@"搜索建议 %d", i];
                [searchSuggestionsM addObject:searchSuggestion];
            }
            // 返回
            searchViewController.searchSuggestions = searchSuggestionsM;
        });
    }
}
//点击搜索开始做的事
- (void)searchViewController:(PYSearchViewController *)searchViewController didSearchWithsearchBar:(UISearchBar *)searchBar searchText:(NSString *)searchText {
    UIViewController *controller = [[UIViewController alloc] init];
    controller.view.backgroundColor = PYSEARCH_RANDOM_COLOR;
    [self.nav pushViewController:controller animated:YES];
    
}

@end
