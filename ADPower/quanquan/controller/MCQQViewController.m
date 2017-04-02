//
//  MCQQViewController.m
//  ADPower
//
//  Created by chengxc on 2016/10/29.
//  Copyright © 2016年 chengxue. All rights reserved.
//

#import "MCQQViewController.h"
#import "MCCollectionViewCell.h"
#import "MCBrandShowController.h"

#define kNumberOfItems 6
@interface MCQQViewController ()<UICollectionViewDataSource>
@property (weak, nonatomic) IBOutlet UIView *containerViwe;
@property (weak, nonatomic) IBOutlet UICollectionView *collection;
@property (weak, nonatomic) IBOutlet UIView *bsContainerView;

@end

@implementation MCQQViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self configCollectionView];
    self.collection.dataSource = self;
    [self.collection registerNib:[UINib nibWithNibName:NSStringFromClass([MCCollectionViewCell class]) bundle:nil] forCellWithReuseIdentifier:@"collectionCell"];
    [self configBrandShowContainer];
}

- (void)configCollectionView {
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.minimumInteritemSpacing = 0;
    flowLayout.minimumLineSpacing = 0;
    flowLayout.itemSize = CGSizeMake(_containerViwe.width * 1 / kNumberOfItems , _containerViwe.height);
    self.collection.collectionViewLayout = flowLayout;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return kNumberOfItems;
}

- (void)configBrandShowContainer {
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.minimumInteritemSpacing = 0;
    flowLayout.minimumLineSpacing = 0;
    flowLayout.itemSize = CGSizeMake(_bsContainerView.width * 1 / 4 , _containerViwe.height);
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    MCBrandShowController *bsController = [[MCBrandShowController alloc] initWithCollectionViewLayout:flowLayout];
    [self.bsContainerView addSubview:bsController.collectionView];
    __weak typeof(self) weakSelf = self;
    [bsController.collectionView makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.bottom.right.equalTo(weakSelf.bsContainerView);
    }];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    MCCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"collectionCell" forIndexPath:indexPath];
    cell.imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"loop_a1"]];
    cell.label.text = @"A1";
    
    return cell;
}


@end
