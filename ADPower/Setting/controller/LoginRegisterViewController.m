//
//  LoginRegisterViewController.m
//  ADPowerpart2
//
//  Created by chengxc on 2017/3/7.
//  Copyright © 2017年 chengxc. All rights reserved.
//

#import "LoginRegisterViewController.h"
#import "RegisterViewController.h"
#import <SVProgressHUD.h>



@interface LoginRegisterViewController () <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UIView *accoutbg;
@property (weak, nonatomic) IBOutlet UIView *passwdbg;
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;
@property (weak, nonatomic) IBOutlet UITextField *accountField;
@property (weak, nonatomic) IBOutlet UITextField *passwdField;

@end

@implementation LoginRegisterViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    [self setCornerRadius];
    self.passwdField.secureTextEntry = YES;
    self.passwdField.delegate = self;
    self.accountField.delegate = self;
    [self getInput];
}

- (void)setCornerRadius {
    self.accoutbg.layer.cornerRadius = 5;
    self.accoutbg.clipsToBounds = YES;
    self.passwdbg.layer.cornerRadius = 5;
    self.passwdbg.clipsToBounds = YES;
    self.accountField.layer.cornerRadius = 5;
    self.accountField.clipsToBounds = YES;
    self.passwdField.layer.cornerRadius = 5;
    self.passwdField.clipsToBounds = YES;
    self.loginBtn.layer.cornerRadius = 5;
    self.loginBtn.clipsToBounds = YES;
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self dismissKeypad];
}

- (void)getInput {
    [self.accountField addTarget:self action:@selector(textFieldChange:) forControlEvents:UIControlEventEditingChanged];
}
//dynamical get input
- (void)textFieldChange:(UITextField *)field {
    NSString *info = field.text;
    NSLog(@"%s,info= %@",__func__,info);
    
    
}

//1.dismiss keypad  2.send data to server 3.present HUD 4.get respose
//5.pass value to AssetViewController
- (IBAction)loginBtnPress:(UIButton *)sender {
    [self dismissKeypad];
    /*
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [SVProgressHUD showWithStatus:@"正在登录..."];
        [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeBlack];
        [SVProgressHUD dismissWithDelay:1 completion:^{
            NSLog(@"SVProgressHUD complete");
        }];
    });
     */
    
    
    NSString *tel = self.accountField.text;
    NSString *passwd = [self.passwdField.text md5String];
    NSDictionary *dict = @{@"tel":tel,
                           @"pass":passwd};
    
    AFHTTPSessionManager *sessionManager = [AFHTTPSessionManager manager];
    AFJSONResponseSerializer *responseSerial = [AFJSONResponseSerializer serializer];
    responseSerial.acceptableContentTypes = nil;
    sessionManager.responseSerializer = responseSerial;
    
    NSString *requestStr = [MCbaseURL stringByAppendingString:@"login"];
    //[sessionManager.requestSerializer setValue:@"2" forHTTPHeaderField:@"client"];
    //[sessionManager.requestSerializer setValue:time forHTTPHeaderField:@"timeToken"];
    
    NSLog(@"%@",requestStr);
    
    __weak typeof(self) weakSelf = self;
    [sessionManager GET:requestStr parameters:dict progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        //NSLog(@"responseObject = %@",responseObject);
        if ([responseObject[@"errorCode"] isEqual:@0]) {
            [SVProgressHUD showWithStatus:@"登录成功"];
            [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeBlack];
            [SVProgressHUD dismissWithDelay:1.0 completion:nil];
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                self.loginStatue(responseObject[@"data"]);
                [weakSelf dismissViewControllerAnimated:YES completion:nil];
            });
        }
        NSDictionary *data = responseObject[@"data"];
        NSLog(@"data = %@",data);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (error) {
            NSLog(@"error = %@",error);
        }
    }];
}

- (IBAction)QQLogin:(id)sender {
}

- (IBAction)weiboLogin:(UIButton *)sender {
}

- (IBAction)weixinLogin:(id)sender {
}

- (IBAction)dismissBtnPress:(id)sender {
    [self dismissKeypad];
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)glancePasswd:(id)sender {
    self.passwdField.secureTextEntry = !self.passwdField.secureTextEntry;
}

- (IBAction)registerBtnPress:(UIButton *)sender {
    RegisterViewController *registerVC = [[RegisterViewController alloc] init];
    [self presentViewController:registerVC animated:YES completion:nil];
}

- (IBAction)forgotpwdBtnPress:(UIButton *)sender {
}

#pragma mark - assist method
- (void)dismissKeypad {
    [self.accountField endEditing:YES];
    [self.passwdField endEditing:YES];
}

/*
 Below are a few examples of how `baseURL` and relative paths interact:
 
 NSURL *baseURL = [NSURL URLWithString:@"http://example.com/v1/"];
 [NSURL URLWithString:@"foo" relativeToURL:baseURL];                  // http://example.com/v1/foo
 [NSURL URLWithString:@"foo?bar=baz" relativeToURL:baseURL];          // http://example.com/v1/foo?bar=baz
 [NSURL URLWithString:@"/foo" relativeToURL:baseURL];                 // http://example.com/foo
 [NSURL URLWithString:@"foo/" relativeToURL:baseURL];                 // http://example.com/v1/foo
 [NSURL URLWithString:@"/foo/" relativeToURL:baseURL];                // http://example.com/foo/
 [NSURL URLWithString:@"http://example2.com/" relativeToURL:baseURL]; // http://example2.com/
 */
- (NSURL *)getFullURLWithString:(NSString *)partString {
    NSURL *baseURL = [NSURL URLWithString:@"http://115.28.77.169/api/"];
    NSURL *returnURL = [NSURL URLWithString:partString relativeToURL:baseURL];
    
    return returnURL;
}


//获取并返回当前时间
- (NSString *)getCurrentTime {
    NSDate *date = [NSDate date];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"HH:mm"];
    NSString *timeStr = [dateFormatter stringFromDate:date];
    
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSUInteger unitFlags = NSCalendarUnitDay|NSCalendarUnitMonth|NSCalendarUnitYear;
    NSDateComponents *components = [calendar components:unitFlags fromDate:date];
    NSInteger year = [components year];
    NSInteger month = [components month];
    NSInteger day = [components day];
    NSString *calString = [NSString stringWithFormat:@"%4ld%2ld%2ld",year,month,day];
    
    NSString *dateString = [calString stringByAppendingString:timeStr];
    
    return dateString;
}

@end
