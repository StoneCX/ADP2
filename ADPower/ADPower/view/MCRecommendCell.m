//
//  MCRecommendCell.m
//  ADPower
//
//  Created by chengxc on 2016/11/25.
//  Copyright © 2016年 chengxue. All rights reserved.
//

#import "MCRecommendCell.h"
#import "MCThemeViewModel.h"
#import "imagePartView.h"
#import "MCCommentView.h"

@interface MCRecommendCell ()

@property (nonatomic, strong) imagePartView *imagePart;
@property (nonatomic, strong) MCCommentView *commentView;

@end
@implementation MCRecommendCell

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        //NSLog(@"%s",__func__);
    }
    return self;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        imagePartView *imagePart = [imagePartView viewForXib];
        MCCommentView *commentView = [MCCommentView viewForXib];
        [self.contentView addSubview:imagePart];
        [self.contentView addSubview:commentView];
        
        _commentView = commentView;
        _imagePart = imagePart;
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
    
}

- (void)setViewModel:(MCThemeViewModel *)viewModel{
    _viewModel = viewModel;
    _viewModel.item = viewModel.item;
    _imagePart.frame = viewModel.imageViewFrame;
    _commentView.frame = viewModel.commentViewFrame;
    
}

@end
