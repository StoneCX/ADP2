//
//  MCTabBarController.m
//  ADPower
//
//  Created by chengxc on 2016/10/29.
//  Copyright © 2016年 chengxue. All rights reserved.
//

#import "MCTabBarController.h"
#import "MCADPViewController.h"
#import "MCQQViewController.h"
#import "MCFriendViewController.h"
#import "MCAssetsViewController.h"
#import "UIImage+MCImage.h"
#import "UIColor+MCColor.h"
#import "MCNavigationController.h"


@interface MCTabBarController ()

@property (strong, nonatomic) MCADPViewController *ADPController;
@property (strong, nonatomic) MCNavigationController *navC;

@end

@implementation MCTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //[self loadViewIfNeeded];
    //CGSize asize = CGSizeMake([UIScreen mainScreen].bounds.size.width, 98);
    //CGRect aRect = CGRectMake(0,[UIScreen mainScreen].bounds.size.height-98, [UIScreen mainScreen].bounds.size.width, 98);
    
    
    self.view.tintColor = [UIColor colorWithHexadecimal:@"#80C9FE"];
    //NSLog(@"%@",self.tabBar);
    [self setAllChildController];
    [self setAllTabBarButton];
}

//+ (void)load{
//    //获取所有tabbarItem
//    /*
//     注意点:
//     1.任何对象都能使用appearance吗? 只要遵守了UIAppearance就可以使用appearance
//     2.任何属性都可以使用appearance设置吗? 不能
//     3.哪些属性可以通过appearance设置?只有带有UI_APPEARANCE_SELECTOR宏属性,才能去设置
//     4.如果使用appearance设置属性,必须要在显示之前去设置.
//     */
//    UITabBarItem *tbItem = [UITabBarItem appearance];
//    NSMutableDictionary *attr = [NSMutableDictionary dictionary];
//    //attr[NSForegroundColorAttributeName] = [UIColor colorWithHexadecimal:@"#80C9FE"];
//    
//    //attr = [NSMutableDictionary dictionary];
//    attr[NSFontAttributeName] = [UIFont systemFontOfSize:13];
//    
//    [tbItem setTitleTextAttributes:attr forState:UIControlStateSelected];
//    [tbItem setTitleTextAttributes:attr forState:UIControlStateNormal];
//}

- (void)setAllTabBarButton{
    UIViewController *vc0 = self.childViewControllers[0];
    vc0.tabBarItem.title = @"广告宝";
    vc0.tabBarItem.image = [UIImage imageNamed:@"index"];
    vc0.tabBarItem.selectedImage = [UIImage imageWithOriginalRender:@"index"];
    
    UIViewController *vc1 = self.childViewControllers[1];
    vc1.tabBarItem.title = @"圈圈";
    vc1.tabBarItem.image = [UIImage imageNamed:@"qq"];
    vc1.tabBarItem.selectedImage = [UIImage imageNamed:@"qq"];
    
    UIViewController *vc2 = self.childViewControllers[2];
    vc2.tabBarItem.title = @"朋友";
    vc2.tabBarItem.image = [UIImage imageNamed:@"py"];
    vc2.tabBarItem.selectedImage = [UIImage imageNamed:@"py"];
    
    UIViewController *vc3 = self.childViewControllers[3];
    vc3.tabBarItem.title = @"资产";
    vc3.tabBarItem.image = [UIImage imageNamed:@"sz"];
    vc3.tabBarItem.selectedImage = [UIImage imageNamed:@"sz"];
    
    
    
}

- (void)setAllChildController{
    MCADPViewController *vc0 = [[MCADPViewController alloc] init];
    //vc0.view.backgroundColor = [UIColor grayColor];
    MCNavigationController *navC0 = [[MCNavigationController alloc] initWithRootViewController:vc0];
    [self addChildViewController:navC0];
    
    MCQQViewController *vc1 = [[MCQQViewController alloc] init];
    vc1.view.backgroundColor = [UIColor whiteColor];
    UINavigationController *navC1 = [[MCNavigationController alloc] initWithRootViewController:vc1];
    [self addChildViewController:navC1];
    
    MCFriendViewController *vc2 = [[MCFriendViewController alloc] init];
    vc2.view.backgroundColor = [UIColor whiteColor];
    UINavigationController *navC2 = [[MCNavigationController alloc] initWithRootViewController:vc2];
    [self addChildViewController:navC2];
    
    
    UIStoryboard *storyb = [UIStoryboard storyboardWithName:@"MCAssetsViewController" bundle:nil];
    MCAssetsViewController *vc3 = [storyb instantiateInitialViewController];
    //vc3.view.backgroundColor = [UIColor whiteColor];
    UINavigationController *navC3 = [[MCNavigationController alloc] initWithRootViewController:vc3];
    [self addChildViewController:navC3];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
