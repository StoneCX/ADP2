//
//  MCCommendCell.m
//  ADPowerpart2
//
//  Created by chengxc on 2017/1/12.
//  Copyright © 2017年 chengxc. All rights reserved.
//

#import "MCCommendCell.h"

@interface MCCommendCell ()

@end

@implementation MCCommendCell

+ (instancetype)cellWithTableViw:(UITableView *)tableView{
    static NSString *identifier = @"commendCell";
    MCCommendCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil].firstObject;
    }
    return cell;
}

- (IBAction)playCountClick:(UIButton *)sender {
    if ([self.delegate respondsToSelector:@selector(playCountClick:)]) {
        [self.delegate playCountClick:sender];
    }
}
- (IBAction)commentClick:(UIButton *)sender {
    if ([self.delegate respondsToSelector:@selector(commentClick:)]) {
        [self.delegate commentClick:sender];
    }
}
- (IBAction)moreClick:(UIButton *)sender {
    if ([self.delegate respondsToSelector:@selector(moreClick:)]) {
        [self.delegate moreClick:sender];
    }
}
- (IBAction)brandButtonClick:(UIButton *)sender {
    if ([self.delegate respondsToSelector:@selector(brandButtonClick:)]) {
        [self.delegate brandButtonClick:sender];
    }
}

-(void)setFrame:(CGRect)frame {
    frame.origin.y += 10;
    frame.size.height-=10;
    frame.size.width-=10;
    frame.origin.x +=5;
    [super setFrame:frame];
}


@end
