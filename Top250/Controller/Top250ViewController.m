//
//  Top250ViewController.m
//  CDMovie
//
//  Created by mac04 on 15/8/19.
//  Copyright (c) 2015年 mac04. All rights reserved.
//

#import "Top250ViewController.h"
#import "Movie.h"
#import "TopCell.h"
#import "MovieDetailViewController.h"


@interface Top250ViewController ()<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
{
    NSMutableArray *_topData;
}

@end

@implementation Top250ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"Top250";
    
    [self loadData];
    
}
#pragma mark - 加载数据
-(void)loadData
{
   NSDictionary *dic = [BaseJSON readJSONFile:@"top250"];
    _topData = [[NSMutableArray alloc] init];
    for (NSDictionary *dictionary in dic[@"subjects"])
    {
        Movie *movie = [[Movie alloc ] initWithContentsOfDictionary:dictionary];
        [_topData addObject:movie];
    }
}
#pragma mark - UICollectionViewDataSource
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _topData.count;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    TopCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"topCell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor yellowColor];
    cell.movie = _topData[indexPath.item];

    return cell;
}
#pragma mark - UICollectionViewDelegateFlowLayout
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat itemWidth = (kScreenWidth - 10 * 4)/3;
    CGFloat itemHeight = itemWidth * 1.3;
    return CGSizeMake(itemWidth, itemHeight);
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    //从故事版中获取视图控制器
    //1.获取故事版对象
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    //2.从故事版中获取视图控制器
    //    - (id)instantiateInitialViewController;／／获取一个故事版的入口
    //    - (id)instantiateViewControllerWithIdentifier:(NSString *)identifier;//获取某个id的视图控制器

    MovieDetailViewController *detail = [storyboard instantiateViewControllerWithIdentifier:@"detail"];

    detail.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:detail animated:YES];
}





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
