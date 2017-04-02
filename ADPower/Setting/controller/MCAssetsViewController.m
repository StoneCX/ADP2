//
//  MCAssetsViewController.m
//  ADPower
//
//  Created by chengxc on 2016/11/12.
//  Copyright © 2016年 chengxue. All rights reserved.
//

#import "MCAssetsViewController.h"
#import "LoginRegisterViewController.h"



@interface MCAssetsViewController ()

@property (weak, nonatomic) IBOutlet UIView *underView;

@property (weak, nonatomic) IBOutlet UILabel *totalCount;
@property (weak, nonatomic) IBOutlet UIButton *avatorButton;
@property (weak, nonatomic) IBOutlet UIButton *loginRegisterButton;


@property (nonatomic ,strong) NSDictionary *userData;
@property (nonatomic ,assign) BOOL isLoginSuccess;

@end

@implementation MCAssetsViewController

- (IBAction)loginRegisterButtonClick:(id)sender {
    [self presentLoginRegisterVC];
}

- (IBAction)lrButtonClick:(id)sender{
    [self loginRegisterButtonClick:sender];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setCornerRadius];
    self.tableView.contentInset = UIEdgeInsetsMake(-30, 0, 0, 0);
    
    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    [center addObserver:self selector:@selector(handleNotification) name:@"" object:nil];
    
    
}

- (void)setCornerRadius {
    self.avatorButton.layer.cornerRadius = self.avatorButton.height *0.5;
    self.avatorButton.clipsToBounds = YES;
    self.loginRegisterButton.layer.cornerRadius = 5;
    self.loginRegisterButton.clipsToBounds = YES;
}

- (void)handleNotification {
    
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}


- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}

#pragma mark - Table view delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    [self presentLoginRegisterVC];
    
}

#pragma mark - assist method
- (void)presentLoginRegisterVC {
    __weak typeof(self) weakSelf = self;
    LoginRegisterViewController *lrVc = [[LoginRegisterViewController alloc] init];
    lrVc.loginStatue = ^(NSDictionary *userData){
        weakSelf.userData = userData;
        NSLog(@"%s-----data = %@",__func__,weakSelf.userData);
    };
    
    [self presentViewController:lrVc animated:YES completion:nil];
}


@end
