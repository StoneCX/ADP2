 //
//  XCTitleViewController.m
//  neteasecheng1
//
//  Created by chengxc on 16/9/1.
//  Copyright © 2016年 chengxc. All rights reserved.
//

#import "XCTitleViewController.h"
#import "UIView+XCFrame.h"
#import "UIColor+MCColor.h"

static NSString * const cellID = @"cellid";

#define TITLEH 30
#define NAVIH 64
#define TabbarHeight 49
@interface XCTitleViewController () <UICollectionViewDelegate, UICollectionViewDataSource>
@property (nonatomic, weak) UIScrollView *topTitleView;
@property (nonatomic, weak) UICollectionView *collectionView;
@property (nonatomic, weak) UIButton *selectedButton;
//@property (nonatomic, weak) UIView *underLineView;
@property (nonatomic, strong) NSMutableArray *buttons;
@property (nonatomic, assign) BOOL isInitial;
@end


@implementation XCTitleViewController




- (NSMutableArray *)buttons
{
    if (!_buttons) {
        _buttons = [NSMutableArray array];
    }
    return _buttons;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self setCollectionViews];
    [self setupTitleView];
    // [self seletedBtn:self.buttons.firstObject];
    

    //ios7之后UISCrollView会自动添加额外的滚动区域，设置取消
    self.automaticallyAdjustsScrollViewInsets = NO;
    

    
}

- (void)viewWillAppear:(BOOL)animated{
    if(!self.isInitial){
        [self setupAllTitleButton];
        self.isInitial = YES;
    }
   
}

#pragma mark- 添加所有的标题按钮
//- (void)setTitleWithButton:(UIButton *)button
- (void)setupAllTitleButton
{
    NSInteger count = self.childViewControllers.count;
    CGFloat margin = (SCREENW - count*60)/count;
    CGFloat btnX = 0;

    CGFloat btnY = 2.5;
    CGFloat btnW = 60;
    CGFloat btnH = TITLEH - 5;
    
    
    
    for (int i = 0; i < count; i++) {
        btnX = margin * 0.5 + (btnW + margin)* i;
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.tag = i;
        btn.frame = CGRectMake(btnX, btnY, btnW, btnH);
        UIViewController *vc = self.childViewControllers[i];
        btn.titleLabel.font = [UIFont systemFontOfSize:14];
        
        [btn setTitle:vc.title forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
        //
        [btn.layer setCornerRadius:5.0];
        [btn.layer setMasksToBounds:YES];
        
        //从Layer层上获取一个蓝色图片，设置为按钮选中背景。
        CALayer *layer = [CALayer layer];
        layer.backgroundColor = [[UIColor colorWithHexadecimal:@"#006FDA"] CGColor];
        layer.frame = btn.frame;
        [btn setBackgroundImage:[UIImage imageFromLayer:layer] forState:UIControlStateSelected];
        //将按钮添加到titleView中
        [self.topTitleView addSubview:btn];
        [btn addTarget:self action:@selector(titleClick:) forControlEvents:UIControlEventTouchUpInside];
        
        //将新建的button添加到buttons数组内用作滑动collectionView 时选中button
        [self.buttons addObject:btn];
        

        
        
        if (i == 0) {
            //NSLog(@"there -setupalltitleButton");
           [self seletedBtn:btn];
        }
        
        
    }
    //[self.navigationController popToRootViewControllerAnimated:NO];
}




#pragma mark- 添加collectionView
- (void)setCollectionViews{
    //collection的flowlayout
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
    
    [collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:cellID];
    
}
//添加titleView
- (void)setupTitleView{
    UIScrollView *titleV = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, SCREENH, TITLEH)];
    titleV.backgroundColor = [UIColor colorWithWhite:1 alpha:0.6];
    [self.view addSubview:titleV];
    _topTitleView = titleV;
    UIView *line = [[UIView alloc] initWithFrame:CGRectMake(0, TITLEH, SCREENW, 1)];
    line.backgroundColor = [UIColor colorWithHexadecimal:@"#e5e5e5"];
    [self.view addSubview:line];
}




#pragma mark- UICollectionViewDatasource method
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.childViewControllers.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellID forIndexPath:indexPath];
    
    //移除之前子控制器的内容
    [cell.contentView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    
    //获取对应的子控制器
    UITableViewController *vc = self.childViewControllers[indexPath.row];
    
    //设置控制器的frame
    vc.view.frame = CGRectMake(0, 0, SCREENW, SCREENH);
    vc.tableView.contentInset = UIEdgeInsetsMake(0, 0, TabbarHeight, 0);
    [cell.contentView addSubview:vc.view];
    return cell;
    
    
}

#pragma mark- UIScrollView 减速完成时调用
//拖动tabbleView 时标题跟着变位置
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    //获取页码
    NSInteger pageIndex = scrollView.contentOffset.x / SCREENW;
    [self seletedBtn:self.buttons[pageIndex]];
    
}

- (void)titleClick:(UIButton *)btn{
    [self seletedBtn:btn];
    self.collectionView.contentOffset = CGPointMake(SCREENW * btn.tag, 0);
}


- (void)seletedBtn:(UIButton *)btn{
    self.selectedButton.selected = NO;
    
    btn.selected = YES;
    self.selectedButton = btn;
    
    //修改下划线位置
//    [UIView animateWithDuration:0.25 animations:^{
//        [_underLineView setXC_centerX:btn.center.x];
//    }];
}




@end
