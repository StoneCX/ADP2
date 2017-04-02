//
//  MCRecommendVC.m
//  ADPower
//
//  Created by chengxc on 2016/10/31.
//  Copyright © 2016年 chengxue. All rights reserved.
//

#import "MCRecommendVC.h"
#import "MCRecommendCell.h"
#import <AFNetworking.h>
#import <MJExtension/MJExtension.h>
#import "MCCommentItem.h"
#import "AFHTTPSessionManager+Manager.h"
#import "VideoViewController.h"
#import <MJRefresh.h>
#import <SVProgressHUD.h>
#import "MCCommendCell.h"
#import "MCReviewDetailVC.h"
#import "BrandViewController.h"

@interface MCRecommendVC ()<MCCommendCellDelegate>

@property (nonatomic, strong) NSMutableArray *items;
@property (nonatomic, strong) AFHTTPSessionManager *manager;
@property (nonatomic, weak) UIView *header;
@property (nonatomic, weak) UILabel *headerLabel;
@property (nonatomic, assign, getter=isHeaderRefreshing) BOOL headerRefreshing;

@property (nonatomic, weak) UIView *footer;
@property (nonatomic, weak) UILabel *footerLabel;
@property (nonatomic, assign, getter=isFooterRefreshing) BOOL footerRefreshing;

@end

static NSString *cellID = @"cellid";
#define netWorkUrl @"http://wvideo.spriteapp.cn/video/2016/1221/585a5624068fa_wpd.mp4"
#define REQ @"/get_ads"
@implementation MCRecommendVC

- (AFHTTPSessionManager *)manager{
    if (!_manager) {
        _manager = [AFHTTPSessionManager mc_manager];
    }
    return _manager;
}

- (instancetype)init {
    UIStoryboard *storyb = [UIStoryboard storyboardWithName:NSStringFromClass(self.class) bundle:nil];
    self = [storyb instantiateInitialViewController];
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.tableView.contentInset = UIEdgeInsetsMake(50, 0, -49, 0);
    self.tableView.separatorInset = UIEdgeInsetsMake(0, -2.5, 0, 0);
    //暂时使用的数据.
    self.tableView.rowHeight = 200;
    [self setupRefresh];
    [self loadNewTopics];
    [self loadNewData];
    
}


- (void)loadNewData{
    
    
    if (self.isHeaderRefreshing) return;
    // 1.创建请求会话管理者
    AFHTTPSessionManager *manager = [AFHTTPSessionManager mc_manager];
    
    // 2.拼接请求参数
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    parameters[@"page"] = @1;
    //parameters[@"sort"] = @"s";

    

    
    
    NSString *requestPath = [NSString stringWithFormat:@"%@%@",MCbaseURL,REQ];
        // 3.发送请求
    [manager GET:requestPath parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary * _Nullable responseObject) {
        // 请求数据成功
        
        NSString *tmpString = responseObject[@"data"];
        NSLog(@"%@",tmpString);
        // 字典数组转模型数组
        NSArray *loadData = [MCCommentItem mj_objectArrayWithKeyValuesArray:responseObject[@"data"]];
        NSLog(@"%@",loadData);
//        NSMutableArray *mArray = [NSMutableArray array];
//        for (NSArray *data in loadData) {
//            MCCommentItem *item = [[MCCommentItem mj_objectWithKeyValues:data];
//            [mArray addObject:item];
//        }
//        self.items = mArray;
        [self.tableView.mj_header endRefreshing];
        // 刷新表格
        [self.tableView reloadData];
        
        //        // 解析数据
        [responseObject writeToFile:@"/Users/chengxc/Desktop/cheng123.plist" atomically:YES];
        //NSLog(@"%@",responseObject);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        [self.tableView.mj_header endRefreshing];
    }];

}

//MARK: UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 50;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MCCommendCell *cell = [tableView dequeueReusableCellWithIdentifier:@"commendCell" forIndexPath:indexPath];
    cell.previewImage.image = [UIImage imageNamed:@"enterprise_img2"];
    cell.delegate = self;
    return cell;
    
}

//selected row --> download data and show
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    VideoViewController *videoController = [[VideoViewController alloc] init];
    //NSURL *url = [NSURL URLWithString:@"http://baobab.wdjcdn.com/1442142801331138639111.mp4"];
    
    
    NSString *urlStr = @"http://115.28.77.169/videos/bdc7b94e9cc38477fe5eed54bdcc7d17";
    
    [self.manager GET:urlStr parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        NSLog(@"downloadProgress= %.2f",downloadProgress.fractionCompleted);
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"responseObject==%@",responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"error= = %@",error);
    }];
    
    
    //videoController.videoUrl = url;
    
    [self presentViewController:videoController animated:YES completion:nil];
}


- (void)loadNewTopics{
    
    
    [self.manager.tasks makeObjectsPerformSelector:@selector(cancel)];
    
    
    NSMutableDictionary *paremeters = [[NSMutableDictionary alloc] init];
    
    
    [self.manager GET:MCbaseURL parameters:paremeters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
    
}

- (void)setupRefresh{
    
    MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];
    header.automaticallyChangeAlpha = YES;
    self.tableView.mj_header = header;
    
}

#pragma mark: - MCCommendCellDelegate
- (void)playCountClick:(UIButton *)button{
    UIViewController *viewController = [[UIViewController alloc] init];
    viewController.view.backgroundColor = [UIColor greenColor];
    viewController.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:viewController animated:YES];
    
}

- (void)commentClick:(UIButton *)button{
    MCReviewDetailVC *aController = [[MCReviewDetailVC alloc] init];
    //aController.view.backgroundColor = [UIColor orangeColor];
    aController.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:aController animated:YES];
}

- (void)moreClick:(UIButton *)button{
    UIViewController *aController = [[UIViewController alloc] init];
    aController.view.backgroundColor = [UIColor orangeColor];
    aController.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:aController animated:YES];
}

- (void)brandButtonClick:(UIButton *)button {
    BrandViewController *aController = [[BrandViewController alloc] init];
    //aController.view.backgroundColor = [UIColor orangeColor];
    aController.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:aController animated:YES];
}

@end















