//
//  XMGLoginRegisterView.h
//  BuDeJie17
//
//  Created by xiaomage on 16/7/28.
//  Copyright © 2016年 XiaoMaG. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol XMGLoginRegisterViewDelegate <NSObject>
@required
- (void)getUserName:(NSString *)username;
- (void)getPassword:(NSString *)password;

@end
@interface XMGLoginRegisterView : UIView

@property (nonatomic, weak) id<XMGLoginRegisterViewDelegate> delegate;

+ (instancetype)loginView;
+ (instancetype)registerView;
@end
