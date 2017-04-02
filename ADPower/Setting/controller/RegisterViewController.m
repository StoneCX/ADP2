//
//  RegisterViewController.m
//  ADPowerpart2
//
//  Created by chengxc on 2017/3/8.
//  Copyright © 2017年 chengxc. All rights reserved.
//

#import "RegisterViewController.h"
#import <SVProgressHUD.h>
#import "AFHTTPSessionManager+Manager.h"

@interface RegisterViewController () <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UIButton *sendCodeBtn;
@property (weak, nonatomic) IBOutlet UIButton *registerBtn;
@property (weak, nonatomic) IBOutlet UITextField *verificationField;
@property (weak, nonatomic) IBOutlet UITextField *regisAccount;
@property (weak, nonatomic) IBOutlet UITextField *regisPasswd;


@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.verificationField.delegate = self;
    self.regisAccount.delegate = self;
    self.regisPasswd.delegate = self;
    [self setViewsAppearance];
    
}

- (void)setViewsAppearance {
    self.sendCodeBtn.layer.cornerRadius = 8;
    self.sendCodeBtn.clipsToBounds = YES;
    
    self.registerBtn.layer.cornerRadius = 5;
    self.registerBtn.clipsToBounds = YES;
}
- (IBAction)sendCodeBtnPress:(id)sender {
    
}

//需要做几件事1.收回键盘 2.显示小菊花 3.显示错误或者成功信息.
- (IBAction)registerBtnPress:(id)sender {
    [self dismissKeypad];
    
    
    __weak typeof(self) weakSelf = self;
    
    AFHTTPSessionManager *sessionManager = [AFHTTPSessionManager mc_manager];
    NSString *account = self.regisAccount.text;
    NSString *passwd = [self.regisPasswd.text md5String];
    
    NSInteger randomNumber = arc4random_uniform(1000000);
    NSString *randomStr = [NSString stringWithFormat:@"%ld@qq.com",randomNumber];
    //NSString *email = @"123456@qq.com";
    NSDictionary *dict = @{@"tel":account,
                           @"passwd":passwd,
                           @"email":randomStr};
    
    
    dispatch_queue_t serialThread = dispatch_queue_create("queue", DISPATCH_QUEUE_SERIAL);
    dispatch_async(serialThread, ^{
        NSURL *baseURL = [NSURL URLWithString:MCbaseURL];
        NSURL *requestURL = [NSURL URLWithString:@"register" relativeToURL:baseURL];
        NSLog(@"%@",requestURL.absoluteString);
        
        [sessionManager GET:requestURL.absoluteString parameters:dict progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            
            
            NSLog(@"errorCode====%@",responseObject[@"errorCode"]);
            
            if ([responseObject[@"errorCode"]  isEqual: @0]) {
                [SVProgressHUD showWithStatus:@"注册成功,请登录"];
                [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeBlack];
                [SVProgressHUD dismissWithDelay:1.0 completion:nil];
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                    [weakSelf dismissViewControllerAnimated:YES completion:nil];
                });
            }else {
                [SVProgressHUD showWithStatus:@"账号名已经存在"];
                [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeBlack];
                [SVProgressHUD dismissWithDelay:0.5 completion:nil];
            }
            
            
            
            NSDictionary *data = responseObject[@"data"];
            NSLog(@"responseObject====%@",responseObject);
            NSLog(@"data = %@",data);
            
            
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            if (error) {
                NSLog(@"error = %@",error);
            }
        }];
    });
    
}
- (IBAction)secureBtnPress:(UIButton *)sender {
    sender.selected = !sender.selected;
    self.regisPasswd.secureTextEntry = !self.regisPasswd.secureTextEntry;
}
- (IBAction)closeBtnPress:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)dismissKeypad {
    [self.regisPasswd endEditing:YES];
    [self.regisAccount endEditing:YES];
    [self.verificationField endEditing:YES];
    
}

@end
