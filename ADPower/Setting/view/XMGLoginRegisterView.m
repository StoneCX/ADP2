//
//  XMGLoginRegisterView.m
//  BuDeJie17
//
//  Created by xiaomage on 16/7/28.
//  Copyright © 2016年 XiaoMaG. All rights reserved.
//

#import "XMGLoginRegisterView.h"
#import "XMGLoginRegisterField.h"
#import "AFHTTPSessionManager+Manager.h"

@interface XMGLoginRegisterView ()<UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UIButton *registerButton;
@property (weak, nonatomic) IBOutlet UIButton *loginButton;
@property (weak, nonatomic) IBOutlet XMGLoginRegisterField *userName;
@property (weak, nonatomic) IBOutlet XMGLoginRegisterField *password;
@property (weak, nonatomic) IBOutlet UIButton *isSecurePasswd;

@end

#define REGISTER @"/api/register"
#define LOGIN @"/api/login"
@implementation XMGLoginRegisterView



// 如果执行了awakeFromNib,说明当前控件在xib中所有属性全部设置好
// 只要在awakeFromNib里面,就能获取到xib中所有属性
- (void)awakeFromNib
{
  
    [super awakeFromNib];
    
    UIImage *bgImage = [self.loginButton backgroundImageForState:UIControlStateNormal];
    bgImage = [bgImage stretchableImageWithLeftCapWidth:bgImage.size.width * 0.5 topCapHeight:bgImage.size.height * 0.5];
    [self.loginButton setBackgroundImage:bgImage forState:UIControlStateNormal];
    
    
    self.userName.delegate = self;
    
//    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
//    center noti
}

+ (instancetype)loginView
{
    id instanceTmp = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil] lastObject];
    //NSLog(@"instancetmp====%@",instanceTmp);
    return instanceTmp;
}




+ (instancetype)registerView
{
     return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil] firstObject];
}
//让用户点击空白区域收回键盘
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self endEditing:YES];
}
- (IBAction)signUpButtonClick:(UIButton *)sender {

    AFHTTPSessionManager *manager = [AFHTTPSessionManager mc_manager];
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    parameters[@"name"] = self.userName.text;
    parameters[@"pass"] = self.password.text;
    //NSLog(@"%@%@",self.userName.text,self.password.text);
    
    NSString *requestPath = [NSString stringWithFormat:@"%@%@",MCbaseURL,REGISTER];
    
    
    [manager GET:requestPath parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        MCLog(@"register success");
        [responseObject writeToFile:@"/Users/chengxc/Desktop/regisuc.plist" atomically:YES];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        MCLog(@"register fail");
    }];
}
- (IBAction)loginButtonClick:(UIButton *)sender {
    [self.userName endEditing:YES];
    [self.password endEditing:YES];
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager mc_manager];
    
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    parameters[@"name"] = self.userName.text;
    parameters[@"pass"] = self.password.text;
    NSLog(@"--------------------%@%@",self.userName.text, self.password.text);
    
    NSString *requestPath = [NSString stringWithFormat:@"%@%@",MCbaseURL,LOGIN];
    
    
    [manager GET:requestPath parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSKeyedArchiver *arch = [[NSKeyedArchiver alloc] init];
        BOOL isSuccess = [responseObject writeToFile:@"/Users/chengxc/Documents/login.plist" atomically:NO];
        MCLog(@"write success?-->%@",isSuccess ? @"success" : @"failure");
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        //MCLog(@"login fail");
    }];
    
}

- (IBAction)forgetPasswdButtonClick:(id)sender {
    
}

- (IBAction)isShowPasswdClick:(id)sender {
    self.password.secureTextEntry = !self.password.secureTextEntry;
}

// MARK:XMGLoginRegisterField(inherit UITextField)`s delegate
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    NSLog(@"%s,%s",__TIME__,__func__);
    return NO;
}

- (BOOL)textFieldShouldClear:(UITextField *)textField {
    NSLog(@"%s,%s",__TIME__,__func__);
    return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    NSLog(@"%s,%s",__TIME__,__func__);
    return YES;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    NSLog(@"%s,%s",__TIME__,__func__);
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    NSLog(@"%s,%s",__TIME__,__func__);
    //self.userInputName = textField.text;
    NSLog(@"%@",textField.text);
    if ([textField isEqual:_userName]){
        NSLog(@"equal");
        [self.delegate getUserName:textField.text];
    }
}



@end
