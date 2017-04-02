//
//  MCBrandShowController.m
//  ADPowerpart2
//
//  Created by chengxc on 2017/3/10.
//  Copyright © 2017年 chengxc. All rights reserved.
//

#import "MCBrandShowController.h"
#import "MCCollectionViewCell.h"

@interface MCBrandShowController ()

@end
#define KNumberOfItems 4
@implementation MCBrandShowController

static NSString * const reuseIdentifier = @"collectionCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    //[self configFlowLayout];
    // Register cell classes
    //[self.collectionView]
    [self.collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([MCCollectionViewCell class]) bundle:nil] forCellWithReuseIdentifier:reuseIdentifier];
    
    // Do any additional setup after loading the view.
}


/*
- (void)configFlowLayout {
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.minimumLineSpacing = 0;
    flowLayout.minimumInteritemSpacing = 0;
    CGFloat width = (self.view.superview.width / KNumberOfItems);
    CGFloat height = self.view.superview.height;
    flowLayout.itemSize = CGSizeMake(width, height);
    
    self.collectionView.collectionViewLayout = flowLayout;
}
 */

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    return 4;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    MCCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"loop_tu1"]];
    cell.imageView = imageView;
    cell.label.text = @"XXX专场";
    
    return cell;
}


#pragma mark <UICollectionViewDelegate>

/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

@end
