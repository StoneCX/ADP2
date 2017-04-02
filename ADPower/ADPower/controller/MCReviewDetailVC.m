//
//  MCReviewDetailVC.m
//  ADPowerpart2
//
//  Created by chengxc on 2017/1/3.
//  Copyright © 2017年 chengxc. All rights reserved.
//

#import "MCReviewDetailVC.h"

@interface MCReviewDetailVC ()
@property (weak, nonatomic) IBOutlet UIScrollView *theScrollView;

@end

@implementation MCReviewDetailVC

- (instancetype)init{
    UIStoryboard *story = [UIStoryboard storyboardWithName:NSStringFromClass([self class]) bundle:nil];
    self = [story instantiateInitialViewController];
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    //self.theScrollView addSubview:<#(nonnull UIView *)#>
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
