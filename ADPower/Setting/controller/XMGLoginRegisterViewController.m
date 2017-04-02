//
//  XMGLoginRegisterViewController.m
//  BuDeJie17
//
//  Created by xiaomage on 16/7/28.
//  Copyright © 2016年 XiaoMaG. All rights reserved.
//

#import "XMGLoginRegisterViewController.h"
#import "XMGLoginRegisterView.h"
#import "XMGFastLoginView.h"
/*
    1.搭建登录注册界面
 
    复杂界面(子控件非常多)
    1.划分结构(顶部,中间,底部)
    2.创建占位视图,占据结构位置
    2.一个结构一个结构做
 */

@interface XMGLoginRegisterViewController ()<XMGLoginRegisterViewDelegate>
@property (weak, nonatomic) IBOutlet UIView *bottomView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *leadCons;
@property (weak, nonatomic) IBOutlet UIView *middleView;
@end

@implementation XMGLoginRegisterViewController

- (IBAction)close:(id)sender {
    [self.view endEditing:YES];
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)clickRegister:(UIButton *)sender {
    sender.selected = !sender.selected;
    
    _leadCons.constant = (_leadCons.constant == 0?-SCREENW:0);
    
    [UIView animateWithDuration:0.25 animations:^{
        // 做约束动画
        [self.view layoutIfNeeded];
    }];
}

// viewDidLayoutSubviews:控制器的view的布局结束调用这个方法
// LayoutSubview:控件布局结束调用的方法
- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    
    // 登录View
    XMGLoginRegisterView *loginView = _middleView.subviews.firstObject;
    loginView.frame = CGRectMake(0, 0, _middleView.mc_width * 0.5, _middleView.mc_height);
    // 注册view
    XMGLoginRegisterView *registerView = _middleView.subviews.lastObject;
    registerView.frame = CGRectMake(_middleView.mc_width * 0.5, 0,_middleView.mc_width * 0.5 , _middleView.mc_height );
    // 快速登录View
    XMGFastLoginView *fastLoginView = _bottomView.subviews.firstObject;
    fastLoginView.frame = _bottomView.bounds;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.userInteractionEnabled = YES;

    // 添加登录view
    XMGLoginRegisterView *loginView = [XMGLoginRegisterView loginView];
    loginView.delegate = self;
    
    [_middleView addSubview:loginView];
    
    // 添加注册view
    XMGLoginRegisterView *registerView = [XMGLoginRegisterView registerView];
    [_middleView addSubview:registerView];
    
    // 添加快速登录View
    XMGFastLoginView *fastLoginView = [XMGFastLoginView fastLoginView];
    [_bottomView addSubview:fastLoginView];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}


// MARK: XMGLoginRegisterViewDelegate

- (void)getPassword:(NSString *)password {
    NSLog(@"%@",password);
}

- (void)getUserName:(NSString *)username {
    NSLog(@"%@",username);
}






@end
