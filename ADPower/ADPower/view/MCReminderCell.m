//
//  MCReminderCell.m
//  ADPower
//
//  Created by chengxc on 2016/11/27.
//  Copyright © 2016年 chengxue. All rights reserved.
//

#import "MCReminderCell.h"

@interface MCReminderCell ()
@property (weak, nonatomic) IBOutlet UIImageView *avator;
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *detail;
@property (weak, nonatomic) IBOutlet UILabel *time;
@property (weak, nonatomic) IBOutlet UILabel *timeDescribe;


@end
@implementation MCReminderCell

- (instancetype)init{
    self = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil].firstObject;
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    [self.avator.layer setCornerRadius:20];
    [self.avator.layer setMasksToBounds:YES];
}
- (IBAction)isReminder:(UISwitch *)sender {
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
}

@end
