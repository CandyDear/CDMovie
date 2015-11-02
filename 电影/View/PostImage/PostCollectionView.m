//
//  PostCollectionView.m
//  CDMovie
//
//  Created by mac04 on 15/8/26.
//  Copyright (c) 2015年 mac04. All rights reserved.
//

#import "PostCollectionView.h"
#import "PostCell.h"
@interface PostCollectionView()<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@end
@implementation PostCollectionView
-(instancetype)initWithFrame:(CGRect)frame
{
    //创建布局对象
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    //单元格的大小
    layout.itemSize = CGSizeMake(frame.size.width * 0.6, frame.size.height * 0.6);
    layout.minimumInteritemSpacing = 10;
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    layout.sectionInset = UIEdgeInsetsMake(0, frame.size.width * 0.2, 0, frame.size.width * 0.2);
    self = [super initWithFrame:frame collectionViewLayout:layout];
    if(self)
    {
        self.dataSource = self;
        self.delegate = self;
        
        self.showsHorizontalScrollIndicator = NO;
        //注册单元格
        UINib *nib = [UINib nibWithNibName:@"PostCell" bundle:[NSBundle mainBundle]];
        [self registerNib:nib forCellWithReuseIdentifier:@"postCell"];
       
        
    }
    return self;
    
    
}
#pragma mark - UICollectionViewDataSource
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _movieData.count;
    
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    PostCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"postCell" forIndexPath:indexPath];
//    cell.backgroundColor = [UIColor redColor];
    
    cell.movie = _movieData[indexPath.item];
    return cell;
    
}
#pragma mark - UIScrollViewDelegate
/**
 *  滑动视图 即将结束拖拽时 调用的代理方法
 *
 *  @param scrollView          滑动视图
 *  @param velocity            手指离开屏幕时，视图滑动的速度
 *  @param targetContentOffset 滑动结束之后 视图的偏移量
 */
-(void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset
{
//    NSLog(@"velocity = %f",velocity.x);
    //targetContentOffset 指向结构体的指针 要使用->来访问里面的变量
//    NSLog(@"targetContentOffset = %f",targetContentOffset -> x);
    /**
     *  实现自定义的分页效果
     *  1.获得视图停止后的偏移量x
     *  2.根据偏移量 计算停止之后 所在的页码
     *  3.计算此页 显示在正中间时 滑动视图的 偏移量
     *  4.将计算所得的偏移量 设置给滑动视图
     */
    //1.
   CGFloat xOffset = targetContentOffset -> x ;
    xOffset -= scrollView.width * 0.3;
    //2.
     NSInteger index = xOffset / (scrollView.width * 0.6 + 10);
    if(xOffset > 0)
    {
        index += 1;
    }
    self.index = index;
    
//    NSLog(@"%li",index);
    //3.
    xOffset  = index *(scrollView.width *0.6 + 10);
    //4.
    targetContentOffset -> x = xOffset;
   
//    NSLog(@"post = %li",self.postIndex);
    
 
}
#pragma mark - UICollectionViewDelegateFlowLayout
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    //根据偏移量 计算正中间单元格的索引
    NSInteger index = collectionView.contentOffset.x/(collectionView.width * 0.6 + 10);
    //判断选中的单元格 是不是正中间的单元格
    if(indexPath.item == index)
    {
        //1.YES 翻转这个单元格
        PostCell *cell = (PostCell *)[collectionView cellForItemAtIndexPath:indexPath];
        [cell filpCell];
    }
    else
    {
        //2. NO 将这个单元格 移动到正中间 将前一个单元格翻转回来
        [collectionView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
        //改变_index
        self.index = indexPath.item;
        //将前一个单元格 翻转回来
        PostCell *cell = (PostCell *)[collectionView cellForItemAtIndexPath:[NSIndexPath indexPathForItem:index inSection:0]];

        [cell backCell];
    }

}
- (void)collectionView:(UICollectionView *)collectionView didEndDisplayingCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath
{
    PostCell *postCell = (PostCell *)cell;
    [postCell backCell];
    
}


@end
