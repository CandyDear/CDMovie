//
//  NewsImageViewController.m
//  CDMovie
//
//  Created by mac04 on 15/8/24.
//  Copyright (c) 2015年 mac04. All rights reserved.
//

#import "NewsImageViewController.h"
#import "BigImageViewController.h"

@interface NewsImageViewController ()<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
{
    UICollectionView *_imageCollectionView;
    NSMutableArray *_imageData;
    

}

@end

@implementation NewsImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadData];
    self.title = @"图片新闻";
    
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.minimumInteritemSpacing = 10;
    flowLayout.minimumLineSpacing = 10;
    flowLayout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
    CGFloat sizeWidth = (kScreenWidth - 10*5) / 4;
    flowLayout.itemSize = CGSizeMake(sizeWidth, sizeWidth);
    
    _imageCollectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:flowLayout];
    [self.view addSubview:_imageCollectionView];
    
    _imageCollectionView.dataSource = self;
    _imageCollectionView.delegate = self;
    
    [_imageCollectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    
    



    
    
}
-(void)loadData
{
    NSArray *array = [BaseJSON readJSONFile:@"image_list副本"];
    _imageData = [[NSMutableArray alloc] init];
    for(NSDictionary *dic in array)
    {
        NSString *urlString = dic[@"image"];
        NSURL *url = [NSURL URLWithString:urlString];
        [_imageData addObject:url];
        
    }
}

#pragma mark - UICollectionViewDataSource
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _imageData.count;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
//    cell.backgroundColor = [UIColor redColor];
    
    UIImageView *imageView = [[UIImageView alloc] init];
    cell.backgroundView = imageView;
    //placeholderImage:网络图片读取过程中 显示的默认图片
    UIImage *image = [UIImage imageNamed:@"more_select_setting"];
    [image stretchableImageWithLeftCapWidth:10 topCapHeight:10];
    [imageView sd_setImageWithURL:_imageData[indexPath.item] placeholderImage:image];
    //设置边框颜色
    cell.layer.borderColor = [UIColor purpleColor].CGColor;
    //设置边框宽度
    cell.layer.borderWidth = 3;
    //视图的圆角
    cell.layer.cornerRadius = 10;
    cell.layer.masksToBounds = YES;
    return cell;
}
#pragma mark - UICollectionViewDelegateFlowLayout
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    BigImageViewController *big = [[BigImageViewController alloc] init];
    //将图片传给下一个控制器
    big.bigImageData = _imageData;
    big.hidesBottomBarWhenPushed = YES;
    big.indexPath = indexPath;
    
    
    [self.navigationController pushViewController:big animated:YES];
    
}

//#pragma mark - tabBar的隐藏与显示
//
//- (void)viewWillDisappear:(BOOL)animated
//{
//    BaseTabBarController *tabBar = (BaseTabBarController *)self.tabBarController;
//    [tabBar setTabBarHidden:NO animation:YES];
//}
//- (void)viewWillAppear:(BOOL)animated
//{
//     BaseTabBarController*tabBar = (BaseTabBarController *)self.tabBarController;
//    [tabBar setTabBarHidden:YES animation:YES];
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
