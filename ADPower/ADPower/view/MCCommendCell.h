//
//  MCCommendCell.h
//  ADPowerpart2
//
//  Created by chengxc on 2017/1/12.
//  Copyright © 2017年 chengxc. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol MCCommendCellDelegate <NSObject>

- (void)playCountClick:(UIButton *)button;
- (void)commentClick:(UIButton *)button;
- (void)moreClick:(UIButton *)button;

- (void)brandButtonClick:(UIButton *)button;

@end
@interface MCCommendCell : UITableViewCell

@property (nonatomic, weak) id<MCCommendCellDelegate> delegate;
@property (weak, nonatomic) IBOutlet UIView *brandView;
@property (weak, nonatomic) IBOutlet UIView *infoView;
//视屏cell数据
@property (weak, nonatomic) IBOutlet UIImageView *previewImage;
@property (weak, nonatomic) IBOutlet UILabel *totalBonus;
@property (weak, nonatomic) IBOutlet UILabel *highest;
@property (weak, nonatomic) IBOutlet UILabel *period;
@property (weak, nonatomic) IBOutlet UILabel *slogan;
//评论

@property (weak, nonatomic) IBOutlet UIButton *brandButton;
@property (weak, nonatomic) IBOutlet UIImageView *hotImage;
@property (weak, nonatomic) IBOutlet UIButton *PlayCount;
@property (weak, nonatomic) IBOutlet UIButton *commentCount;


+ (instancetype)cellWithTableViw:(UITableView *)tableView;

@end
