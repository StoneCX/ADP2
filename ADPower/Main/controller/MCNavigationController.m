//
//  MCNavigationController.m
//  ADPower
//
//  Created by chengxc on 2016/11/1.
//  Copyright © 2016年 chengxue. All rights reserved.
//

#import "MCNavigationController.h"
#import "UIColor+MCColor.h"
#import "UIImage+ImageFromLayer.h"

@interface MCNavigationController ()

@property (nonatomic, strong) CAGradientLayer *gLayer;

@end

@implementation MCNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
}

+ (void)initialize{
    
    if (self == [MCNavigationController class]) {
        
        NSArray *container = @[[self class]];
        UINavigationBar *nav = [UINavigationBar appearanceWhenContainedInInstancesOfClasses:container];
        
        // 设置字体颜色大小
        NSMutableDictionary *dictM = [NSMutableDictionary dictionary];
        //字体大小
        dictM[NSFontAttributeName] = [UIFont systemFontOfSize:17];
        // 字体颜色
        dictM[NSForegroundColorAttributeName] = [UIColor blackColor];
        
        [nav setTitleTextAttributes:dictM];
        
        
        // 设置导航条前景色
        //[nav setTintColor:[UIColor orangeColor]];
        
        CALayer *layer = [CALayer layer];
        layer.backgroundColor = [[UIColor colorWithHexadecimal:@"#006FDA"] CGColor];
        layer.frame = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"navigationbarBackgroundPink"]].frame;
        [nav setBackgroundImage:[UIImage imageFromLayer:layer] forBarMetrics:UIBarMetricsDefault];
        
        
        
    }
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    NSArray *container = @[[self class]];
    UINavigationBar *nav = [UINavigationBar appearanceWhenContainedInInstancesOfClasses:container];
    
    CALayer *layer = [CALayer layer];
    layer.backgroundColor = [[UIColor colorWithHexadecimal:@"#006FDA"] CGColor];
    layer.frame = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"navigationbarBackgroundPink"]].frame;
    [nav setBackgroundImage:[UIImage imageFromLayer:layer] forBarMetrics:UIBarMetricsDefault];
}


@end
