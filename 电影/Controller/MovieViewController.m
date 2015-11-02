//
//  MovieViewController.m
//  CDMovie
//
//  Created by mac04 on 15/8/19.
//  Copyright (c) 2015年 mac04. All rights reserved.
//

#import "MovieViewController.h"
#import "Movie.h"
#import "MovieCell.h"
#import "PostCollectionView.h"
#import "HeadCollectionView.h"
#import "MovieCollectionView.h"
@interface MovieViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    UIButton *_rightButton;//导航栏右侧按钮
    
    UITableView *_listView;//列表视图
    UIView *_posterView;//海报视图
    UIView *_headView;//头部视图
    UIButton *_upDownButton;//下拉按钮
    UIView *_maskView;//遮罩视图
    PostCollectionView *_postCollectionView;
    HeadCollectionView *_headCollectionView;
    
    
    NSMutableArray *_movieData;
}

@end

@implementation MovieViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"封神榜";

    //创建右侧按钮
    [self _createRightButton];
    //加载数据
    [self loadData];
    //创建中间视图
    [self _createViews];
    //创建头部视图
    [self _createHeadViews];
    //添加KVO
    [self addKVO];
  
}
#pragma mark - addKVO
-(void)addKVO
{
    //KVO
    //给_headCollectionView 添加一个观察者
    [_headCollectionView addObserver:self forKeyPath:@"index" options:NSKeyValueObservingOptionNew context:nil];
    //给_postCollectionView添加一个观察者
    [_postCollectionView addObserver:self forKeyPath:@"index" options:NSKeyValueObservingOptionNew context:nil];
}
//观察者 发现 被观察者的属性发生变化时调用的方法
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    //获取变换后的index值
    NSNumber *itemNumber = change[@"new"];
    NSInteger itemIndex = [itemNumber integerValue];
    
    NSIndexPath *indexPath = [NSIndexPath indexPathForItem:itemIndex inSection:0];
    //判断被观察对象时哪一个
    if (object == _postCollectionView &&  indexPath.item != _headCollectionView.index )
    {
        //滑动_headCollectionView
        [_headCollectionView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
        _headCollectionView.index = indexPath.item;
    }
    else if (object == _headCollectionView && indexPath.item != _postCollectionView.index)
    {
        //滑动_postCollectionView
        [_postCollectionView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
        _postCollectionView.index = indexPath.item;
    }
    
}
-(void)dealloc
{
    [_postCollectionView removeObserver:self forKeyPath:@"index"];
    [_headCollectionView removeObserver:self forKeyPath:@"index"];
}

#pragma mark - loadData
-(void)loadData
{

   NSDictionary *dic = [BaseJSON readJSONFile:@"us_box"];
//    NSLog(@"%@",dic);
    //4.数据处理和储存
    NSArray *subjects = dic[@"subjects"];
    _movieData = [[NSMutableArray alloc] init];
    for(NSDictionary *dictionary in subjects)
    {
        Movie *movie = [Movie MovieWithContentsOfDictionary:dictionary[@"subject"]];
        [_movieData addObject:movie];
    }
    
     
    
}
#pragma mark - _createViews
-(void)_createViews
{
    _listView = [[UITableView alloc ] initWithFrame:self.view.bounds];
    _listView.dataSource = self;
    _listView.delegate = self;
//    _listView.backgroundColor = [UIColor redColor];
    [self.view addSubview:_listView];
    
    _posterView = [[UIView alloc] initWithFrame:self.view.bounds];
//    _posterView.backgroundColor = [UIColor greenColor];
    [self.view addSubview:_posterView];
    _posterView.hidden = YES;
    _postCollectionView = [[PostCollectionView alloc] initWithFrame:_posterView.bounds];
    
    //将电影的数据传给_postCollectionView
    _postCollectionView.movieData = _movieData;
    
    [_posterView addSubview:_postCollectionView];
}
-(void)_createHeadViews
{
    //遮罩视图
    _maskView = [[UIView alloc] initWithFrame:_posterView.bounds];
    _maskView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.5];
    _maskView.hidden = YES;
    [_posterView addSubview:_maskView];
    
    //给遮罩视图 添加单击手势
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(headViewUp)];
    [_maskView addGestureRecognizer:tap];
    
    //向下滑动手势
    UISwipeGestureRecognizer *swipeDown = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(headViewDown)];
    swipeDown.direction = UISwipeGestureRecognizerDirectionDown;
    [_posterView addGestureRecognizer:swipeDown];

    //向上滑动手势
    UISwipeGestureRecognizer *swipeUp = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(headViewUp)];
    swipeUp.direction = UISwipeGestureRecognizerDirectionUp;
    [_posterView addGestureRecognizer:swipeUp];
    
    //头部视图
    _headView = [[UIView alloc] initWithFrame:CGRectMake(0, 64 - 100, kScreenWidth, 130)];
    [_posterView addSubview:_headView];
    //读取图片，并且拉伸
    UIImage *indexBG = [UIImage imageNamed:@"indexBG_home"];
    indexBG = [indexBG stretchableImageWithLeftCapWidth:0 topCapHeight:5];
    
    //创建light
    UIImageView *lightLeft = [[UIImageView alloc] initWithFrame:CGRectMake(kScreenWidth/4 - 130*0.2  , 130/2, 60, 100)];
    lightLeft.image = [UIImage imageNamed:@"light"];
    [_posterView addSubview:lightLeft];
    UIImageView *lightRight = [[UIImageView alloc] initWithFrame:CGRectMake(kScreenWidth*3/4 - 130 * 0.2 + 10, 130/2, 60, 100)];
    lightRight.image = [UIImage imageNamed:@"light"];
    [_posterView addSubview:lightRight];
    
    //创建一个背景视图
    UIImageView *BGImageView = [[UIImageView alloc] initWithFrame:_headView.bounds];
    BGImageView.image = indexBG;
    [_headView addSubview:BGImageView];
    //==========================???==================
    //添加_headCollectionView
    _headCollectionView = [[HeadCollectionView alloc] initWithFrame:CGRectMake(0, -20, _headView.bounds.size.width, 130)];
    _headCollectionView.headMovieData = _movieData;
    [_headView addSubview:_headCollectionView];
    
    
    //创建下拉按钮
    _upDownButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _upDownButton.frame = CGRectMake(0, 0, 26, 20);
    _upDownButton.center = CGPointMake(kScreenWidth/2 + 3, 120);
    [_upDownButton setBackgroundImage:[UIImage imageNamed:@"light"] forState:UIControlStateSelected];
    [_upDownButton setImage:[UIImage imageNamed:@"down_home"] forState:UIControlStateNormal];
    [_upDownButton setImage:[UIImage imageNamed:@"up_home"] forState:UIControlStateSelected];
    [_upDownButton addTarget:self action:@selector(upDownButton:) forControlEvents:UIControlEventTouchUpInside];
    [_headView addSubview:_upDownButton];
    

    
}
#pragma mark -  _createRightButton
-(void)_createRightButton
{
    _rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _rightButton.frame = CGRectMake(0, 0, 49, 25);
    //按钮的背景图片
    [_rightButton setBackgroundImage:[UIImage imageNamed:@"exchange_bg_home"] forState:UIControlStateNormal];
    //按钮的内容图
    [_rightButton setImage:[UIImage imageNamed:@"list_home"] forState:UIControlStateNormal];
    
    [_rightButton setImage:[UIImage imageNamed:@"poster_home"] forState:UIControlStateSelected];
    
    [_rightButton addTarget:self
                     action:@selector(rightButtonAction:)
           forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithCustomView:_rightButton];
    self.navigationItem.rightBarButtonItem = rightItem;
    
}
#pragma mark - ButtonAction
-(void)rightButtonAction:(UIButton *)sender
{
    //选择翻转方向
    UIViewAnimationOptions option = sender.selected? UIViewAnimationOptionTransitionFlipFromLeft:UIViewAnimationOptionTransitionFlipFromRight;
    
    [self flipView:_rightButton options:option];
    [self flipView:self.view options:option];
    
    _rightButton.selected = !_rightButton.selected;
    _listView.hidden = !_listView.hidden;
    _posterView.hidden = !_posterView.hidden;
}
-(void)upDownButton:(UIButton *)sender
{
    if(sender.selected)
    {
        [self headViewUp];
    }
    else
    {
        [self headViewDown];
    }

}
#pragma mark - 遮罩视图的手势显示
-(void)headViewUp
{
    [UIView animateWithDuration:0.35 animations:^{
        _headView.top = -36;
        _upDownButton.selected = NO;
        _maskView.hidden = YES;
    }];

    
}

-(void)headViewDown
{
    [UIView animateWithDuration:0.35 animations:^{
        _headView.top = 64;
        _upDownButton.selected = YES;
        _maskView.hidden = NO;
    }];

}

#pragma mark -  自定义翻转
-(void)flipView:(UIView *)view options:(UIViewAnimationOptions )options
{
    [UIView transitionWithView:view
                      duration:.5
                       options:options
                    animations:^{
                        
                    }
                    completion:nil];

    
}
#pragma mark - UITableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 11;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //从闲置池中获取cell
    MovieCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MovieCell"];
    if(cell == nil)
    {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"MovieCell" owner:nil options:nil]lastObject];
    }
    // 将这个单元格所对应的电影对象 设置给单元格
    // 将一个电影对象 交给单元格去显示

    cell.movie = _movieData[indexPath.row];
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 110;
  
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
