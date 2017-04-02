//
//  MCChatViewDetailVC.m
//  ADPowerpart2
//
//  Created by chengxc on 2017/1/5.
//  Copyright © 2017年 chengxc. All rights reserved.
//

#import "MCChatViewDetailVC.h"
#import "MCChatDetailCell.h"

@interface MCChatViewDetailVC () <UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *toolBarBottomCons;
@property (weak, nonatomic) IBOutlet UITableView *chatTable;
@property (weak, nonatomic) IBOutlet UITextView *textView;

@end

@implementation MCChatViewDetailVC


- (void)awakeFromNib{
    [super awakeFromNib];
    [self setBackButton];
        
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self taphiddenKeyboard];
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(newkeyboardWillAppear:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(newkeyboardWillHidden:) name:UIKeyboardWillHideNotification object:nil];
    
    self.chatTable.delegate = self;
    self.chatTable.dataSource = self;
    
    //[self.chatTable registerClass:[MCChatDetailCell class] forCellReuseIdentifier:@"receiveCell"];
    
}

- (void)viewWillAppear:(BOOL)animated{
    self.hidesBottomBarWhenPushed = YES;
}

- (void)newkeyboardWillAppear:(NSNotification *)notification{
   CGRect keyBoardFrame = [notification.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    CGFloat keyboardHeight = keyBoardFrame.size.height;
    
    
    self.toolBarBottomCons.constant = keyboardHeight;
    self.chatTable.contentInset = UIEdgeInsetsMake(0, 0, keyboardHeight, 0);
    [self.chatTable setContentOffset:CGPointMake(0,self.chatTable.contentSize.height - keyboardHeight - 49) animated:YES];
    [UIView animateWithDuration:0.25 animations:^{
        [self.view layoutIfNeeded];
    }];
    
}

- (void)taphiddenKeyboard{
    UITapGestureRecognizer *ges = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hiddenkeyboard)];
    [self.chatTable addGestureRecognizer:ges];
}

- (void)hiddenkeyboard{
    [self.textView resignFirstResponder];
}

- (void)newkeyboardWillHidden:(NSNotification *)notification{
    self.toolBarBottomCons.constant = 0;
    CGRect keyBoardFrame = [notification.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    CGFloat keyboardHeight = keyBoardFrame.size.height;
    
    
    //dispatch_queue_t queue = dispatch_queue_create("aqueue", DISPATCH_QUEUE_CONCURRENT);
    //dispatch_async(queue, ^{
       [self.chatTable setContentOffset:CGPointMake(0,self.chatTable.contentSize.height - keyboardHeight * 2 - 49) animated:YES];
    
    
    
    [UIView animateWithDuration:0.25 animations:^{
        [self.view layoutIfNeeded];
    }];
}

- (void)dealloc{
    [[NSNotificationCenter defaultCenter]removeObserver:self name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter]removeObserver:self name:UIKeyboardWillHideNotification object:nil];
}


//设置返回按钮样式
- (void)setBackButton{
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    NSMutableDictionary *attr = [NSMutableDictionary dictionary];
    attr[NSFontAttributeName] = [UIFont systemFontOfSize:14];
    attr[NSForegroundColorAttributeName] = [UIColor whiteColor];
    NSAttributedString *title = [[NSAttributedString alloc] initWithString:@"返回" attributes:attr];
    
    [backButton setAttributedTitle:title forState:UIControlStateNormal];
    [backButton setImage:[UIImage imageNamed:@"arrow_icon"] forState:UIControlStateNormal];
    [backButton setImage:[UIImage imageNamed:@"arrow_icon"] forState:UIControlStateHighlighted];
    [backButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [backButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateHighlighted];
    backButton.titleEdgeInsets = UIEdgeInsetsMake(0, 0, 0, -5);
    
    [backButton addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    
    UIView *btnContainer = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 38,17)];
    
    [btnContainer addSubview:backButton];
    [backButton sizeToFit];
    
    
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithCustomView:btnContainer];
    // 设置导航条返回按钮
    self.navigationItem.leftBarButtonItem = backItem;
}

- (void)back{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - UITableViewDelegate


#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 20;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MCChatDetailCell *cell = [[MCChatDetailCell alloc] init];
    
    if (indexPath.row % 2 == 0) {
        cell = [tableView dequeueReusableCellWithIdentifier:@"receiveCell"];
    } else{
        cell = [tableView dequeueReusableCellWithIdentifier:@"senderCell"];
    }
    
    cell.messageLabel.text = @"啊；接收方啦绝色赌妃；啊交电费";
    
    return cell;
}
@end
