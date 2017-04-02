//
//  DetailTableViewController.m
//  ADPowerpart2
//
//  Created by chengxc on 2017/3/12.
//  Copyright © 2017年 chengxc. All rights reserved.
//

#import "DetailTableViewController.h"
//#import "MCReviewTableViewCell.h"

@interface DetailTableViewController ()

@end

@implementation DetailTableViewController

- (instancetype)init{
    self.automaticallyAdjustsScrollViewInsets = NO;
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"detailCell"];
    //self.automaticallyAdjustsScrollViewInsets = NO;
}

//- (void)addBottomToolbar {
//    UIView *toolbar = [[UIView alloc] init];
//    [self.view addSubview:toolbar];
//    __weak typeof(self) weakSelf = self;
//    [toolbar makeConstraints:^(MASConstraintMaker *make) {
//        make.height.equalTo(@44);
//        make.left.bottom.right.equalTo(weakSelf);
//    }];
//    
//}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"detailCell" forIndexPath:indexPath];
    
    // Configure the cell...
    cell.textLabel.text = @"detail";
    
    return cell;
}



@end
