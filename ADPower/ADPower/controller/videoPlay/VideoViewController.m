//
//  VideoViewController.m
//  ADPowerpart2
//
//  Created by chengxc on 2017/3/4.
//  Copyright © 2017年 chengxc. All rights reserved.
//

#import "VideoViewController.h"
#import "SRVideoPlayer.h"
#import "DetailTableViewController.h"
#import "ReviewTableViewController.h"


@interface VideoViewController ()<SRvideoPlayerDelegate,UICollectionViewDelegate, UICollectionViewDataSource>
@property (weak, nonatomic) IBOutlet UIView *videoView;
@property (weak, nonatomic) IBOutlet UIView *containerHeader;
@property (weak, nonatomic) IBOutlet UIView *reviewDetail;
@property (weak, nonatomic) UICollectionView *collectionView;

@property (nonatomic, strong) SRVideoPlayer *player;
@property (weak, nonatomic) IBOutlet UIButton *detailButton;
@property (weak, nonatomic) IBOutlet UIButton *reviewButton;

@end

@implementation VideoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addSomeChildViewController];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self showVideo];
    
    self.player.delegate = self;
    
    
    [self addcollectionView];
    
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"reuseCell"];
    self.automaticallyAdjustsScrollViewInsets = NO;
}

- (void)addSomeChildViewController {
    DetailTableViewController *detailVC = [[DetailTableViewController alloc] init];
    
    
    ReviewTableViewController *reviewVC = [[ReviewTableViewController alloc] init];
    
    [self addChildViewController:detailVC];
    [self addChildViewController:reviewVC];
}

//add collectionView to reviewView for contain review&detail
- (void)addcollectionView{
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.minimumLineSpacing = 0;
    flowLayout.minimumInteritemSpacing = 0;
    flowLayout.itemSize = self.reviewDetail.frame.size;
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    
    //CGPoint center = [self.reviewDetail convertPoint:self.reviewDetail.center fromView:self.reviewDetail.superview];
    CGRect rect = [self.reviewDetail convertRect:self.reviewDetail.frame fromView:self.reviewDetail.superview];
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:rect collectionViewLayout:flowLayout];
    self.collectionView = collectionView;
    collectionView.bounces = NO;
    collectionView.pagingEnabled = YES;
    collectionView.delegate = self;
    collectionView.dataSource = self;
    collectionView.showsHorizontalScrollIndicator = NO;
    [self.reviewDetail addSubview:collectionView];
    
    //[collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"collectionCell"];
}

#pragma UICollectionViewDataSource method
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    return 2;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"reuseCell" forIndexPath:indexPath];
    
    [cell.contentView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];

    UITableViewController *tablevc = self.childViewControllers[indexPath.row];
    
    [cell addSubview:tablevc.view];
    
    
    return cell;
}

- (IBAction)detaiButtonClick:(id)sender {
    self.collectionView.contentOffset = CGPointMake(0, 0);
}

- (IBAction)reviewButtonClick:(id)sender {
    self.collectionView.contentOffset = CGPointMake(SCREENW, 0);
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    if (scrollView.contentOffset.x == SCREENW) {
        self.detailButton.selected = YES;
    }else {
        self.reviewButton.selected = YES;
    }
}


// add vido player to videoView
- (void)showVideo {
    
    UIView *playerView = [[UIView alloc] init];
    [self.videoView addSubview:playerView];
    __weak typeof(self) weakSelf = self;
    [playerView makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.bottom.right.equalTo(weakSelf.videoView);
    }];
    
    _player = [SRVideoPlayer playerWithVideoURL:self.videoUrl playerView:playerView playerSuperView:playerView.superview];
    _player.videoName = @"videoName";
    _player.playerEndAction = SRVideoPlayerEndActionStop;
    [_player play];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [_player destroyPlayer];
}

- (BOOL)prefersStatusBarHidden {
    return YES;
}

//SRVideoPlayerDelegate
- (void)closeBtnPress {
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end
