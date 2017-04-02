//
//  ViewController.m
//  思考如何实现一个功能可删除
//
//  Created by chengxc on 2017/2/25.
//  Copyright © 2017年 chengxue. All rights reserved.
//

#import "BrandViewController.h"
#import "UIImage+aImage.h"
#import "MCCommendCell.h"

#define oriOffsetY -244

#define oriH 200
const int numberOfPage = 4;
@interface BrandViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *heightconst;
@property (weak, nonatomic) IBOutlet UIButton *followBtn;


@end

@implementation BrandViewController

- (instancetype)init{
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Brand" bundle:nil];
    self = [storyboard instantiateInitialViewController];
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setBackButton];
    
    //在导航控制器下的scollView,会默认有一个向下的滚动区域,64
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    self.followBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self.followBtn setTitle:@"已关注" forState:UIControlStateSelected];
    UIImage *grayImage = [UIImage imageWithColor:[UIColor grayColor]];
    [self.followBtn setBackgroundImage:grayImage forState:UIControlStateSelected];
    [self.followBtn addTarget:self action:@selector(followBtnPress:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.navigationController.navigationBar setShadowImage:[[UIImage alloc] init]];
    //设置tableView偏移量
    self.tableView.contentInset = UIEdgeInsetsMake(244, 0, 0, 0);
    //设置数据源,代理
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    UILabel *titleL = [[UILabel alloc] init];
    titleL.text = @"品牌馆";
    [titleL sizeToFit];
    titleL.alpha = 1;
    titleL.textColor = [UIColor colorWithWhite:1 alpha:1];
    
    self.navigationItem.titleView = titleL;
}

- (void)addTableViewToScrollView{
    CGRect screenRect = self.view.bounds;
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:screenRect];
    [self.view addSubview:scrollView];
    
    UIView *container = [[UIView alloc] init];
    [scrollView addSubview:container];
    __weak typeof(self) weakSelf = self;
    [container mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.right.left.equalTo(weakSelf.view);
        make.right.equalTo(weakSelf.view.width * numberOfPage);
        
    }];
    
    
    //UITableView *tableView
}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat offset = scrollView.contentOffset.y - oriOffsetY;
    CGFloat h = oriH - offset;
    self.heightconst.constant = h;

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    MCCommendCell *cell = [tableView dequeueReusableCellWithIdentifier:@"commendCell" forIndexPath:indexPath];
    
    
    
    //cell.textLabel.text = @"brandDetail";
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 200;
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

- (void)followBtnPress:(UIButton *)btn{
    btn.selected ? [btn setSelected:NO] : [btn setSelected:YES];
}
@end
