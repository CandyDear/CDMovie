//
//  HeadCollectionView.m
//  CDMovie
//
//  Created by mac04 on 15/8/26.
//  Copyright (c) 2015年 mac04. All rights reserved.
//

#import "HeadCollectionView.h"
#import "HeadImageCell.h"

@interface HeadCollectionView()<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
//{
//    CGSize _itemSize;
//}
@end
@implementation HeadCollectionView

-(instancetype)initWithFrame:(CGRect)frame
{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    self.itemSize = CGSizeMake(frame.size.height * 0.6, frame.size.height * 0.9);
    layout.itemSize  = self.itemSize;
    layout.minimumInteritemSpacing = 10;
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    CGFloat x = (frame.size.width - frame.size.height * 0.5)/2;
    layout.sectionInset = UIEdgeInsetsMake(0, x, 0, x);
    self = [super initWithFrame:frame collectionViewLayout:layout];
    if (self)
    {
        self.dataSource = self;
        self.delegate = self;
        UINib *nib = [UINib nibWithNibName:@"HeadImageCell"  bundle:[NSBundle mainBundle]];
        [self registerNib: nib forCellWithReuseIdentifier:@"headCell"];

    }
    return self;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _headMovieData.count;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    HeadImageCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"headCell" forIndexPath:indexPath];
    
    cell.movie = _headMovieData[indexPath.item];
    return cell;
}
#pragma mark - UIScrollViewDelegate
-(void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset
{
    //获得视图停止后的偏移量
    CGFloat xOffset = targetContentOffset -> x;
    xOffset -= self.itemSize.width / 2;
    //根据偏移量 计算停止后 所在的页码
    NSInteger index = xOffset / (self.itemSize.width  + 10);
    
    if (xOffset > 0)
    {
        index += 1;
    }
    self.index = index;
//    NSLog(@"%li",_headIndex);
    //计算此页 显示在正中间时 滑动视图的 偏移量
    xOffset = index * (self.itemSize.width  + 10);
    //将计算所得的偏移量 设置给滑动视图
    targetContentOffset -> x = xOffset;
    

//    NSLog(@"%li",self.headIndex);
}
-(void) collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    //单元格滑动
    [collectionView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
    //改变_index
    self.index = indexPath.item;
}
@end
