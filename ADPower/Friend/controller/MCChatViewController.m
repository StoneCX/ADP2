//
//  MCChatViewController.m
//  ADPowerpart2
//
//  Created by chengxc on 2017/1/4.
//  Copyright © 2017年 chengxc. All rights reserved.
//

#import "MCChatViewController.h"
#import "MCChatCell.h"
#import "PYSearch.h"
#import "UIColor+MCColor.h"
#import "MCChatViewDetailVC.h"

@interface MCChatViewController ()

@end

#define chatRowHeight 60

@implementation MCChatViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  
    
    self.view.backgroundColor = [UIColor colorWithHexadecimal:@"#EDEDED"];
    
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([MCChatCell class]) bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"reuseCell"];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 15;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"reuseCell" forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return chatRowHeight;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    //UISearchBar *searchbar = [[UISearchBar alloc] init];
    PYSearchViewController *searchVC = [[PYSearchViewController alloc] init];
    searchVC.searchBar.frame = CGRectMake(10, 5, SCREENW - 20, 23);
    //searchVC.searchBar.barStyle = UIBarStyleBlack;
    //searchVC.searchBar.backgroundColor = [UIColor colorWithHexadecimal:@"#EDEDED"];
    return searchVC.searchBar;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 33;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MCChatViewDetailVC" bundle:nil];
    
    MCChatViewDetailVC *chatvc = [storyboard instantiateInitialViewController];
    [self.navigationController pushViewController:chatvc animated:YES];
}
@end
