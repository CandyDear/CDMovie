//
//  BigImageViewController.m
//  CDMovie
//
//  Created by mac04 on 15/8/25.
//  Copyright (c) 2015年 mac04. All rights reserved.
//

#import "BigImageViewController.h"
#import "BigImageCell.h"
@interface BigImageViewController ()<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
{
    UICollectionView *_bigImageCollection;
    BOOL _isHidden;//是否隐藏
}
@end

@implementation BigImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _isHidden = NO;//设置为不隐藏
    self.view.backgroundColor = [UIColor blackColor];
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 80, 30)];
    titleLabel.text = @"图片浏览";
    titleLabel.textColor = [UIColor whiteColor];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    
    self.navigationItem.titleView = titleLabel;
    
    [self _createView];
    
    //根据纪录的单元格索引 来显示那个单元格
    [_bigImageCollection scrollToItemAtIndexPath:_indexPath atScrollPosition:UICollectionViewScrollPositionLeft animated:NO];
    //接受消息
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(hiddenNaviBar) name:@"tap" object:nil];
   
}
// 取消通知
-(void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
#pragma mark - 隐藏导航栏和状态栏
-(void)hiddenNaviBar
{
    _isHidden = !_isHidden;
    //在视图控制器中 隐藏导航栏的方法
    [self.navigationController setNavigationBarHidden:_isHidden animated:NO];
    //隐藏状态栏
    UIApplication *app = [UIApplication sharedApplication];
    [app setStatusBarHidden:_isHidden];
}
-(void)_createView
{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    //设置单元格的水平间隙
    layout.minimumInteritemSpacing = 10;
    layout.itemSize = CGSizeMake(kScreenWidth, kScreenHeight - 64);
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    layout.sectionInset = UIEdgeInsetsMake(-20, 0, 0, 10);
    _bigImageCollection = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 44, kScreenWidth + 10, kScreenHeight - 15)  collectionViewLayout:layout];
    [self.view addSubview:_bigImageCollection];
    _bigImageCollection.dataSource = self;
    _bigImageCollection.delegate = self;
    [_bigImageCollection registerClass:[BigImageCell class] forCellWithReuseIdentifier:@"bigImageCell"];
    //隐藏滑块
    _bigImageCollection.showsHorizontalScrollIndicator = NO;
    //开启分页效果
    _bigImageCollection.pagingEnabled = YES;
}
#pragma mark - UICollectionViewDataSource
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _bigImageData.count;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    BigImageCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"bigImageCell" forIndexPath:indexPath];
//    cell.backgroundColor = [UIColor orangeColor];
    //传入图片数据
    cell.imageURL = _bigImageData[indexPath.item];
    return cell;
}
#pragma mark - UICollectionViewDelegateFlowLayout
/**
 *  当某个单元格 结束显示时调用的方法
 *
 *  @param collectionView
 *  @param cell           结束显示的单元格
 *  @param indexPath      索引路径
 */
-(void)collectionView:(UICollectionView *)collectionView didEndDisplayingCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath
{
    BigImageCell *big = (BigImageCell *)cell;
    [big backImageZoomingScale];
}
//#pragma mark - 隐藏与显示tabBar
//- (void)viewWillDisappear:(BOOL)animated
//{
//    BaseTabBarController *base = (BaseTabBarController *)self.tabBarController;
//    [base setTabBarHidden:NO];
//}
//
//
//
//- (void)viewWillAppear:(BOOL)animated
//{
//    BaseTabBarController *main = (BaseTabBarController *)self.tabBarController;
//    [main setTabBarHidden:YES animation:YES];
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
