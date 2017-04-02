//
//  MCBrandViewController.m
//  ADPowerpart2
//
//  Created by chengxc on 2017/1/13.
//  Copyright © 2017年 chengxc. All rights reserved.
//

#import "MCBrandViewController.h"

@interface MCBrandViewController ()<UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, weak) UISegmentedControl *segCtr;
@property (nonatomic, weak) UITableViewController *allItem;
@property (nonatomic, weak) UITableViewController *activity;
@property (nonatomic, weak) UITableViewController *holded;
@property (nonatomic, weak) UITableViewController *trend;
@property (nonatomic, weak) UICollectionView *collectionView;

@end

@implementation MCBrandViewController



- (void)viewDidLoad {
    [self setCustomNaviTitieView];
    
    [self addcollectionView];
    
    UITableViewController *allItem = [[UITableViewController alloc] init];
    UITableViewController *activity = [[UITableViewController alloc] init];
    UITableViewController *holded = [[UITableViewController alloc] init];
    UITableViewController *trend = [[UITableViewController alloc] init];
    
    self.allItem = allItem;
    self.activity = activity;
    self.holded = holded;
    self.trend = trend;
    
    [self addChildViewController:allItem];
    [self addChildViewController:activity];
    [self addChildViewController:holded];
    [self addChildViewController:trend];
    
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
    
    [collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"AcollectionCell"];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.segCtr.numberOfSegments;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell *collectionCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"AcollectionCell" forIndexPath:indexPath];
    
    //移除之前子控制器的内容
    [collectionCell.contentView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    
    UITableViewController *tabvc = self.childViewControllers[indexPath.row];
    tabvc.view.frame = CGRectMake(0, 0, SCREENW, SCREENH);
    tabvc.tableView.contentInset = UIEdgeInsetsMake(0, 0, TabbarHeight, 0);
    
    [collectionCell.contentView addSubview:tabvc.view];
    return collectionCell;
}

//添加segmentControl到navbar的titleView中。
- (void)setCustomNaviTitieView{
    UISegmentedControl *segment = [[UISegmentedControl alloc] initWithItems:@[@"消息",@"通讯录"]];
    UIView *titleView = [[UIView alloc] init];
    //self.
    
    
    segment.tintColor = [UIColor whiteColor];
    segment.frame = CGRectMake(0, 0, 140, 24.5);
    self.segCtr = segment;
    segment.selectedSegmentIndex = 0;
    [segment addTarget:self action:@selector(segmentChangeValue:) forControlEvents:UIControlEventValueChanged];
    
    self.navigationItem.titleView = segment;
    
    //self.navigationItem.prompt = @"这是测试";
    
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
    // Do any additional setup after loading the view.
}


@end
