//
//  XMGLoginRegisterField.m
//  BuDeJie17
//
//  Created by xiaomage on 16/7/28.
//  Copyright © 2016年 XiaoMaG. All rights reserved.
//

#import "XMGLoginRegisterField.h"

@implementation XMGLoginRegisterField

- (void)awakeFromNib
{
    [super awakeFromNib];
    // 修改光标颜色
    self.tintColor = [UIColor lightGrayColor];
    
    // 监听文本框什么时候开始编辑 1.代理 2.通知 3.target
    // 最好不要自己成为自己代理
    // 监听文本框开始编辑
    [self addTarget:self action:@selector(textBegin) forControlEvents:UIControlEventEditingDidBegin];
    // 监听文本框开始编辑
    [self addTarget:self action:@selector(textEnd:) forControlEvents:UIControlEventEditingDidEnd];
    
    // 获取占位文字label
    UILabel *placeholderLabel = [self valueForKey:@"placeholderLabel"];
    placeholderLabel.textColor = [UIColor lightGrayColor];

}

// 文本框开始编辑的时候调用
- (void)textBegin
{
    UILabel *placeholderLabel = [self valueForKey:@"placeholderLabel"];
    placeholderLabel.textColor = [UIColor lightGrayColor];

}

// 文本框结束编辑就会调用
- (void)textEnd:(UITextField *)textField
{
    UILabel *placeholderLabel = [self valueForKey:@"placeholderLabel"];
    placeholderLabel.textColor = [UIColor lightGrayColor];
    
    //NSLog(@"%@",textField.text);
}


@end
