//
//  MCFriendViewController.m
//  ADPower
//
//  Created by chengxc on 2016/10/29.
//  Copyright © 2016年 chengxue. All rights reserved.
//

#import "MCFriendViewController.h"
#import "MCChatViewController.h"
#import "MCContactViewController.h"
#import <EMSDK.h>

@interface MCFriendViewController ()<UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, weak) UISegmentedControl *segCtr;
@property (nonatomic, weak) UITableViewController *chatTable;
@property (nonatomic, weak) UITableViewController *contactTable;
@property (nonatomic, weak) UICollectionView *collectionView;

@end

@implementation MCFriendViewController



- (void)viewDidLoad {
    [self setNavigationItemTitleView];
    
    [self addcollectionView];
    
    MCChatViewController *chatTable = [[MCChatViewController alloc] init];
    MCContactViewController *contactTable = [[MCContactViewController alloc] init];
    self.chatTable = chatTable;
    self.contactTable = contactTable;
    [self addChildViewController:chatTable];
    [self addChildViewController:contactTable];
    self.automaticallyAdjustsScrollViewInsets = NO;
    
}

- (void)addcollectionView{
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.minimumLineSpacing = 0;
    flowLayout.minimumInteritemSpacing = 0;
    flowLayout.itemSize = self.view.frame.size;
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:flowLayout];
    self.collectionView = collectionView;
    collectionView.bounces = NO;
    collectionView.pagingEnabled = YES;
    collectionView.delegate = self;
    collectionView.dataSource = self;
    collectionView.showsHorizontalScrollIndicator = NO;
    [self.view addSubview:collectionView];
    
    [collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"collectionCell"];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.segCtr.numberOfSegments;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell *collectionCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"collectionCell" forIndexPath:indexPath];
    
    //移除之前子控制器的内容
    [collectionCell.contentView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    
    UITableViewController *tabvc = self.childViewControllers[indexPath.row];
    tabvc.view.frame = CGRectMake(0, 0, SCREENW, SCREENH);
    tabvc.tableView.contentInset = UIEdgeInsetsMake(0, 0, TabbarHeight, 0);
    
    [collectionCell.contentView addSubview:tabvc.view];
    return collectionCell;
}

//添加segmentControl到navbar的titleView中。
- (void)setNavigationItemTitleView{
    UISegmentedControl *segment = [[UISegmentedControl alloc] initWithItems:@[@"消息",@"通讯录"]];
    segment.tintColor = [UIColor whiteColor];
    segment.frame = CGRectMake(0, 0, 140, 24.5);
    self.segCtr = segment;
    segment.selectedSegmentIndex = 0;
    [segment addTarget:self action:@selector(segmentChangeValue:) forControlEvents:UIControlEventValueChanged];
    
    self.navigationItem.titleView = segment;
    
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    //获取页码
    NSInteger pageIndex = scrollView.contentOffset.x / SCREENW;
    self.segCtr.selectedSegmentIndex = pageIndex;
    
}

//segmentControl值改变时调用这里
- (void)segmentChangeValue:(UISegmentedControl *)segmentControl{
    
    self.collectionView.contentOffset = CGPointMake(SCREENW * segmentControl.selectedSegmentIndex, 0);
    
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewDidLoad];
    //create a serialQueue
    dispatch_queue_t serialQueue = dispatch_queue_create("aqueue", DISPATCH_QUEUE_SERIAL);
    
    dispatch_async(serialQueue, ^{
        EMOptions *options = [EMOptions optionsWithAppkey:kEaseAppkey];
        options.apnsCertName = kEaseApnsCertName;
        EMError *error = [[EMClient sharedClient] initializeSDKWithOptions:options];
        if (!error) {
            NSLog(@"初始化成功");
        }
        
        error = [[EMClient sharedClient] registerWithUsername:@"sx003" password:@"111111"];
        if (error==nil) {
            NSLog(@"注册成功");
        }else {
            
            NSString *errorDescrip = error.description;
            NSLog(@"%@",errorDescrip);
        }
        
        error = [[EMClient sharedClient] loginWithUsername:@"sx003" password:@"111111"];
        if (!error){
            NSLog(@"登录成功");
        }else{
            NSLog(@"登录失败");
        }
    });
    
    
}


@end
