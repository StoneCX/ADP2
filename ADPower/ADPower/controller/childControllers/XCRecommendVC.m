//
//  XCRecommendVC.m
//  neteasecheng1
//
//  Created by chengxc on 16/9/1.
//  Copyright © 2016年 chengxc. All rights reserved.
//

#import "XCRecommendVC.h"

static NSString * const cellID = @"cellID";
@interface XCRecommendVC () <UICollectionViewDataSource>

@end

@implementation XCRecommendVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //[self.tableView removeFromSuperview];
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.minimumInteritemSpacing = 10;
    layout.minimumLineSpacing = 5;
    layout.itemSize = CGSizeMake(50, 50);
    
    UICollectionView *colV = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
    //colV.backgroundColor = [UIColor ];
    [self.view addSubview:colV];
    colV.dataSource = self;
    
    [colV registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:cellID];
    
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    //[self.tableView removeFromSuperview];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark:- uicollectionviewDataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 2;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 6;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
   UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellID forIndexPath:indexPath];
    cell.backgroundColor = [UIColor redColor];
    
    return cell;
}


@end
